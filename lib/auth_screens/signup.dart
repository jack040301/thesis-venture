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

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  //final _emailForgotController = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //final otpcontroller = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  // void sendotp() async {
  //   EmailAuth.sessionName = "Test Session";
  //   //EmailAuth emailAuth =  new EmailAuth(sessionName: " Authentication");
  //   bool res =
  //       await EmailAuth.sendOtp(receiverMail: emailController.value.text);
  //   if (res) {
  //     print("OTP sent");
  //   } else {
  //     print("We could not send OTP");
  //   }
  // }

  // void verifyotp() async {
  //   var res = EmailAuth.validate(
  //       receiverMail: emailController.text, userOTP: otpcontroller.text);
  //   if (res) {
  //     print("OTP verified");
  //   } else {
  //     print("Invalid OTP");
  //   }
  // }

  var tSnackBar = const SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text('Email Field Must Fill!'),
  );

  @override
  void initState() {
    super.initState();
  }

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
                const Text("Sign Up",
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Questrial',
                        height: 1.5)),
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
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            return null;
                          },
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          enableInteractiveSelection: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[ a-zA-Z.-]')),
                            //FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                          ],
                          decoration: InputDecoration(
                            hintText: "Firstname",
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
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            return null;
                          },
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          enableInteractiveSelection: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[ a-zA-Z.-]')),
                            //FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                          ],
                          decoration: InputDecoration(
                            hintText: "Lastname",
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
                        const Text("Email Address",
                            style: TextStyle(
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontSize: 14.0,
                            )),
                        const SizedBox(
                          height: 4.0,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            return null;
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          enableInteractiveSelection: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9_.@]')),
                            //FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                          ],
                          decoration: InputDecoration(
                            hintText: "email@gmail.com",
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
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('Processing Data')));
                                createAccount();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content:
                                        Text('Fill out the required field')));
                              }
                            },
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: const Text("Sign Up",
                                style:
                                TextStyle(color: Colors.white, fontSize: 15.0)),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 15.0,
                ),
                Row(children: [
                  const Text("Already have an account? ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 74, 74, 74),
                        fontSize: 14.0,
                      )),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },

                    child: const Text("Login",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 110, 195),
                          fontSize: 14.0,
                        )),
                  )]),
                // Row(children: const <Widget>[
                //   Expanded(
                //     child: Divider(
                //         color: Color.fromARGB(255, 105, 105, 105), endIndent: 20),
                //   ),
                //   Text(
                //     "or",
                //     style: TextStyle(color: Color.fromARGB(255, 74, 74, 74)),
                //   ),
                //   SizedBox(
                //     height: 50.0,
                //   ),
                //   Expanded(
                //     child: Divider(
                //         color: Color.fromARGB(255, 105, 105, 105), indent: 20),
                //   ),
                // ]),
                // const SizedBox(
                //   height: 10.0,
                // ),
                // GestureDetector(
                //     onTap: () async {
                //       await Functio().signInWithGoogle();
                //       var usersCheck =
                //           await users.doc(GoogleUserStaticInfo().uid).get();

                //       if (!usersCheck.exists) {
                //         await users.doc(GoogleUserStaticInfo().uid).set({
                //           'firstname': GoogleUserStaticInfo().firstname,
                //           'lastname': GoogleUserStaticInfo().lastname,
                //           'email': GoogleUserStaticInfo().email,
                //         }).onError((error, stackTrace) => (error.toString()));
                //       }
                //     },
                //     child: Material(
                //       color: const Color.fromARGB(255, 0, 110, 195),
                //       elevation: 8,
                //       borderRadius: BorderRadius.circular(5.0),
                //       clipBehavior: Clip.antiAliasWithSaveLayer,
                //       child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Ink.image(
                //                 image:
                //                     const AssetImage('assets/images/google2.png'),
                //                 height: 40,
                //                 width: 30),
                //             const SizedBox(width: 10.0, height: 50),
                //             const Text('Continue With Google',
                //                 style:
                //                     TextStyle(color: Colors.white, fontSize: 14.0)),
                //           ]),
                //     ))
              ],
            ),
          ),
        ));
  }

  Future<void> createAccount() async {
    //emailverificationscreen();

    //print('Create account executed');

    try {
      if (emailController.text.isNotEmpty &
      passwordController.text.isNotEmpty &
      firstNameController.text.isNotEmpty &
      lastNameController.text.isNotEmpty) {
        //     print('The fields is not empty');
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
            .then((value) => users.doc(value.user!.uid).set({
          'firstname': firstNameController.text.trim(),
          'lastname': lastNameController.text.trim(),
          'email': value.user!.email,
          'password': passwordController.text.trim(),
        }));
      } else {
        //    print('Fields are empty');
      }
    } on FirebaseAuthException catch (e) {
      /// Showing Error with AlertDialog if the user enter the wrong Email and Password
      //  print('Signup exception: ${e.message}');
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Email Already Exist'),
            content: SingleChildScrollView(
              child: Text(
                  "The Email address you have provided is already existing. Please use the login form to login your account"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // passwordController.clear();
                  emailController.clear();
                  // firstNameController.clear();
                  // lastNameController.clear();
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
