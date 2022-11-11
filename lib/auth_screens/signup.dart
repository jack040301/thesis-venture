import 'package:flutter/material.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF8FBFF),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.8, 0),
                child: IconButton(
                  color: Colors.transparent,
                  iconSize: 60,
                  icon: const Icon(
                    Icons.clear,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              const Align(
                  alignment: Alignment.topRight, child: Icon(Icons.close)),
              Ink.image(
                  image: const AssetImage('assets/images/VentureLogo.png'),
                  height: 50),
              const Align(
                alignment: AlignmentDirectional(-0.75, 0),
                child: SelectionArea(
                    child: Text("Sign Up",
                        style: TextStyle(
                            color: Color.fromARGB(255, 74, 74, 74),
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            height: 1.5))),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.75, 0),
                child: SelectionArea(
                    child: Text(
                  'First Name',
                )),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.05, 0),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: firstNameController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Juan',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFDEDCDC),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.75, 0),
                child: SelectionArea(
                    child: Text(
                  'Last Name',
                )),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.05, 0),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: lastNameController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Dela Cruz',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFDEDCDC),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.75, 0),
                child: SelectionArea(
                    child: Text(
                  'Email Address',
                )),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.05, 0),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: emailController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'delacruz.juan.bscs2019@gmail.com',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFDEDCDC),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.75, 0),
                child: SelectionArea(
                    child: Text(
                  'Password',
                )),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.05, 0),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: passwordController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '*********',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFDEDCDC),
                    ),
                    maxLines: null,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.65, 0),
                child: SelectionArea(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text("Already have an Account ?"),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await users.add({
                    'firstname': firstNameController.text,
                    'lastname': lastNameController.text,
                    'email': emailController.text,
                    'password': passwordController.text,
                  });
                },
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                )),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* Future signIn() async {
 try {
   
    if(emailController.text.isNotEmpty & passwordController.text.isNotEmpty & firstNameController.text.isEmpty & lastNameController.text. isEmpty){
     FirebaseFirestore db = FirebaseFirestore.instance;

      final user = <String, String>{"email": emailController.text, "Passowrd": passwordController.text, "firstname": firstNameController.text, "lastname":lastNameController.text};

      await Fire

    }

    } catch (e) {
    
     
    }


  } */
}
