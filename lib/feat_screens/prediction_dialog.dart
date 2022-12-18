import 'package:flutter/material.dart';

//this is only a sample
class PredictionDialog {
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
                    padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
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
                children: const [
                  Text(
                    'NORTH CALOOCAN',
                    style: TextStyle(
                      fontSize: 20,
                      height: 3,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    'Population',
                    style: TextStyle(
                      fontSize: 15,
                      height: 2,
                      fontFamily: 'Questrial',
                    ),
                  ),
                  Text(
                    '1,661,584',
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
                    '6,811,974,121.00',
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
                    '17,333.33',
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
                    '693,333.2',
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
                    '67%',
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
