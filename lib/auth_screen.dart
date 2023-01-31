import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:main_venture/auth_screens/email_verification.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const AuthStateChangesWidget();
  }
}

class AuthStateChangesWidget extends StatelessWidget {
  const AuthStateChangesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return const ProfileScreen();
            return const Emailverificationscreen();

            //login
          } else {
            return const LoginScreen();
            //no user
          }
        },
      ),
    );
  }
}// class _AuthScreenState end*/

