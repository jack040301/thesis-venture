// ignore_for_file: unnecessary_const, empty_catches

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/auth_screen.dart';
import 'package:main_venture/SavePinnedLocations.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_venture/feat_screens/landingpage.dart';
import 'package:main_venture/feat_screens/layer_simulation.dart';
import 'package:main_venture/feat_screens/slidingpanel.dart';
import 'package:main_venture/feat_screens/upgrade_account.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:main_venture/screens/alertbox.dart';
import 'package:main_venture/models/demog_result.dart';

//IMPORT YOUR FILE HERE IF YOU DONT WANT TO GO TO THE LOGIN PAGE STATE
//DO NOT CHANGE AUTH SCREEN AFTER THE SPLASH SCREEN IF YOU ARE ACCESSING PROFILE SCREEN PAGE, YOU MUST LOGIN FIRST
/* import 'package:main_venture/feat_screens/pinned_location.dart';
import 'package:main_venture/feat_screens/dialogbutton.dart';
import 'package:main_venture/feat_screens/profile_screen.dart';
import 'package:main_venture/feat_screens/settings.dart';
import 'package:main_venture/feat_screens/upgrade_account.dart';
import 'package:main_venture/feat_screens/landingpage.dart';
import 'package:main_venture/feat_screens/layer_simulation.dart';
import 'package:main_venture/feat_screens/slidingpanel.dart';*/

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
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/animassets/Venture_Splash.gif', width: 400  , height: 300)
        ],
      ),
      nextScreen:
          const HomePage(), //CHANGE HERE IF YOU WANT TO SEE YOUR SCREEN IMMEDIATELY
      splashIconSize: 250,
      duration: 3400,
    );
  }
}
