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
                padding: const EdgeInsets.all(10.0),
                height: 260,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(''),
                          Text(
                            'Settings',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Questrial',
                              color: Colors.grey.shade900,
                              fontSize: 25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                    TextButton(
                      child: Text(
                        'Customize Account',
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            color: Colors.grey.shade900,
                            fontSize: 20),
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
                            fontSize: 20),
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
                            fontSize: 20),
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
                        'Terms and Condition',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            color: Colors.grey.shade900,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsCondiScreen()));
                      },
                    ),
                  ],
                )),
          );
        });
  }
}
