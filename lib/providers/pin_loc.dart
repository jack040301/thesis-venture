import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Pinloc {
  Pinloc() {
    initUserPref();
  }

  //final Map<String, String>? savedPlaces;
  String? userID;
  Map<String, dynamic>? data;
  Map<String, dynamic>? loc;
  CollectionReference docref = FirebaseFirestore.instance.collection("users");

  void userCurrentState() {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('No active user is logged in');
        } else {
          userID = user.uid;
          docref.doc(FirebaseAuth.instance.currentUser!.uid).get().then(
              (DocumentSnapshot doc) {
            data = doc.data() as Map<String, dynamic>;
          },
              onError: (e) => print(
                  " ****************************************error getting document: $e"));
        }
      });
    } on FirebaseAuthException catch (e) {
      print('Firebase exception: ${e.message}');
    }
  }

  void getLoc() {
    try {
      docref.doc(FirebaseAuth.instance.currentUser!.uid).get().then(
          (DocumentSnapshot doc) {
        loc = doc.data() as Map<String, dynamic>;
      },
          onError: (e) => print(
              " ****************************************error getting document: $e"));
    } on FirebaseException catch (e) {
      print('Firebase exception: ${e.message}');
    }
  }

  Future saveLoc(data) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(data)
          .then((documentSnapshot) => print("added data with ID"));
    } on FirebaseException catch (e) {
      print('Adding data exception: ${e.message}');
    }
  }

  Future<void> warningDialog(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Upgrade to premium'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Upgrade to premium to pin more than 3 locations')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  Marker showSavedLoc(mId, lat, lng, context, loc) {
    final Marker m = Marker(
        markerId: mId,
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
                      Text('Location: ${placemarks[loc]}'),
                    ]),
                  ),
                  actions: <Widget>[
                    TextButton(onPressed: () {}, child: const Text('Delete')),
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

    return m;
  }

  Future<void> initUserPref() async {
    userCurrentState();
    getLoc();
  }
}
