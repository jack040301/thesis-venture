import 'package:flutter/material.dart';

class Fontscolor {
  var primaryColors = Colors.grey.shade700;
  var widgetColors = const Color.fromARGB(255, 74, 74, 74);
  String fontfam = "Questrial";

  Color colorsOfWidget() {
    var primColors = Colors.grey.shade700;
    return primColors;
  }
}

class HowToUseApp extends Fontscolor {
  @override
  Color colorsOfWidget() {
    const primColors = Color.fromARGB(255, 74, 74, 74);

    return primColors;
  }
}
