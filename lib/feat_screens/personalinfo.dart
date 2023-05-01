import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:main_venture/component/customComponent.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:main_venture/auth_screens/email_verification.dart';
import 'package:main_venture/userInfo.dart';
import 'package:flutter/services.dart';
import '../screens/onboarding_screen.dart';


import '../screens/home_page.dart';

class personalinfo extends StatefulWidget {
  const personalinfo({Key? key}) : super(key: key);

  @override
  _personalinfoState createState() => _personalinfoState();
}

class _personalinfoState extends State<personalinfo> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  var tSnackBar = const SnackBar(
    content: Text('Email Field Must Fill!'),
  );

  @override
  void initState() {
    super.initState();

    // inputData();
  }

  // void inputData() async{
  //
  //   await Functio().signInWithGoogle();
  //   var usersCheck = await users.doc(GoogleUserStaticInfo().uid).get();
  //
  //   firstNameController.text = GoogleUserStaticInfo().firstname;
  //   lastNameController.text = GoogleUserStaticInfo().lastname;
  //
  //   // here you write the codes to input the data into firestore
  // }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            /*    const Align(
                alignment: Alignment.topRight, child: Icon(Icons.close)), */
            Ink.image(
                image: const AssetImage('assets/images/VentureLogo.png'),
                height: 50),
            const Text("Personal Information",
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Questrial',
                    height: 1.5)),
            const Text(
                "\nPlease Create your Password to complete your registration\n\n",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 110, 195),
                  fontSize: 12.0,
                  fontFamily: 'Questrial',
                )),
            const SizedBox(
              height: 20.0,
            ),
            const Text("Email Address",
                style: TextStyle(
                  color: Color.fromARGB(255, 74, 74, 74),
                  fontSize: 14.0,
                )),
            const SizedBox(
              height: 4.0,
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      // validator: (val) {
                      //   if (val == null || val.isEmpty) {
                      //     return 'Field cannot be empty';
                      //   }
                      //   return null;
                      // },
                      controller: emailController,
                      keyboardType: TextInputType.none,
                      textCapitalization: TextCapitalization.words,
                      enableInteractiveSelection: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-zA-Z0-9.-]')),
                        //FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                      ],
                      enabled: false,
                      decoration: InputDecoration(
                        // hintText: "example@gmail.com",
                        hintText: GoogleUserStaticInfo().email,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 230, 230, 230),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 230, 230, 230)
                                  .withOpacity(0.5),
                              width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 230, 230, 230)
                                  .withOpacity(0.5)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: Colors.redAccent.withOpacity(0.5)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text("First Name",
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontSize: 14.0,
                        )),
                    const SizedBox(
                      height: 4.0,
                    ),
                    TextFormField(
                      // validator: (val) {
                      //   if (val == null || val.isEmpty) {
                      //     return 'Field cannot be empty';
                      //   }
                      //   return null;
                      // },
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      enableInteractiveSelection: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-zA-Z0-9.-]')),
                        //FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                      ],
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: GoogleUserStaticInfo().firstname,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 230, 230, 230),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 230, 230, 230)
                                  .withOpacity(0.5),
                              width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 230, 230, 230)
                                  .withOpacity(0.5)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: Colors.redAccent.withOpacity(0.5)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text("Last Name",
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontSize: 14.0,
                        )),
                    const SizedBox(
                      height: 4.0,
                    ),
                    TextFormField(
                      // validator: (val) {
                      //   if (val == null || val.isEmpty) {
                      //     return 'Field cannot be empty';
                      //   }
                      //   return null;
                      // },
                      controller: lastNameController,
                      keyboardType: TextInputType.emailAddress,
                      enableInteractiveSelection: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-zA-Z0-9_.@]')),
                        //FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                      ],
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: GoogleUserStaticInfo().lastname,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 230, 230, 230),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 230, 230, 230)
                                  .withOpacity(0.5),
                              width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 230, 230, 230)
                                  .withOpacity(0.5)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: Colors.redAccent.withOpacity(0.5)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text("Password",
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontSize: 14.0,
                        )),
                    const SizedBox(
                      height: 4.0,
                    ),
                    CustomPassField(
                      onChanged: (value) {
                        setState(() {
                          passwordController
                            ..text = value
                            ..selection = TextSelection.collapsed(
                                offset: passwordController.text.length);
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          passwordController.text = value;
                        });
                      },
                      cont: passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: FlutterPasswordStrength(
                        password: passwordController.text,
                        strengthCallback: (strength) {
                          debugPrint(strength.toString());
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RawMaterialButton(
                        fillColor: const Color.fromARGB(255, 0, 110, 195),
                        onPressed: () {
                          // createAccount();
                          if (passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Fill out the Password field')));
                          } else {
                            createAccount();
                          }
                          // if (_formKey.currentState!.validate()) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //           content: Text('Processing Data')));
                          //   createAccount();
                          // }
                          // else {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //           content:
                          //           Text('Fill out the required field')));
                          // }
                        },
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: const Text("Proceed",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0)),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> createAccount() async {
    //emailverificationscreen();

    //print('Create account executed');

    try {
      final String password = passwordController.text;
      final String email = GoogleUserStaticInfo().email.toString();
      final String firstname = GoogleUserStaticInfo().firstname;
      final String lastname = GoogleUserStaticInfo().lastname;

      // await users.doc(GoogleUserStaticInfo().uid).set({
      //   'firstname': GoogleUserStaticInfo().firstname,
      //   'lastname': GoogleUserStaticInfo().lastname,
      //   'email': GoogleUserStaticInfo().email,
      // }).onError((error, stackTrace) => (error.toString()));

      users.doc(GoogleUserStaticInfo().uid).update({
        "password": password,
      });

      // await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const IntroductionScreens()));
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Created your account')));

      // await FirebaseAuth.instance.currentUser!.updatePassword(password);
    } on FirebaseAuthException catch (e) {
      /// Showing Error with AlertDialog if the user enter the wrong Email and Password
      //  print('Signup exception: ${e.message}');
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error Happened'),
            content: SingleChildScrollView(
              child: Text("Error: ${e.message}"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Got it'),
                onPressed: () {
                  Navigator.of(context).pop();
                  passwordController.clear();
                  emailController.clear();
                  firstNameController.clear();
                  lastNameController.clear();
                },
              ),
            ],
          );
        },
      );
    }

    try {
      FirebaseAuth.instance.currentUser?.email ?? 'no current user';
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          //   print('***************************************** User is null');
          // print('Current User: $curUser');
        } else {
          //print('User: ${user.email}');
          rmSignup(context);
        }
      });
    } on FirebaseAuthException catch (e) {
      FirebaseAuth.instance.currentUser?.email ?? 'no current user';
      //print('User Exeption: ${e.message}');
      log(e as String);
      //print('Current User: $curUser');
    }
  }
} // class close

Future<void> rmSignup(BuildContext context) async {
  try {
    Navigator.push(
      context,
      //MaterialPageRoute(builder: (context) => const ProfileScreen()),
      MaterialPageRoute(builder: (context) => const Emailverificationscreen()),
    );

    /*Navigator.removeRoute(
      context,
      MaterialPageRoute(builder: (context) => const SignupWidget()),
    );*/
  } catch (e) {
    log(e as String);
    // print('Routing: removing signup screen exception => $e');
  }
}
