//import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker.dart';
import 'package:main_venture/models/demog_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:main_venture/userInfo.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:main_venture/screens/home_page.dart';

import '../providers/search_places.dart';

class RequestedDialog {
  final double lat, lng;
  Set<Marker> markcount;
  Set<Marker> markcout;

  int counter;
  StreamController<Set<Marker>> markerStreamController;
  RequestedDialog(this.lat, this.lng, this.markcount, this.markcout,
      this.counter, this.markerStreamController);

  var RequestedPop = const SnackBar(
    content:
        Text('This place is requested please wait for the admin to approve it'),
  );

  static const colortext = Color.fromARGB(255, 74, 74, 74);
  static int count = 0;
  int countquery = 0;

  Future savedRequestMarker(context) async {
    count += 1;

    GeoPoint geopoint = GeoPoint(lat, lng);

    final pinnedData = {
      "coords": geopoint,
      "place": "None",
      "id": "",
      "land": 0,
      "land_size": "",
      "popu_future": "",
      "popu_past": "",
      "population": "",
      "revenue": "",
      "user_id_requested": GoogleUserStaticInfo().uid,
      "request_status": false,
    };

    var db = FirebaseFirestore.instance;
    db
        .collection("markers")
        .doc(count.toString() + "-" + GoogleUserStaticInfo().email.toString())
        .set(pinnedData)
        .then((documentSnapshot) => {
              alertmessage(context)
              //showing if data is saved
            })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(error);
    });
  }

  Future<int> countPerUserRequest() async {
    await FirebaseFirestore.instance
        .collection("markers")
        .where("user_id", isEqualTo: GoogleUserStaticInfo().uid)
        .get()
        .then(
            (QuerySnapshot querySnapshot) => {countquery = querySnapshot.size});

    return countquery;
  }

  removeMarkerss(context) {
    markcount.removeWhere(
        (element) => element.markerId == MarkerId("marker_$counter"));
    markcout.removeWhere(
        (element) => element.markerId == MarkerId("marker_$counter"));

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Tap to another place')));
  }

  Future alertmessage(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Request Sent"),
          content: const SingleChildScrollView(
            child: Text(
                "The request has been sent to the admin successfully. Please wait for the approval of admin."),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (Route route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  Future showMyDialog(BuildContext context) {
    countPerUserRequest();

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    const SizeBoxTwenty(),
                    const Text(
                        "Do you want to request this place to be ventured out?\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontSize: 16.0,
                        )),
                    const SizeBoxTen(),
                    const SizeBoxTwenty(),
                    SizedBox(
                      width: 200.0,
                      child: RawMaterialButton(
                        fillColor: const Color.fromARGB(255, 0, 110, 195),
                        onPressed: () async {
                          if (countquery <= 5) {
                            await savedRequestMarker(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                        'You have reached the maximum number of request')));
                          }
                        },
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: const Text("Request",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0)),
                      ),
                    ),
                    const SizeBoxTwenty(),
                    SizedBox(
                      width: 200.0,
                      child: RawMaterialButton(
                        fillColor: const Color.fromARGB(255, 0, 110, 195),
//onPressed: null,
//SAVE USERS' ANSWERS TO THE FIREBASE

                        onPressed: () async {
                          Navigator.of(context).pop();
                          // ito yun sana kapag initinallize dapat
                        },
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: const Text("Cancel",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0)),
                      ),
                    ),
                    const SizeBoxTwenty(),
                    SizedBox(
                      width: 200.0,
                      child: RawMaterialButton(
                        fillColor: const Color.fromARGB(255, 0, 110, 195),
//onPressed: null,
//SAVE USERS' ANSWERS TO THE FIREBASE

                        onPressed: () async {
                          removeMarkerss(context);
                          Navigator.of(context).pop();
                          // ito yun sana kapag initinallize dapat
                        },
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: const Text("Replace",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0)),
                      ),
                    ),
                  ],
                )),
              ),
            );
          });
        });
  }
}

class SizeBoxTen extends StatelessWidget {
  const SizeBoxTen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10.0,
    );
  }
}

class SizeBoxTwenty extends StatelessWidget {
  const SizeBoxTwenty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20.0,
    );
  }
}
