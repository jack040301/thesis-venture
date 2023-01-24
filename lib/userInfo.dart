// import 'package:flutter/material.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/feat_screens/profilenav.dart';

import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _collection = _firestore.collection('users');

class userinfo {
  final name = FirebaseAuth.instance.currentUser!.displayName;
  final profile = FirebaseAuth.instance.currentUser!.photoURL;
  var fname;
} //end class

Future logOut() async {
  try {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    print('Signout initiated');
  } catch (e) {
    print("error in sign in $e");
  }
  try {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User has Signed out');
      } else {
        print('User is logged in');
      }
    });
  } on FirebaseAuthException catch (e) {
    print('Logout pressed: ${e.message}');
  }
}

Future getfirstname() async {
  await FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot snapshot) => {
            snapshot.docs.forEach((documents) async {
              var data = documents.data() as Map;
              var gname = data['firstname'];
              userinfo().fname = gname;
            })
          });
}
