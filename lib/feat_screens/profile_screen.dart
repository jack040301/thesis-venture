import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:main_venture/feat_screens/dialogbutton.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
//final userphoto = FirebaseAuth.instance.currentUser!.photoURL??"";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

Future<void> logOut() async {
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

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FirebaseAuth.instance.currentUser!.photoURL == null
                ? const Image(image: AssetImage('assets/images/pic.png'))
                : Image.network(
                    FirebaseAuth.instance.currentUser!.photoURL ?? ""),
            Text(
              FirebaseAuth.instance.currentUser!.displayName ?? "Default Name",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ElevatedButton(
                onPressed: logOut, child: Text("Logout Account")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text("Map")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DialogVenture()));
                },
                child: const Text("Dialog Question")),
          ],
        ),
      ),
    );
  }
}
