// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:main_venture/auth_screens/login.dart';

import '../userInfo.dart';

class CustomizeAccScreen extends StatefulWidget {
  CustomizeAccScreen(
      {super.key, required this.firstname, required this.lastname});
  String firstname, lastname;

  @override
  State<CustomizeAccScreen> createState() => _CustomizeAccScreenState();
}

final CollectionReference _users =
    FirebaseFirestore.instance.collection('users');

class _CustomizeAccScreenState extends State<CustomizeAccScreen> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    inputData();
  }

  void inputData() {
    _lastnameController.text = widget.lastname;
    _firstnameController.text = widget.firstname;

    // here you write the codes to input the data into firestore
  }

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      } else {
        textFieldFocusNode.canRequestFocus = true;
      } // Prevents focus if tap on eye
    });
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
                textCapitalization: TextCapitalization.words,
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
                textCapitalization: TextCapitalization.words,
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
              /*   Container(
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
              ), */
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350,
                child: const Text(
                  "New Password",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: _obscured,
                focusNode: textFieldFocusNode,
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
                  suffix: InkWell(
                    onTap: _toggleObscured,
                    child: Icon(
                        _obscured
                            ? Icons.visibility
                            : Icons.visibility_off_rounded,
                        color: const Color.fromARGB(255, 74, 74, 74)),
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

  Future updateAccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    PopSnackbar popSnackbar = PopSnackbar();

    final String fname = _firstnameController.text;
    final String lname = _lastnameController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;
    // if (lname != null) {
    final String displayName = fname + lname;
    if (fname.isNotEmpty &&
        lname.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (user != null) {
        if (confirmPassword == password) {
          // await _users.doc(GoogleUserStaticInfo().uid).update({
          //   "firstname": _firstnameController.text,
          //   "lastname": _lastnameController.text,
          //   //"password": _passwordController.text,
          // });
          _changePassword(user, password, confirmPassword, lname, fname,
              displayName, context, popSnackbar);

          // ScaffoldMessenger.of(context).showSnackBar(
          //     popSnackbar.popsnackbar("Successfully update your account"));
          //   Navigator.of(context).popUntil((_) => count++ >= 2);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(popSnackbar
              .popsnackbar("Password and Confirm Password did not match"));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(popSnackbar.popsnackbar("User is null"));
      }
      // print("Password isnt match");
    } else {
      //print("Please fill out all Fields");
      popSnackbar.showErrorDialog(_confirmPasswordController,
          _passwordController, context, "Please fill out all the fields");
      /*  showDialog<void>(
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
      ); */
    }
  }
}

void _changePassword(
    User user,
    String password,
    String confirmPassword,
    String lname,
    String fname,
    String displayName,
    context,
    PopSnackbar popSnackbar) async {
  user.updatePassword(password).then((_) {
    PopSnackbar popSnackbar = PopSnackbar();
    // ScaffoldMessenger.of(context).showSnackBar(
    //     popSnackbar.popsnackbar("Successfully update the password"));

    //if (confirmPassword == password) {
    _users.doc(GoogleUserStaticInfo().uid).update({
      "firstname": fname,
      "lastname": lname,
      "password": password,
    });

    ScaffoldMessenger.of(context).showSnackBar(
        popSnackbar.popsnackbar("Successfully updated your account"));
    //   Navigator.of(context).popUntil((_) => count++ >= 2);
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(popSnackbar
    //       .popsnackbar("Password and Confirm Password are not the same"));
    // }

    Future.delayed(const Duration(seconds: 4)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage())));
  }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(
        popSnackbar.popsnackbar("Password cant be changed due to $error"));
  });

/*   await user
      .updateDisplayName(displayName)
      .then((_) => {
            ScaffoldMessenger.of(context)
                .showSnackBar(popSnackbar.popsnackbar("Updated Displayname"))
          })
      .catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(
        popSnackbar.popsnackbar("User didnt use Google Sign in $error"));
  }); */
}
