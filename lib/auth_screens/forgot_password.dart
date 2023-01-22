import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  final _emailForgotController = TextEditingController();

  var tSnackBar = const SnackBar(
    content: Text('Email Field Must Fill!'),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Email Address",
                filled: true,
                fillColor: Color.fromARGB(255, 230, 230, 230),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                      color:
                          Color.fromARGB(255, 230, 230, 230).withOpacity(0.5),
                      width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                      color:
                          Color.fromARGB(255, 230, 230, 230).withOpacity(0.5)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide:
                      BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                ),
              ),
              controller: _emailForgotController,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: resetPass,
              child: const Text('Forgot Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 110, 195),
                foregroundColor: Colors.white,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future resetPass() async {
    if (_emailForgotController.text.isNotEmpty) {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailForgotController.text)
          .then((value) => Navigator.of(context).pop());
    } else if (_emailForgotController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(tSnackBar);
    }
  }
}
