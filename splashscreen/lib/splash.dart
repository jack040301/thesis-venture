import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:splashscreen/main.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Logo.gif', width: 250, height: 150)
        ],
      ),
      nextScreen: const MyHomePage(title: 'Home',),
      splashIconSize: 250,
      duration: 3000,
    );

  }
}
