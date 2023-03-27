//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_venture/models/demog_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:main_venture/userInfo.dart';

class RequestedDialog {
  final double lat, lng;
  RequestedDialog(this.lat, this.lng);

  var RequestedPop = const SnackBar(
    content:
        Text('This place is requested please wait for the admin to approve it'),
  );

  static const colortext = Color.fromARGB(255, 74, 74, 74);

  Future savedRequestMarker(context) async {
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
        .collection("testmarkers")
        .add(pinnedData)
        .then((documentSnapshot) => {
              ScaffoldMessenger.of(context).showSnackBar(RequestedPop)
              //showing if data is saved
            })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(error);
    });
  }

  Future showMyDialog(BuildContext context) {
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
                        "Do you want to Requeset this Place?\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
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
                          await savedRequestMarker(context)
                              .then((_) => {Navigator.of(context).pop()});
                        },
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: const Text("Yes",
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
                        child: const Text("No",
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
