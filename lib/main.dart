// ignore_for_file: unnecessary_const, empty_catches

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/dialogbox.dart';
import 'package:main_venture/auth_screen.dart';


/* import 'package:main_venture/auth_screens/signup.dart';
import 'package:main_venture/navigation.dart';


/*import 'package:main_venture/navigation.dart';

import 'package:main_venture/dialog.dart';
import 'package:main_venture/dialogbutton.dart';*/

import 'package:main_venture/settings.dart';

/*import 'package:main_venture/navigation.dart';*/
import 'package:main_venture/dialogbutton.dart';

/*import 'package:main_venture/navigation.dart';
import 'package:main_venture/dialog.dart';*/

import 'package:main_venture/dialogbutton.dart';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:main_venture/pinned_location.dart';


void main() async {
  /// initialize FireBase App
  ///
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //runApp(const MyApp());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Venture",
      theme: ThemeData(fontFamily: 'Questrial'),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Navigator.of(context).pushReplacement(


            MaterialPageRoute(builder: (context) => const AuthScreen())));

  }


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/animassets/Logo.gif', width: 250,
              height: 150)
        ],
      ),
      nextScreen: const PinnedLocation(),
      splashIconSize: 250,
      duration: 3400,
    );
  }
}