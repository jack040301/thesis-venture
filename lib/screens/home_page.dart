import 'dart:async';
import 'dart:collection';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:main_venture/feat_screens/dialogbutton.dart';
import 'package:main_venture/feat_screens/prediction_dialog.dart';
import 'package:main_venture/feat_screens/profilenav.dart';
import 'package:main_venture/models/auto_complete_results.dart';
import 'package:main_venture/providers/search_places.dart';
import 'package:main_venture/services/maps_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:geocoding/geocoding.dart';

import '../feat_screens/widgset.dart';

//Geocoder package is deprecated
//import 'package:flutter_geocoder/geocoder.dart';

//import 'dart:ui' as ui;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();

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

// Markers set
  Set<Marker> _markers = Set<Marker>();
  Set<Marker> allmarkers = HashSet<Marker>();
  //Map<MarkerId, Marker> _markerss = <MarkerId, Marker>{};
  Set<Polyline> _polylines = Set<Polyline>();
  int markerIdCounter = 1;
  int polylineIdCounter = 1;

// Text Editing Controllers
  TextEditingController searchController = TextEditingController();
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

// initial map position on load
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.774477, 121.04483),
    zoom: 14.4746,
  );

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

//Show marker from the firestore database
  getMarkerData() async {
    await FirebaseFirestore.instance
        .collection("markers")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((documents) async {
                var data = documents.data() as Map;
                allmarkers.add(Marker(
                    onTap: () async {
                      await DialogQuestion(data["id"]).showMyDialog(context);
                    },
                    infoWindow: InfoWindow(
                      title: data["place"],
                    ),
                    markerId: MarkerId(data["id"]),
                    icon: await MarkerIcon.pictureAsset(
                        assetPath: 'assets/images/icons/venture.png',
                        width: 100,
                        height: 100),
                    position: LatLng(
                        data["coords"].latitude, data["coords"].longitude)));
              })
            });

    setState(() {
      allmarkers;
      print(allmarkers.toString());
    });
  }

//to automatically show marker to map
  Widget getmarker(BuildContext context) {
    getMarkerData();
    return Text('');
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

    //Providers
    final allSearchResults = ref.watch(placeResultsProvider);
    final searchFlag = ref.watch(searchToggleProvider);
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
                                15.0, 40.0, 15.0, 5.0),
                            child: Column(children: [
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 15.0),
                                      border: InputBorder.none,
                                      hintText: 'Search',
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              searchToggle = false;
                                              searchController.text = '';
                                              _markers = {};
                                              searchFlag.toggleSearch();
                                            });
                                          },
                                          icon: const Icon(Icons.close))),
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
                    ? allSearchResults.allReturnedResults.length != 0
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
                            child: Container(
                              height: 200.0,
                              width: screenWidth - 30.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.7)),
                              child: Center(
                                child: Column(
                                  children: [
                                    const Text('No results to show',
                                        style: TextStyle(
                                            fontFamily: 'WorkSans',
                                            fontWeight: FontWeight.w400)),
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
                            ))
                    : Container(),
                getmarker(context), //to automatically show marker to map
                getDirections
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 5),
                        child: Column(
                          children: [
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: _originController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 15.0),
                                  border: InputBorder.none,
                                  hintText: 'origin',
                                ),
                              ),
                            ),
                            const SizedBox(height: 3.0),
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: _destinationController,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0),
                                    border: InputBorder.none,
                                    hintText: 'Destination',
                                    suffixIcon: Container(
                                      width: 96.8,
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                var directions =
                                                    await MapServices()
                                                        .getDirections(
                                                            _originController
                                                                .text,
                                                            _destinationController
                                                                .text);
                                                _markers = {};
                                                _polylines = {};
                                                gotoPlace(
                                                  directions['start_location']
                                                      ['lat'],
                                                  directions['start_location']
                                                      ['lng'],
                                                  directions['end_location']
                                                      ['lng'],
                                                  directions['end_location']
                                                      ['lat'],
                                                  directions['bounds_ne'],
                                                  directions['bounds_sw'],
                                                );
                                                _setPolyline(directions[
                                                    'polyline_deoded']);
                                              },
                                              icon: const Icon(Icons.search)),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  getDirections = false;
                                                  _originController.text = '';
                                                  _destinationController.text =
                                                      '';
                                                });
                                              },
                                              icon: const Icon(Icons.close))
                                        ],
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container()
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            heroTag: null,
            mini: true,
            child: FirebaseAuth.instance.currentUser!.photoURL == null
                ? const Image(image: AssetImage('assets/images/pic.png'))
                : Image.network(
                    FirebaseAuth.instance.currentUser!.photoURL ?? ""),
            onPressed: () {
              ProfileNav().showProfileNav(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            mini: true,
            heroTag: null,
            child: const Icon(Icons.business),
            onPressed: () {
              // PredictionDialog().showPredictionDialog(context);
              //  DialogVenture.showInformationDialog(context);
            },
          ),
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            mini: true,
            heroTag: null,
            child: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                searchToggle = true;
                radiusSlider = false;
                pressedNear = false;
                cardTapped = false;
                getDirections = false;
              });
            },
          ),
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            mini: true,
            heroTag: null,
            child: const Icon(Icons.navigation),
            onPressed: () {
              setState(() {
                searchToggle = false;
                radiusSlider = false;
                pressedNear = false;
                cardTapped = false;
                getDirections = true;
              });
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
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
