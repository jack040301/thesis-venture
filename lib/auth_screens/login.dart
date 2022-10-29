import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:main_venture/auth_screen.dart';
import 'package:main_venture/auth_screens/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var fSnackBar = const SnackBar(
    content: Text('The Email & Password fields Must Fill!'),
  );

  /// Email Fill & Password Empty
  var sSnackBar = const SnackBar(
    content: Text('Password field Must Fill!'),
  );

  /// Email Empty & Password Fill
  var tSnackBar = const SnackBar(
    content: Text('Email field Must Fill!'),
  );

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Login Page",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 44.0,
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.mail, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.security, color: Colors.black),
            ),
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color.fromARGB(255, 52, 107, 185),
              onPressed: signIn,
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: const Text("Login",
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
            ),
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color.fromARGB(255, 52, 107, 185),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen())),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: const Text("Forgot Password",
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
            ),
          ),
          const SizedBox(
            height: 88.0,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                const AuthScreen().signInWithGoogle();
              },
              child: const Image(
                  width: 100, image: AssetImage('assets/images/google.png'))),
        ],
      ),
    );
  }

  Future signIn() async {
    try {
      /// In the below, with if statement we have some simple validate
      if (_emailController.text.isNotEmpty &
          _passwordController.text.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else if (_emailController.text.isNotEmpty &
          _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(sSnackBar);
      } else if (_emailController.text.isEmpty &
          _passwordController.text.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(tSnackBar);
      } else if (_emailController.text.isEmpty &
          _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(fSnackBar);
      }
    } catch (e) {
      /// Showing Error with AlertDialog if the user enter the wrong Email and Password
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error Happened'),
            content: const SingleChildScrollView(
              child: Text(
                  "The Email and Password that you Entered is Not valid ,Try Enter a valid Email and Password."),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Got it'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _emailController.clear();
                  _passwordController.clear();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
