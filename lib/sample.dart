import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_venture/models/auto_complete_results.dart';
import 'dart:async';


class sample extends StatelessWidget {
  const sample({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Add User'),
    ),
    body: StreamBuilder<List<markerss>>(
      stream: readmarkerss(),
      builder: (context, snapshot){
        if (snapshot.hasError){
          return Text('wrong ${snapshot.error}');
        }

       else if (snapshot.hasData){
          final users = snapshot.data!;

          return ListView(
            children: users.map(buildUser).toList(),
          );
        } else {
         return Center(child: CircularProgressIndicator());
        }
      }),
  );


  Widget buildUser(markerss markerss) => ListTile(
    leading: CircleAvatar(child: Text('${markerss.id}')),
    title: Text(markerss.place),
    subtitle: Text(markerss.coords),
  );

  Stream<List<markerss>> readmarkerss() => FirebaseFirestore.instance
      .collection('maps')
      .snapshots()
  .map((snapshot) => snapshot.docs.map((doc) => markerss.fromJson(doc.data())).toList());
}
