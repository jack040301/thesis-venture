import 'package:flutter/material.dart';
import 'package:main_venture/feat_screens/contactus.dart';
//import 'package:main_venture/feat_screens/pinnedlocationshistory.dart';
import 'package:main_venture/feat_screens/termscondi.dart';
import 'package:main_venture/feat_screens/pinnedlocation_new.dart';
import 'package:main_venture/feat_screens/upgrade_account.dart';

import '../userInfo.dart';
import '../feat_screens/ChangePassword.dart';
/* import '../feat_screens/SliderScreen.dart'; */
import '../feat_screens/about_us.dart';
import '../feat_screens/customize_acc.dart';
import '../feat_screens/history.dart';
import '../feat_screens/how_to_use_app.dart';
import '../feat_screens/settings.dart';
import '../feat_screens/listhistorycard.dart';
import 'quick_guide.dart';

class Discover {
  Future<void> showDiscover(BuildContext context) async {
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
                              padding: const EdgeInsets.fromLTRB(20, 2, 40, 7),
                              child: const Center(
                                child: Text("Discover how Venture works",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 28, 28, 28),
                                        fontSize: 18.0)), // <-- Text
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.fromLTRB(65, 10, 35, 5),
                              child:  Row(
                                children: <Widget>[
                                  Image(
                                      image: AssetImage(
                                          'assets/images/icons/CoordinatesIcon.png'),
                                      height: 200)
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            ),
                            GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SliderScreen()));
                              },
                              child: Material(
                                color: const Color.fromARGB(255, 0, 110, 195),
                                borderRadius: BorderRadius.circular(5.0),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10.0, height: 50),
                                    Text('Discover!\t\t',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0)),
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
