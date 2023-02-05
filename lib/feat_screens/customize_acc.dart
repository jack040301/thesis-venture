// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:main_venture/screens/home_page.dart';
import '../userInfo.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_venture/screens/home_page.dart';

class CustomizeAccScreen extends StatefulWidget {
  CustomizeAccScreen(
      {super.key, required this.firstname, required this.lastname});
  String firstname, lastname;

  @override
  State<CustomizeAccScreen> createState() => _CustomizeAccScreenState();
}

class _CustomizeAccScreenState extends State<CustomizeAccScreen> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();

    inputData();
  }

  void inputData() {
    _lastnameController.text = widget.firstname;
    _firstnameController.text = widget.lastname;

    // here you write the codes to input the data into firestore
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Customize Your Account'),
        foregroundColor: const Color.fromARGB(255, 44, 45, 48),
        elevation: 0.0,
        leading: const BackButton(
          color: Color.fromARGB(255, 44, 45, 48),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 350,
                child: const Text(
                  "First Name",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                controller: _firstnameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350,
                child: const Text(
                  "Last Name",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350,
                child: const Text(
                  "Email Address",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                controller: _emailController,
                enabled: false,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350,
                child: const Text(
                  "Password",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: '************',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350,
                child: const Text(
                  "Confirm Password",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                obscureText: true,
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: '************',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 480,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    updateAccount();
                  },
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(height: 1.5, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Future updateAccount() async {
  // await auth.createUserWithEmailAndPassword(
  //           email: _emailController.text.trim(),
  //           password: _passwordController.text.trim(),
  //         )
  //         .then((value) => user.doc(value.user!.uid).set({
  //               'firstname': firstNameController.text.trim(),
  //               'lastname': lastNameController.text.trim(),
  //               'email': value.user!.email,
  //             }));

  //await auth.document('Users/$')

// }

  Future updateAccount() async {
    final String fname = _firstnameController.text;
    final String lname = _lastnameController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;
    // if (lname != null) {
    if (fname.isNotEmpty &&
        lname.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        await _users.doc(GoogleUserStaticInfo().uid).update({
          "firstname": _firstnameController.text,
          "lastname": _lastnameController.text,
          "password": _passwordController.text,
        });
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // print("Password isnt match");
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error Happened'),
              content: const SingleChildScrollView(
                child: Text("Password and Confirm Password isn't match"),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Got it'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _passwordController.clear();
                    _confirmPasswordController.clear();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      //print("Please fill out all Fields");

      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error Happened'),
            content: const SingleChildScrollView(
              child: Text("Please fill out all Fields"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Got it'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _passwordController.clear();
                  _confirmPasswordController.clear();
                },
              ),
            ],
          );
        },
      );
    }
  }
} // end class
