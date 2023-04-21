import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class SimuDialog {
  Future<void> showSimulation(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                content: Form(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(
                height: 5.0,
              ),
              // const Align(
              // alignment: Alignment.topRight,
              // child: Icon(Icons.close)),
              const SizedBox(
                height: 5.0,
              ),
              /*     const Align(
                  alignment: Alignment.topRight, child: Icon(Icons.close),
                  ), */
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                  width: double.maxFinite,
                  child: TextButtonTheme(
                      data: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: Colors.white,
                              //padding: const EdgeInsets.fromLTRB(20, 2, 40, 7),
                              child: const Center(
                                child: Text(
                                    "Simulate your Venture Business Establishment",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 28, 28, 28),
                                        fontSize: 16.0)), // <-- Text
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.fromLTRB(65, 10, 35, 5),
                              child:  Row(
                                children: <Widget>[
                                  Image(
                                      image: AssetImage(
                                          'assets/images/icons/simuVector.png'),
                                      height: 80)
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            ),
                            GestureDetector(
                              onTap: () async {
                                goToWebPage("https://jrchjuls.itch.io/my-game");
                                // Discover().showDiscover(context);
                              },
                              child: Material(
                                color: const Color.fromARGB(255, 0, 110, 195),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10.0, height: 35),
                                    Text('Simulate Business\t\t',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0)),
                                  ],
                                ),
                              ),
                            )
                          ])))
            ])));
          });
        });
  }
}

Future<void> goToWebPage(String urlString) async {
  final Uri _url = Uri.parse(urlString);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
