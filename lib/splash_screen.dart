import 'package:flutter/material.dart';

import 'models/forecasting_population.dart';

class SplashScreenFore extends StatelessWidget {
  const SplashScreenFore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: BarchartPop(markerid: "asL0zg6G4OXxmIpY3UoT"), //change
      ),
    );
  }
}
