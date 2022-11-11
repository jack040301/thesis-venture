import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
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

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Nikki",
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

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Ba-alan",
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

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "baalan.bscs2019@gmail.com",
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

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "********",
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
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: const Color.fromARGB(255, 0, 110, 195),
                  onPressed: null,
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: const Text("Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 15.0)),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupWidget()),
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
                    const SizedBox(
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
                  onTap: () {
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
                  image: const AssetImage('assets/images/google2.png'),
                  height: 40,
                  width: 30),
                  const SizedBox(width: 10.0, height: 50),
                  const Text('Signup using Google account',
                  style:
                  TextStyle(color: Colors.white, fontSize: 14.0)),
                ]
              ),
                  )
          )
            ],
          ),
        ),
      )
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
