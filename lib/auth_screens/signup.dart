import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_venture/profile_screen.dart';
import 'package:main_venture/auth_screen.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:main_venture/component/customComponent.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

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
            const Align(
                alignment: Alignment.topRight, child: Icon(Icons.close)),
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
                      decoration: InputDecoration(
                        hintText: "Nikki",
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
                      decoration: InputDecoration(
                        hintText: "Ba-alan",
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
                      decoration: InputDecoration(
                        hintText: "baalan.bscs2019@gmail.com",
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
                          createAccount();
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')));
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text("Already have an account? Login",
                  style: TextStyle(
                    color: Color.fromARGB(255, 74, 74, 74),
                    fontSize: 14.0,
                  )),
            ),
            Row(children: const <Widget>[
              Expanded(
                child: Divider(
                    color: Color.fromARGB(255, 105, 105, 105), endIndent: 20),
              ),
              Text(
                "or",
                style: TextStyle(color: Color.fromARGB(255, 74, 74, 74)),
              ),
              SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: Divider(
                    color: Color.fromARGB(255, 105, 105, 105), indent: 20),
              ),
            ]),
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
                onTap: () async {
                  await const AuthScreen().signInWithGoogle();
                },
                child: Material(
                  color: const Color.fromARGB(255, 0, 110, 195),
                  elevation: 8,
                  borderRadius: BorderRadius.circular(5.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ink.image(
                            image:
                                const AssetImage('assets/images/google2.png'),
                            height: 40,
                            width: 30),
                        const SizedBox(width: 10.0, height: 50),
                        const Text('Continue With Google',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0)),
                      ]),
                ))
          ],
        ),
      ),
    ));
  }

  Future<void> createAccount() async {
    print('Create account executed');

    try {
      if (emailController.text.isNotEmpty &
          passwordController.text.isNotEmpty &
          firstNameController.text.isNotEmpty &
          lastNameController.text.isNotEmpty) {
        print('The fields is not empty');
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        await users.add({
          'firstname': firstNameController.text,
          'lastname': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        });
      } else {
        print('Fields are empty');
      }
    } on FirebaseAuthException catch (e) {
      /// Showing Error with AlertDialog if the user enter the wrong Email and Password
      print('Signup exception: ${e.message}');
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
      String curUser =
          FirebaseAuth.instance.currentUser?.email ?? 'no current user';
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('***************************************** User is null');
          print('Current User: $curUser');
        } else {
          print('User: ${user.email}');
          rmSignup(context);
        }
      });
    } on FirebaseAuthException catch (e) {
      String curUser =
          FirebaseAuth.instance.currentUser?.email ?? 'no current user';
      print('User Exeption: ${e.message}');
      print('Current User: $curUser');
    }
  }
}

Future<void> rmSignup(BuildContext context) async {
  try {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );

    /*Navigator.removeRoute(
      context,
      MaterialPageRoute(builder: (context) => const SignupWidget()),
    );*/
  } catch (e) {
    print('Routing: removing signup screen exception => $e');
  }
}
