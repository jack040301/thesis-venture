import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailForgotController = TextEditingController();

  var tSnackBar = const SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text('Email Field Must Fill!'),
  );

  var forgotPasswordSnackbar = const SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text('We Have Sent an Email to your Account!'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 40.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Email Address",
                filled: true,
                fillColor: const Color.fromARGB(255, 230, 230, 230),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 230, 230, 230)
                          .withOpacity(0.5),
                      width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 230, 230, 230)
                          .withOpacity(0.5)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  borderSide:
                      BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                ),
              ),
              controller: _emailForgotController,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: resetPass,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 110, 195),
                foregroundColor: Colors.white,
              ),
              child: const Text('Forgot Password'),
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
      ScaffoldMessenger.of(context).showSnackBar(forgotPasswordSnackbar);
    } else if (_emailForgotController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(tSnackBar);
    }
  }
}
