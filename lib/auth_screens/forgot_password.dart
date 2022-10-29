import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    content: Text('Email field Must Fill!'),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email ID',
            ),
            controller: _emailForgotController,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: resetPass,
            child: const Text('Forgot Password'),
          ),
        ]),
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
