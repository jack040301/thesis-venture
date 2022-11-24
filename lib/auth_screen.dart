import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:main_venture/auth_screens/signup.dart';

import 'package:main_venture/feat_screens/profile_screen.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
//singInWithGoogle
  signInWithGoogle() async {
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

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ProfileScreen();
            //login
          } else {
            return const SignupWidget();
            //no user
          }
        },
      ),
    );
  }
}// class _AuthScreenState end

