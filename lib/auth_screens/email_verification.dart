import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl'
    'utter/material.dart';
import 'package:main_venture/feat_screens/personalInfo.dart';

import 'package:main_venture/screens/home_page.dart';
import '../screens/onboarding_screen.dart';
import '../userInfo.dart';
import 'login.dart';
import 'package:main_venture/auth_screens/signup.dart';

class Emailverificationscreen extends StatefulWidget {
  const Emailverificationscreen({super.key});

  @override
  //State<emailverificationscreen> createState() =>]emailverificationscreenState();
  EmailverificationscreenState createState() => EmailverificationscreenState();
}

class EmailverificationscreenState extends State<Emailverificationscreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendEmailVerification();

      timer = Timer.periodic(
        const Duration(seconds: 5),
            (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => canResendEmail = true);
    } catch (e) {
      //print(e);
    }
  }

  Future navigateToIntroductionScreen() async {

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
        const IntroductionScreens()));


  }

  func() async{
    var usersCheck =
        await users.doc(GoogleUserStaticInfo().uid).get();
    // var checkuser = usersCheck.exists;


    if (usersCheck.exists) {


      navigateToIntroductionScreen();
    }else{

      users.doc(GoogleUserStaticInfo().uid).set({
        "email": GoogleUserStaticInfo().email.toString(),
        "firstname": GoogleUserStaticInfo().firstname,
        "lastname": GoogleUserStaticInfo().lastname,
      });

      navigateToIntroductionScreen();
    }

  }

  @override
  Widget build(BuildContext context) {

  if(isEmailVerified){

    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) =>
    //     const IntroductionScreens()));

    return func();


  }else {

  return  Scaffold(
    appBar: AppBar(
      title: const Text('Verify Email'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'A Verification email has been sent to Your Email.',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          // resend email
          const SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            icon: const Icon(Icons.email, size: 32),
            label: const Text(
              'Resend Email',
              style: TextStyle(fontSize: 15),
            ),
            onPressed: canResendEmail ? sendEmailVerification : null,
          ),
          //cancel
          const SizedBox(height: 24),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              icon: const Icon(Icons.cancel, size: 32),
              label: const Text(
                'Cancel',
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SignupWidget(),
                ));
              }),
        ],
      ),
    ),
  );


  // const personalinfo()

  //google

}}}
