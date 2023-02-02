// import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _collection = _firestore.collection('users');

class GoogleUserStaticInfo {
  final name = FirebaseAuth.instance.currentUser!.displayName;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  final profile = FirebaseAuth.instance.currentUser!.photoURL;
} //end class

class FunctionAuthentication {
  Future logOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      //  print('Signout initiated');
    } catch (e) {
      //print("error in sign in $e");
    }
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          //    print('User has Signed out');
        } else {
          //  print('User is logged in');
        }
      });
    } on FirebaseAuthException catch (e) {
      //  print('Logout pressed: ${e.message}');
    }
  }

  Future signInWithGoogle() async {
    //trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    //obtain the auth details from the internet
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create a new credential
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //once signed in, return the user credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
