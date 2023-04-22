import 'dart:async';
import 'dart:collection';
//import 'package:firebase_core/firebase_core.dart';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:main_venture/feat_screens/Dialogbutton.dart';
// import 'package:main_venture/feat_screens/layer_simulation.dart';
import 'package:main_venture/feat_screens/profilenav.dart';
// import 'package:main_venture/feat_screens/requesting.dialog.dart';
import 'package:main_venture/feat_screens/zonecreen.dart';
import 'package:main_venture/models/auto_complete_results.dart';
import 'package:main_venture/providers/search_places.dart';
import 'package:main_venture/services/maps_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_geocoding/google_geocoding.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:place_picker/place_picker.dart';
import '../feat_screens/requesting_dialog.dart';
import '../onboarding_screens/discover.dart';
import '../userInfo.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with Userinformation {
  final Completer<GoogleMapController> _controller = Completer();
  final Future<bool> _mapFuture =
  Future.delayed(const Duration(milliseconds: 1000), () => true);

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor primaryMarker = BitmapDescriptor.defaultMarker;

//Debounce to throttle async calls during search
  Timer? _debounce;

// toggling Ui as we need
  bool searchToggle = true;
//
//  bool searchToggle = false;
  bool radiusSlider = false;
  bool cardTapped = false;
  bool pressedNear = false;
  bool getDirections = false;
  // bool getmarker = true;

  // for boundary error
  var warning = const SnackBar(
    content: Text(
        'No marker data is available for this area! please submit a request'),
  );
  var map_pinnedLoc = const SnackBar(
// <<<<<<< HEAD
    content: Text(
        'You cant request for this restricted location. Please choose other locations to request for pinning'),
// =======
    // content: Text('This Area have Establishment, Please tap other Area'),
// >>>>>>> 0d93212a53365f07b5bddcd5ad8c2c5a2a27d2c0
  );

// Markers set
  Set<Marker> allmarkers = <Marker>{};
  Set<Marker> _markers = <Marker>{};
  final Set<Marker> markcount = <Marker>{};

  // Set<Marker> allmarkers = HashSet<Marker>();

  Map<MarkerId, Marker> _mapmarker = <MarkerId, Marker>{};

  //Map<MarkerId, Marker> _markerss = <MarkerId, Marker>{};
  Set<Polyline> _polylines = Set<Polyline>();
  int markerIdCounter = 1;
  int polylineIdCounter = 1;
  String assre = '';
// Text Editing Controllers
  TextEditingController searchController = TextEditingController();
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  FirebaseFirestore database =
      FirebaseFirestore.instance; //instance of firestore
// initial map position on load
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.777149, 121.043023),
    zoom: 18,
  );

  @override
  void initState() {
    userinfoFirestore();
    addCustomIconMarker();
    // getBusiness();
    //run the function before the map loads
    super.initState();
  }

  void _setMarker(point) {
    var counter = markerIdCounter++;

    final Marker marker = Marker(
        markerId: MarkerId('marker_$counter'),
        position: point,
        onTap: () {},
        icon: BitmapDescriptor.defaultMarker);
    setState(() {
      _markers.add(marker);
    });
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$polylineIdCounter';

    polylineIdCounter++;

    _polylines.add(Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: Colors.blue,
        points: points.map((e) => LatLng(e.latitude, e.longitude)).toList()));
  }
  //bool  markerOnClick = true;
  //converting custom icon marker to bytes
  void addCustomIconMarker() {
    String assetpicture = "assets/images/icons/venture.png";
    String assetspin = "assets/images/icons/pinBuildingIcon.png";

    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), assetpicture)
        .then((icon) => setState(() {
      markerIcon = icon;
    }));

    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), assetspin)
        .then((primaryicon) => setState(() {
      primaryMarker = primaryicon;
    }));
  }

  List<DropdownData> dropdownDatas = [];
  List<DropdownDataAssumption> dropdownAssumption = [];

  Future getBusiness() async {
    await FirebaseFirestore.instance
        .collection("business")
        .get()
        .then((QuerySnapshot snapshot) => {
      snapshot.docs.forEach((documents) async {
        var data = documents.data() as Map;

        //var data = documents.data() as Map;

        dropdownDatas.add(DropdownData(nameofbusiness: documents.id));
        dropdownAssumption.add(
            DropdownDataAssumption(budgetassump: data['budgetassump']));

        //  debugPrint(data['budgetassump']);
      })
    });

    //  await FirebaseFirestore.instance.collection("assumptions").doc("budgetassump").get();
  }

  //this is the function for getting the users info in firestore
  Future userinfoFirestore() async {
/*     Stream<DocumentSnapshot> usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(GoogleUserStaticInfo().uid)
        .snapshots();
    usersStream.map(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        UserInfofirstname = data['firstname'];
        UserInfolastname = data['lastname'];
      },
    ); */

    final docRef = database.collection("users").doc(GoogleUserStaticInfo().uid);
    docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // ...
        UserInfofirstname = data['firstname'];
        UserInfolastname = data['lastname'];
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

//Show marker from the firestore database
/*   Future getMarkerData() async {
    await database
        .collection("markers")
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((documents) async {
                var data = documents.data() as Map;
                allmarkers.add(Marker(
                    onTap: () async {
                      await DialogQuestion(documents.id).showMyDialog(context);
                    },
                    infoWindow: InfoWindow(
                      title: data["place"],
                    ),
                    markerId: MarkerId(documents.id),
                    icon: markerIcon,
                    position: LatLng(
                        data["coords"].latitude, data["coords"].longitude)));
              })
            });
    setState(() {
      allmarkers;
    });
    return allmarkers;
  } */

  Future testMarker() async {
    await FirebaseFirestore.instance
        .collection("markers")
        .where("request_status", isEqualTo: true)
        .get()
        .then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((documents) async {
        var data = documents.data() as Map;

        /*   print(data["coords"].latitude);
                print(data["coords"].longitude); */

        allmarkers.add(Marker(
            onTap: () async {
              /*  await DialogQuestion(
                              documents.id, dropdownDatas, dropdownAssumption)
                          .showMyDialog(context); */
            },
            infoWindow: InfoWindow(
              title: data["place"],
            ),
            markerId: MarkerId(documents.id),
            icon: markerIcon,
            position: LatLng(
                data["coords"].latitude, data["coords"].longitude)));
      })
    });

    setState(() {
      allmarkers;
    });

    return allmarkers;

    /*    await FirebaseFirestore.instance
        .collection("markers")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((documents) async {
                var data = documents.data() as Map;
                await allmarkers.add(Marker(
                    onTap: () async {
                      await DialogQuestion(data['id']).showMyDialog(context);
                    },
                    infoWindow: InfoWindow(title: data["place"]),
                    markerId: MarkerId(data["id"]),
                    icon: markerIcon,
                    position: LatLng(
                        data["coords"]!.latitude, data["coords"]!.longitude)));
              })
            });
    setState(() {
      allmarkers;
      print(allmarkers.toString());
    }); */
  }

  Future gettingZoneMarkers(latitude, longitude) async {
    var greatercoordinates = GeoPoint(latitude, longitude);

    //east
    if (greatercoordinates.longitude > 121.09) {
      ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
    }
    // west
    else if (greatercoordinates.longitude < 120.96) {
      ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
    }
    // north
    else if (greatercoordinates.latitude > 14.78) {
      ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
    }

    // south
    else if (greatercoordinates.latitude < 14.62) {
      ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
    } else {
      // debugPrint(greatercoordinates.latitude.toString());

      await FirebaseFirestore.instance
          .collection("map_pinnedLocation")
          .get()
          .then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((documents) async {
          var data = documents.data() as Map;
          // var lati = data["address"].latitude+.1;
          // var latit = data["address"].latitude.length-1+.1;
          // var long = data["address"].longitude+.1;
          // 14 >= 13
          // 14 <= 15
          // if( (greatercoordinates.latitude <= ( data["address"].latitude) || greatercoordinates.latitude <= ( lati)) && (greatercoordinates.longitude <= ( data["address"].longitude) || greatercoordinates.longitude <= (long ))){
          //   // ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
          if (greatercoordinates.longitude > 121.09) {
            ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
          }
          // west
          else if (greatercoordinates.longitude < 120.96) {
            ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
          }
          // north
          else if (greatercoordinates.latitude > 14.78) {
            ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
          }

          // south
          else if (greatercoordinates.latitude < 14.62) {
            ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
          } else {
            // testMarker();
            showMarkers(greatercoordinates);
          } // else end
        }) //for loop
      });
    } //else end
  }

  // showing markers
  Future showMarkers(greatercoordinates) async {
    // debugPrint(greatercoordinates.latitude.toString());
    // ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    //     content: Text(
    //         data["coords"].latitude.toString()
    //     ) )
    // );

    /*   Query namequery = FirebaseFirestore.instance
        .collection("markers")
        .where("request_status", isEqualTo: true)
        .where("coords", isGreaterThanOrEqualTo: greatercoordinates);
 */
    await FirebaseFirestore.instance
        .collection("markers")
    //   .where("request_status", isEqualTo: true)
        .where("coords", isGreaterThanOrEqualTo: greatercoordinates)
    //.orderBy("coords", descending: true)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((documents) async {
        var data = documents.data() as Map;
        // ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        //     content: Text(
        //         data["coords"].latitude.toString()
        //             +"\n"+ greatercoordinates.latitude.toString()
        //     ) )
        // );
        if (data['request_status'] == true) {
          //debugPrint("theres data");

          allmarkers.add(Marker(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ZoneScreen(
                          dataID: documents.id,
                          coordinates_latitude:
                          data["coords"].latitude,
                          coordinates_longitude:
                          data["coords"].longitude,
                          place: data["place"],
                          population: data["population"],
                          revenue: data["revenue"],
                          land_size: data["land_size"],
                        )));
              },
              infoWindow: InfoWindow(
                title: data["place"],
              ),
              markerId: MarkerId(documents.id),
              icon: markerIcon,
              position: LatLng(
                  data["coords"].latitude, data["coords"].longitude)));
        } else {
          // debugPrint("no data");
        }
      })
    });

    await FirebaseFirestore.instance
        .collection("markers")
        .where("coords", isLessThanOrEqualTo: greatercoordinates)
    //  .where("request_status", isEqualTo: true)
        .orderBy("coords", descending: true)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((documents) async {
        var data = documents.data() as Map;
        if (data['request_status'] == true) {
          allmarkers.add(Marker(
              onTap: () async {
                /* await DialogQuestion(
                              documents.id, dropdownDatas, dropdownAssumption)
                           .showMyDialog(context); */
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ZoneScreen(
                          dataID: documents.id,
                          coordinates_latitude:
                          data["coords"].latitude,
                          coordinates_longitude:
                          data["coords"].longitude,
                          place: data["place"],
                          population: data["population"],
                          revenue: data["revenue"],
                          land_size: data["land_size"],
                        )));
              },
              infoWindow: InfoWindow(
                title: data["place"],
              ),
              markerId: MarkerId(documents.id),
              icon: markerIcon,
              position: LatLng(
                  data["coords"].latitude, data["coords"].longitude)));
        } else {
          // debugPrint("no data");
        }
      })
    });

    setState(() {
      allmarkers;
    });

    return allmarkers;
  }

  final StreamController<Set<Marker>> _markerStreamController =
  StreamController<Set<Marker>>.broadcast();
  Stream<Set<Marker>> get markerStream => _markerStreamController.stream;

  void markerOnClick(double lat, double lng) {
    var counter = markerIdCounter++;
    var greatercoordinates = GeoPoint( lat,  lng);

    String trimminglat = lat.toStringAsFixed(7);
    String trimminglong = lng.toStringAsFixed(7);
    double trimmedlat = double.parse(trimminglat); //
    double trimmedlong = double.parse(trimminglong); //

    if (greatercoordinates.longitude > 121.09) {
      ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
    }
    // west
    else if (greatercoordinates.longitude < 120.96) {
      ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
    }
    // north
    else if (greatercoordinates.latitude > 14.78) {
      ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
    }

    // south
    else if (greatercoordinates.latitude < 14.62) {
      ScaffoldMessenger.of(context).showSnackBar(map_pinnedLoc);
    }

    else {
      final Marker markerparams = Marker(
          markerId: MarkerId('marker_$counter'),
          position: LatLng(lat, lng),
          onTap: () async {
            await RequestedDialog(trimmedlat, trimmedlong, allmarkers, markcount,
                counter, _markerStreamController)
                .showMyDialog(context);
          },
          icon: primaryMarker);
      gettingZoneMarkers(trimmedlat, trimmedlong);

      // debugPrint(lat.toString());

      setState(() {
        if (markcount.length >= 5) {
          allmarkers.removeWhere((element) =>
          element.markerId == MarkerId(markcount.first.markerId.value));

          // debugPrint(markcount.length.toString());
          showAlertDialog(context);

          if(markcount.length>= 6){
            markcount.removeWhere((element) =>
            element.markerId == MarkerId(markcount.first.markerId.value));

            allmarkers.clear();
          }
        }
       else {
          //  savedClickMarkers(saveClickBusiness);
          //debugPrint(markcount.toString());
          markcount.add(markerparams);
          allmarkers.add(markerparams);

          _markerStreamController.add(allmarkers);

          //allmarkers.add(markerparams);
        }
      });
    }}

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Information'),
          content: const Text('The Request is limited only to 5 markers'),
          actions: [
            TextButton(
              child: const Text('I understand'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  Widget builds(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 150.0, 15.0, 5.0),
      child: AlertDialog(
        title: const Text("Alert Dialog Box"),
        content: const Text("You have raised a Alert Dialog Box"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop;
            },
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text("okay"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final _mapFuture =
    Future.delayed(const Duration(milliseconds: 250), () => true);

    //Providers
    final allSearchResults = ref.watch(placeResultsProvider);
    final searchFlag = ref.watch(searchToggleProvider);
    /* return FutureBuilder(
      future: testMarker(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.hasData == false) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } */

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    // markers: _markerss,
                    onTap: (latLng) {
                      markerOnClick(latLng.latitude, latLng.longitude);
                    },
                    markers: allmarkers,
                    polylines: _polylines,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                pressedNear
                    ? builds(context)
                    : searchToggle
                    ? Padding(
                  padding: const EdgeInsets.fromLTRB(
                      15.0, 70.0, 15.0, 5.0),
                  child: Column(children: [
                    Container(
                      height: 50.0,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                        ),
                        onChanged: (value) {
                          if (_debounce?.isActive ?? false) {
                            _debounce?.cancel();
                          }
                          _debounce =
                              Timer(const Duration(milliseconds: 700),
                                      () async {
                                    if (value.length > 2) {
                                      if (!searchFlag.searchToggle) {
                                        searchFlag.toggleSearch();
                                        _markers = {};
                                      }
                                      List<AutoCompleteResult> searchResults =
                                      await MapServices()
                                          .searchPlaces(value);

                                      allSearchResults
                                          .setResults(searchResults);
                                    } else {
                                      List<AutoCompleteResult> emptyList = [];
                                      allSearchResults.setResults(emptyList);
                                    }
                                  });
                        },
                      ),
                    ),
                  ]),
                )
                    : Container(),
                searchFlag.searchToggle
                    ? allSearchResults.allReturnedResults.isNotEmpty
                    ? Positioned(
                    top: 100.0,
                    left: 15.0,
                    child: Container(
                      height: 200.0,
                      width: screenWidth - 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.7),
                      ),
                      child: ListView(
                        children: [
                          ...allSearchResults.allReturnedResults
                              .map((e) => buildListItem(e, searchFlag))
                        ],
                      ),
                    ))
                    : Positioned(
                    top: 100.0,
                    left: 15.0,
                    child: HomeNoResultToShow(
                        screenWidth: screenWidth,
                        searchFlag: searchFlag))
                    : Container(),
                //    getmarker(context), //to automatically show marker to map
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Column(
        children: [
          const SizedBox(height: 30),

          FloatingButtonUserProfile(
              UserInfofirstname: UserInfofirstname,
              UserInfolastname:
              UserInfolastname), //breaking the Widget of floating button and passing the data from the stateless widget below
          // const HomeFloatingDialog(),
          FloatingActionButton(
            disabledElevation: 0,
            elevation: 0.0,
            backgroundColor: Colors.white,
            mini: true,
            heroTag: null,
            child: const Icon(Icons.info),
            foregroundColor: Colors.blue,
            onPressed: () {
              Discover().showDiscover(context);
            },
          ),
          FloatingActionButton(
            disabledElevation: 0,
            elevation: 0.0,
            backgroundColor: Colors.white,
            mini: true,
            heroTag: null,
            child: const Icon(Icons.home_work_outlined),
            foregroundColor: Colors.blue,
            onPressed: () {
              goToWebPage(
                  "https://play.unity.com/mg/other/webgl-builds-329405");
              // Discover().showDiscover(context);
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
    // },
    // );
  }

  /* void _showAction(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => Settings(),
    );
  } */

  gotoPlace(double lat, double lng, double endLat, double endLng,
      Map<String, dynamic> boundNe, Map<String, dynamic> boundSw) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(boundSw['lat'], boundSw['lng']),
            northeast: LatLng(boundNe['lat'], boundNe['lng'])),
        25));

    _setMarker(LatLng(lat, lng));
  }

  Future<void> gotoSearchedPlace(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));

    _setMarker(LatLng(lat, lng));
  }

  Widget buildListItem(AutoCompleteResult placeItem, searchFlag) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTapDown: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () async {
          var place = await MapServices().getPlace(placeItem.placeId);
          gotoSearchedPlace(place['geometry']['location']['lat'],
              place['geometry']['location']['lng']);
          searchFlag.toggleSearch();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Colors.green, size: 25.0),
            const SizedBox(width: 4.0),
            Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width - 75.0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(placeItem.description ?? ''),
              ),
            )
          ],
        ),
      ),
    );
  }

//
/*  int markerIdCounter = 0;
  Set<Marker> marksman = Set<Marker>();
  Future saveLoc(data) async {
    try {
      await FirebaseFirestore.instance.collection("savedPlaces").add(data).then(
          (documentSnapshot) =>
              print("added data with ID: ${documentSnapshot.id}"));
    } on FirebaseException catch (e) {
      print('Adding data exception: ${e.message}');
    }
  }
  void _setMarker(double lat, double lng) {
    var counter = markerIdCounter++;
    MarkerId mid = MarkerId('marker_$counter');
    final Marker marker = Marker(
        markerId: mid,
        position: LatLng(lat, lng),
        onTap: () async {
          List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
          await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Save location'),
                  content: SingleChildScrollView(
                    child: ListBody(children: <Widget>[
                      Text('Location: ${placemarks[0]}'),
                    ]),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          final data = {
                            "Administrative area":
                                placemarks[0].administrativeArea,
                            "country": placemarks[0].country,
                            "ISO country Code": placemarks[0].isoCountryCode,
                            "Locality": placemarks[0].locality,
                            "Name": placemarks[0].name,
                            "Postal Code": placemarks[0].postalCode,
                            "Street": placemarks[0].street,
                            "Sub Administrative area":
                                placemarks[0].subAdministrativeArea,
                            "Sub locality": placemarks[0].subLocality
                          };
                          saveLoc(data);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Location saved')));
                        },
                        child: const Text('Save')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'))
                  ],
                );
              });
        },
        icon: BitmapDescriptor.defaultMarker);
    setState(() {
      marksman.add(marker);
    });
  }
  void _setPolyline() {}
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //Providers
    final allSearchResults = ref.watch(placeResultsProvider);
    final searchFlag = ref.watch(searchToggleProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: const CameraPosition(
                bearing: 0.0,
                target: LatLng(16.0, 121.0),
                tilt: 0.0,
                zoom: 0.0),
            compassEnabled: false,
            mapToolbarEnabled: false,
            mapType: MapType.normal,
            onLongPress: (LatLng) {
              _setMarker(LatLng.latitude, LatLng.longitude);
            },
            onTap: (LatLng) {
              print(
                  'Latitude: ${LatLng.latitude}, Longitude: ${LatLng.longitude}');
            },
            markers: marksman,
          ),
        ),
      ),
    );
  }*/
}

class FloatingButtonUserProfile extends StatelessWidget {
  FloatingButtonUserProfile({
    super.key,
    required this.UserInfofirstname,
    required this.UserInfolastname,
  });

  final String UserInfofirstname,
      UserInfolastname; //parameter to pass data from the stateless widget

  final Stream<DocumentSnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(GoogleUserStaticInfo().uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: usersStream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.hasData == false) {
            return const CircularProgressIndicator.adaptive();
          }
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return FloatingActionButton(
            disabledElevation: 0,
            elevation: 0.0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            heroTag: null,
            mini: true,
            child: Profile().profile == null
                ? const Image(image: AssetImage('assets/images/pic.png'))
                : Image.network(Profile().profile ?? ""),
            onPressed: () {
              ProfileNav(
                  firstname: data['firstname'], lastname: data['lastname'])
                  .showProfileNav(context);
              //parameter : data from firestore //pass in the profilenav.dart
            },
          );
        });
  }
}

class HomeNoResultToShow extends StatelessWidget {
  const HomeNoResultToShow({
    super.key,
    required this.screenWidth,
    required this.searchFlag,
  });

  final double screenWidth;
  final SearchToggle searchFlag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: screenWidth - 30.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white.withOpacity(0.7)),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text('No results to show',
                style: TextStyle(
                    fontFamily: 'WorkSans', fontWeight: FontWeight.w400)),
            const SizedBox(height: 5.0),
            Container(
              width: 125.0,
              child: ElevatedButton(
                onPressed: () {
                  searchFlag.toggleSearch();
                },
                child: const Center(
                  child: Text(
                    'Close this',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeGoogleMap extends StatelessWidget {
  const HomeGoogleMap({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.allmarkers,
    required Set<Polyline> polylines,
    required CameraPosition kGooglePlex,
    required Completer<GoogleMapController> controller,
  })  : _polylines = polylines,
        _kGooglePlex = kGooglePlex,
        _controller = controller;

  final double screenHeight;
  final double screenWidth;
  final Set<Marker> allmarkers;
  final Set<Polyline> _polylines;
  final CameraPosition _kGooglePlex;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: GoogleMap(
        mapType: MapType.normal,
        // markers: _markerss,
        markers: allmarkers,
        polylines: _polylines,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

// class HomeFloatingDialog extends StatelessWidget {
//   const HomeFloatingDialog({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       disabledElevation: 0,
//       elevation: 0.0,
//       backgroundColor: Colors.white,
//       foregroundColor: Colors.black,
//       mini: true,
//       heroTag: null,
//       child: const Icon(Icons.business),
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => const LayerSimulationScreen()),
//         );
//       },
//     );
//   }
// }

class HomeOriginController extends StatelessWidget {
  const HomeOriginController({
    super.key,
    required TextEditingController originController,
  }) : _originController = originController;

  final TextEditingController _originController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: _originController,
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          border: InputBorder.none,
          hintText: 'origin',
        ),
      ),
    );
  }
}

//Object For User
class Userinformation {
  String UserInfofirstname = "";
  String UserInfolastname = "";
}

Future<void> goToWebPage(String urlString) async {
  final Uri _url = Uri.parse(urlString);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
