import 'package:flutter/material.dart';
import 'package:main_venture/feat_screens/about_us.dart';
import 'package:main_venture/feat_screens/customize_acc.dart';
import 'package:main_venture/feat_screens/how_to_use_app.dart';
import 'package:main_venture/feat_screens/termscondi.dart';

//SETTINGS IN THE MAP

class SetDialog {
  Future showMyDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
                padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
                height: 400,
                width: 430,
                child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Settings',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Questrial',
                              color: Colors.grey.shade900,
                              fontSize: 23,
                            ),
                          ),
                          const SizedBox(
                              width: 55
                          ),

                          Align(
                  alignment: Alignment.topRight,
                child: InkWell(
                  child: Image.asset(
                    'assets/images/icons/close.png',
                    height: 15,
                    width: 15,
                  ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ),
                      ],
                      ),
                    ),
                    const SizedBox(
                      height: 35
                    ),

                    TextButton(
                      child: Text(
                        'Customize Account',
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            color: Colors.grey.shade900,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomizeAccScreen()));
                      },
                    ),
                    TextButton(
                      child: Text(
                        'How to use the App',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            color: Colors.grey.shade900,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ManualScreen()));
                      },
                    ),
                    TextButton(
                      child: Text(
                        'About us',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            color: Colors.grey.shade900,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutUsScreen()));
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Terms and Conditions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            color: Colors.grey.shade900,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsCondiScreen()));
                      },
                    ),
                    const SizedBox(
                        height: 80
                    ),
                  ],
                ),
                )),
          );
        });
  }
}
