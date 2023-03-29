//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_venture/models/demog_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:main_venture/userInfo.dart';

class DeleteHistoryCardDialog {
  final String historycardid;
  DeleteHistoryCardDialog({required this.historycardid});

  var SnackDialog = const SnackBar(
    content: Text('Deleted Successfully'),
  );
  CollectionReference pinnedhistory =
      FirebaseFirestore.instance.collection('pinnedlocation');

  Future<void> deleteHistoryCard(historyid, context) {
    return pinnedhistory
        .doc(historyid)
        .delete()
        .then(
            (value) => ScaffoldMessenger.of(context).showSnackBar(SnackDialog))
        .catchError(
            (error) => ScaffoldMessenger.of(context).showSnackBar(error));
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
                        "Are you sure you want to delete this History?\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontSize: 16.0,
                        )),
                    const SizeBoxTen(),
                    const SizeBoxTwenty(),
                    SizedBox(
                      width: 200.0,
                      child: RawMaterialButton(
                        fillColor: Color.fromARGB(255, 243, 87, 82),
                        onPressed: () async {
                          await deleteHistoryCard(historycardid, context)
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
