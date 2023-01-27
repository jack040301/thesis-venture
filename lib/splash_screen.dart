import 'package:flutter/material.dart';

/* import 'models/forecasting/barfore.dart';
import 'models/forecasting/forecasting.dart'; */

class Screensplash extends StatelessWidget {
  const Screensplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(children: [Stack()]),
      ),
    );
  }
}
