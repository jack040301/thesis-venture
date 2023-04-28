import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/auth_screens/forgot_password.dart';
import 'package:main_venture/auth_screens/signup.dart';
import 'package:main_venture/userInfo.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:main_venture/feat_screens/personalInfo.dart';

import '../screens/onboarding_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  bool loading = false;
  bool end = false;

  var fSnackBar = const SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text('The Email & Password Fields Must Fill!'),
  );

  /// Email Fill & Password Empty
  var sSnackBar = const SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text('Password Field Must Fill!'),
  );

  /// Email Empty & Password Fill
  var tSnackBar = const SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text('Email Field Must Fill!'),
  );

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
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              /*   const Align(
                  alignment: Alignment.topRight, child: Icon(Icons.close)), */
              Ink.image(
                  image:
                  const AssetImage('assets/images/VentureLogo.png'),
                  height: 80),
              const Text("Login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 74, 74, 74),
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      height: 1.5)),
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
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
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
                height: 15.0,
              ),

              const Text("Password",
                  style: TextStyle(
                    color: Color.fromARGB(255, 74, 74, 74),
                    fontSize: 14.0,
                  )),
              const SizedBox(
                height: 4.0,
              ),
              // password
              // TextField(
              //   enableSuggestions: false,
              //   autocorrect: false,
              //   controller: _passwordController,
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: "Password",
              //     filled: true,
              //     fillColor: const Color.fromARGB(255, 230, 230, 230),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius:
              //           const BorderRadius.all(Radius.circular(5.0)),
              //       borderSide: BorderSide(
              //           color: const Color.fromARGB(255, 230, 230, 230)
              //               .withOpacity(0.5),
              //           width: 2),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius:
              //           const BorderRadius.all(Radius.circular(5.0)),
              //       borderSide: BorderSide(
              //           color: const Color.fromARGB(255, 230, 230, 230)
              //               .withOpacity(0.5)),
              //     ),
              //     errorBorder: OutlineInputBorder(
              //       borderRadius:
              //           const BorderRadius.all(Radius.circular(5.0)),
              //       borderSide: BorderSide(
              //           color: Colors.redAccent.withOpacity(0.5)),
              //     ),
              //     suffix: InkWell(
              //       onTap: () {},
              //       child: const Icon(Icons.visibility,
              //           color: Color.fromARGB(255, 74, 74, 74)),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20.0,
              // ),
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
              SizedBox(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: const Color.fromARGB(255, 0, 110, 195),
                  onPressed: signIn,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: const Text("Login",
                      style:
                      TextStyle(color: Colors.white, fontSize: 15.0)),
                ),
              ),

              const SizedBox(
                height: 15.0,
              ),
              Row(children: [
                const Text("Don't have an account yet? ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 74, 74, 74),
                      fontSize: 14.0,
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupWidget()),
                    );
                  },


                  child: const Text("Sign up",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 110, 195),
                        fontSize: 14.0,
                      )),
                )]),
              RawMaterialButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const ForgotPasswordScreen())),
                child: const Text("Forgot Password?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 110, 195),
                        fontSize: 14.0)),
              ),
              Row(children: const <Widget>[
                Expanded(
                  child: Divider(
                      color: Color.fromARGB(255, 105, 105, 105),
                      endIndent: 20),
                ),
                Text(
                  "or",
                  style:
                  TextStyle(color: Color.fromARGB(255, 74, 74, 74)),
                ),
                Expanded(
                  child: Divider(
                      color: Color.fromARGB(255, 105, 105, 105),
                      indent: 20),
                ),
              ]),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () async {
                  // const AuthScreen().signInWithGoogle();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                    content: Row(
                      children: const <Widget>[
                        CircularProgressIndicator(),
                        Text("  Signing-In...")
                      ],
                    ),
                  ));

                  await Functio().signInWithGoogle();
                  var usersCheck =
                  await users.doc(GoogleUserStaticInfo().uid).get();
                  // var checkuser = usersCheck.exists;
                  FirebaseFirestore.instance
                      .collection("users")
                      .get()
                      .then((QuerySnapshot querySnapshot) => {
                    querySnapshot.docs.forEach((documents) async {
                      var data = documents.data() as Map;

                      if(end == false) {
                        if (users != documents.id) {
                          // print("no data");
                          // print(documents.id.toString());

                          users.doc(GoogleUserStaticInfo().uid).set({
                            "email": GoogleUserStaticInfo().email.toString(),
                            "firstname": GoogleUserStaticInfo().firstname,
                            "lastname": GoogleUserStaticInfo().lastname,
                            "role": "user"
                          });
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) =>
                          //     const IntroductionScreens()));
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const IntroductionScreens()),
                                  (Route route) => false);
                          end = true;
                        }

                      }
                      // else{
                      //   Navigator.of(context).pushAndRemoveUntil(
                      //       MaterialPageRoute(builder: (context) => const HomePage()),
                      //           (Route route) => false);
                      // }

                    }) //for loop
                  });




                },
                child: Material(
                  color: const Color.fromARGB(255, 0, 110, 195),
                  borderRadius: BorderRadius.circular(5.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Ink.image(
                          image: const AssetImage(
                              'assets/images/google2.png'),
                          height: 40,
                          width: 30),
                      const SizedBox(width: 10.0, height: 50),
                      const Text('Sign in with Google',
                          style: TextStyle(
                              color: Colors.white, fontSize: 14.0)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //===========FUNCTIONS
/* Future<bool> isLoggedIn() async {
    User user = await FirebaseAuth.currentUser();
    if (user == null) {
      return false;
    }
    return user.is;
  }
 */

  Future signIn() async {
    try {
      /// In the below, with if statement we have some simple validate
      if (_emailController.text.isNotEmpty &
      _passwordController.text.isNotEmpty) {
        setState(() => loading = true);

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        var user = FirebaseAuth.instance.currentUser;

        if (user!.emailVerified == false) {
          //Not verified
          setState(() {
            loading = false;
          });
          // logOut();
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }
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
            title: const Text('Invalid Credentials.'),
            content: const SingleChildScrollView(
              child: Text(
                  "Invalid Credentials. Please enter a valid Email Address and Password.\n\n\n"
                      "NOTE: if you used Google Sign in for logging this account, Please Sign in with Google"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Got it'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                },
              ),
            ],
          );
        },
      );
    }
  } //signIn close
}// class closing