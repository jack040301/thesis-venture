import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_venture/screens/home_page.dart';

//this is only a sample
class PredictionDialog {
    String name, address, population;

   PredictionDialog({required this.name, required this.address, required this.population});

  Future showPredictionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 530,
          width: 350,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const Text(''),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    child: Text(
                      'PINNED LOCATIONS',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Questrial',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: InkWell(
                      child: Container(
                        child: Image.asset(
                          'assets/images/icons/close.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Name: ${name}',
                    style: TextStyle(
                      fontSize: 20,
                      height: 3,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    'Population: ${address}',
                    style: TextStyle(
                      fontSize: 15,
                      height: 2,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    '261,729',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    'Revenue Per Year',
                    style: TextStyle(
                      fontSize: 15,
                      height: 2,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    '1,073,006,946.81',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    'Land per sq',
                    style: TextStyle(
                      fontSize: 15,
                      height: 2,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    '5,240,000',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    'Budget Required for the Area',
                    style: TextStyle(
                      fontSize: 15,
                      height: 2,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    '8,000 per sqm',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  /*    Text(
                                                'Related Businesses',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  height: 2,
                                                  fontFamily: 'Questrial',
                                                ),
                                              ),
                                              Text(
                                                '2',
                                                style: TextStyle(
                                                  fontSize: 23,
                                                  fontFamily: 'Questrial',
                                                ),
                                              ), */
                  Text(
                    '70%',
                    style: TextStyle(
                      fontSize: 40,
                      height: 2,
                      fontFamily: 'Questrial',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
