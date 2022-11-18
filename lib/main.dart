// ignore_for_file: unnecessary_const, empty_catches

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/dialogbox.dart';
import 'package:main_venture/auth_screen.dart';
<<<<<<< HEAD
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
>>>>>>> c37cb2890b12c7ac60dd941592c900627751ddc2
/* import 'package:main_venture/auth_screens/signup.dart';
import 'package:main_venture/navigation.dart';
import 'package:main_venture/dialog.dart';
import 'package:main_venture/dialogbutton.dart'; */

=======
/*import 'package:main_venture/navigation.dart';*/
import 'package:main_venture/dialogbutton.dart';
>>>>>>> Stashed changes
=======
/*import 'package:main_venture/navigation.dart';
import 'package:main_venture/dialog.dart';*/

import 'package:main_venture/dialogbutton.dart';
>>>>>>> Stashed changes
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';


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
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Navigator.of(context).pushReplacement(
<<<<<<< HEAD
            MaterialPageRoute(builder: (context) => const DialogVenture())));
=======
            MaterialPageRoute(builder: (context) => const AuthScreen())));
>>>>>>> c37cb2890b12c7ac60dd941592c900627751ddc2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 200.0,
            width: 200.0,
            child: LottieBuilder.asset('assets/animassets/mapanimation.json')),
      ),
    );
  }
}