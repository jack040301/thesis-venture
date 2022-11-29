// ignore_for_file: unnecessary_const, empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/auth_screen.dart';
import 'package:main_venture/profile_screen.dart';
import 'package:main_venture/splash_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:main_venture/sample.dart';

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
      title: "Flutter Log In & Sign up Authentication with FireBase",
      theme: ThemeData(),
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
    // TODO: implement initState
    super.initState();
<<<<<<< Updated upstream
    Future.delayed(Duration(seconds: 5)).then((value) => Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => AuthScreen())));
=======

    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Navigator.of(context).pushReplacement(
           // MaterialPageRoute(builder: (context) => const samples())));
            MaterialPageRoute(builder: (context) => HomePage())));
>>>>>>> Stashed changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 200.0,
            width: 200.0,
            child: LottieBuilder.asset('assets/animassets/mapanimation.json')),
      ),
<<<<<<< Updated upstream
=======
      nextScreen:
          const HomePage(), //CHANGE HERE IF YOU WANT TO SEE YOUR SCREEN IMMEDIATELY
      splashIconSize: 250,
      duration: 3400,
>>>>>>> Stashed changes
    );
  }
}
