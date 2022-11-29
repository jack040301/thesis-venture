import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:fab_circular_menu/fab_circular_menu.dart';
<<<<<<< Updated upstream
import 'package:flip_card/flip_card.dart';
=======
import 'package:firebase_core/firebase_core.dart';

>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
<<<<<<< Updated upstream
=======
import 'package:main_venture/feat_screens/dialogbutton.dart';
import 'package:main_venture/feat_screens/profilenav.dart';
import 'package:main_venture/feat_screens/widgset.dart';
>>>>>>> Stashed changes
import 'package:main_venture/models/auto_complete_results.dart';
import 'package:main_venture/providers/search_places.dart';
import 'package:main_venture/services/maps_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_venture/feat_screens/dialogbutton.dart';

import 'dart:ui' as ui;
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Completer <GoogleMapController> _controller = Completer();

//Debounce to throttle async calls during search
  Timer? _debounce;

// toggling Ui as we need
  bool searchToggle = false;
  bool radiusSlider = false;
  bool cardTapped = false;
  bool pressedNear = false;
  bool getDirections = false;

// Markers set
<<<<<<< Updated upstream
Set<Marker> _markers = Set<Marker>();
Set<Polyline> _polylines = Set<Polyline>();
=======
  Set<Marker> _markers = Set<Marker>();
  List<Marker> _marker = [];

  Map<MarkerId , Marker> _markerss = <MarkerId , Marker>{};
  Set<Polyline> _polylines = Set<Polyline>();
>>>>>>> Stashed changes
  int markerIdCounter = 1;
  int polylineIdCounter = 1;

// Text Editing Controllers
TextEditingController searchController = TextEditingController();
TextEditingController _originController = TextEditingController();
TextEditingController _destinationController = TextEditingController();

// initial map position on load
  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.4279613380664, -122.085749655962),
    zoom: 14.4746,
  );

  void _setMarker (point){
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

<<<<<<< Updated upstream
  void _setPolyline(List<PointLatLng> points){
=======

  void _setPolyline(List<PointLatLng> points) {
>>>>>>> Stashed changes
    final String polylineIdVal = 'polyline_$polylineIdCounter';

    polylineIdCounter++;

    _polylines.add(Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: Colors.blue,
        points: points.map((e) => LatLng(e.latitude, e.longitude)).toList()
    ));

  }
/*
  Widget loadMap (){
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('markers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading maps... Please Wait');
          for (int i=0; i<snapshot.data.docs.length; i++){
            _marker.add(new Marker (
              width: 45.0,
              height: 45.0,
              point: new LatLng(snapshot.data.documents[i]['coords'].latitude,
                  snapshot.data.documents[i]['coords'].longitude),
              builder: (context) => new Container(
                child: IconButton(
                  icon: Icon(Icons.location_on),
                  color: Colors.blue,
                  iconSize: 45.0,
                  onPressed: () {
                    print(snapshot.data.documents[i] ['place']);
                  },
                ),
              )));
          }
        },
    );
  } */

  getMarkerData() async {
<<<<<<< Updated upstream
    FirebaseFirestore.instance.collection('markers').get().then((markers) {
      if(markers.docs.isNotEmpty) {
        for(int i = 0; i < markers.docs.length ; i++){
          initMarker(markers.docs[i].data , markers.docs[i].id);
        }
      }
=======
    await FirebaseFirestore.instance
        .collection("markers")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((documents) {
                var data = documents.data() as Map;
                allmarkers.add(Marker(
                  onTap: () async {
                   await dialogQuestion().showMyDialog(context);
                  },
                   infoWindow: InfoWindow(title: data["place"],),
                    markerId: MarkerId(data["id"]),
                    position: LatLng(
                        data["coords"].latitude, data["coords"].longitude)));
              })
            });

    setState(() {
      allmarkers;
      print(allmarkers.toString());
>>>>>>> Stashed changes
    });
  }


  void initMarker(specify , specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(specify['coords'].latitude , specify['coords'].longitude),
      infoWindow: InfoWindow(title: 'place' ),
    );
    setState(() {
      _markerss[markerId] = marker;
    });
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
                    markers: Set<Marker>.of(_markerss.values),
                    polylines: _polylines,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller){
                      _controller.complete(controller);
                    },
                  ),
                ),
<<<<<<< Updated upstream
                searchToggle ?
                    Padding(padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 5.0),
              child: Column(
                children: [
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0
                        ),
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
                            icon: Icon(Icons.close))),
                      onChanged: (value){
                        if (_debounce?.isActive ?? false)
                          _debounce?.cancel();
                          _debounce = Timer(Duration (milliseconds: 700),
                                  () async {
                                if(value.length > 2){
                                  if(!searchFlag.searchToggle){
                                    searchFlag.toggleSearch();
                                    _markers={};
                                  }
                                  List <AutoCompleteResult> searchResults=
                                      await MapServices().searchPlaces(value);

                                  allSearchResults
                                        .setResults(searchResults);

                                } else {
                                  List <AutoCompleteResult> emptyList = [];
                                  allSearchResults.setResults(emptyList);
                                }
                              });
                      },
                      ),
                    ),
                  ]),
              )
              : Container(),
                searchFlag.searchToggle ?
                allSearchResults.allReturnedResults.length != 0 ?
                Positioned(
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
                          ...allSearchResults.allReturnedResults.map((e) => buildListItem(e, searchFlag))
                        ],
                      ),
                    )):
                    Positioned(
                        top: 100.0,
                        left: 15.0,
                        child: Container(
                          height: 200.0,
                            width: screenWidth - 30.0,
=======
                //pressedNear?
                    //builds(context):
                searchToggle
                    ?
                Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 5.0),
                        child: Column(children: [
                          Container(
                            height: 50.0,
>>>>>>> Stashed changes
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white.withOpacity(0.7)
                            ),
                          child: Center(
                            child: Column(children: [
                                Text ('No results to show', style: TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.w400)),
                                SizedBox(height: 5.0),
                                  Container(
                                    width: 125.0,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        searchFlag.toggleSearch();
                                      },
                                    child: Center(
                                      child: Text(
                                        'Close this',
                                        style: TextStyle(color: Colors.white, fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        )): Container(),
                          getDirections ?
                              Padding(padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 5),
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
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                                            border: InputBorder.none,
                                            hintText: 'origin',
                                          ),
                                      ),
                                    ),
                                    SizedBox(height: 3.0),
                                      Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Colors.white,
                                        ),
                                        child: TextFormField(
                                          controller: _destinationController,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
                                                     gotoPlace(directions['start_location']['lat'],
                                                     directions ['start_location']['lng'],
                                                     directions ['end_location']['lng'],
                                                     directions ['end_location']['lat'],
                                                     directions ['bounds_ne'],
                                                     directions ['bounds_sw'],
                                                     );
                                                     _setPolyline(directions[
                                                       'polyline_deoded']);
                                                  },
                                                      icon: Icon(Icons.search)),
                                                 IconButton(onPressed: () {
                                                   setState(() {
                                                     getDirections = false;
                                                     _originController.text = '';
                                                     _destinationController.text = '';

                                                   });
                                                 }, icon: Icon(Icons.close))
                                                ],
                                              ),)),
                                        ),
                                      )
                                  ],
                                ),
                              ): Container()
              ],
              )
      ],
        ),
        ),

<<<<<<< Updated upstream
      floatingActionButton: FabCircularMenu(
        alignment: Alignment.bottomLeft,
        fabColor: Colors.blue,
        fabOpenColor: Colors.red.shade100,
        ringDiameter: 250.0,
        ringWidth: 60.0,
        ringColor: Colors.blue.shade50,
        fabSize: 60.0,
       children: [
         IconButton(onPressed: () {
           setState(() {
            searchToggle = true;
            radiusSlider = false;
            pressedNear = false;
            cardTapped = false;
            getDirections = false;
           });
    },icon: Icon(Icons.search)),
         IconButton(onPressed: (){
           setState(() {
             searchToggle = false;
             radiusSlider = false;
             pressedNear = false;
             cardTapped = false;
             getDirections = true;
           });
         }, icon: Icon(Icons.navigation))
       ]),
=======
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            heroTag: null,
            mini: true,
           /* child: FirebaseAuth.instance.currentUser!.photoURL == null
                ? const Image(image: AssetImage('assets/images/pic.png'))
                : Image.network(
                    FirebaseAuth.instance.currentUser!.photoURL ?? ""), */
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
            child: const Icon(Icons.house),
            onPressed: () {

             // dialogQuestion().showMyDialog(context);
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
>>>>>>> Stashed changes
    );
  }

  gotoPlace(double lat, double lng, double endLat, double endLng,
      Map<String, dynamic> boundNe, Map<String, dynamic> boundSw) async{
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newLatLngBounds(
      LatLngBounds(
          southwest: LatLng(boundSw['lat'], boundSw ['lng']),
          northeast: LatLng(boundNe['lat'], boundNe ['lng'])),
          25));
    
    _setMarker(LatLng(lat, lng));

  }

  Future<void> gotoSearchedPlace(double lat, double lng) async{
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));

    _setMarker(LatLng(lat, lng));
  }

  Widget buildListItem(AutoCompleteResult placeItem, searchFlag){
    return Padding(
        padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTapDown: (_){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () async{
          var place = await MapServices().getPlace(placeItem.placeId);
          gotoSearchedPlace(place['geometry']['location']['lat'],
              place['geometry']['location']['lng']);
          searchFlag.toggleSearch();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.green, size: 25.0),
            SizedBox(width: 4.0),
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
}
