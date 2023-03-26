import 'package:flutter/material.dart';


//DIALOG IN THE APP IN HISTORY UPON CLICKING THE LIST VIEW CARD
class HistoryDialog {
  Future showHistoryDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
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
                          'PINNED LOCATIONS\t\t\t\t',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Questrial',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                        '1,661,584\n',
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
                        '6,811,974,121.00\n',
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
                        '17,333.33\n',
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
                        '693,333.2\n',
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'Questrial',
                        ),
                      ),
                      Text(
                        'Your business is',
                        style: TextStyle(
                          fontSize: 20,
                          height: 2,
                          fontFamily: 'Questrial',
                        ),
                      ),
                      Text(
                        '67%',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Questrial',
                        ),
                      ),
                      Text(
                        'ideal',
                        style: TextStyle(
                          fontSize: 20,
                          height: 2,
                          fontFamily: 'Questrial',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: InkWell(
                          child: Container(
                            child: Image.asset(
                              'assets/images/icons/share.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Container(
                                  height: 200,
                                  width: 250,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(220, 0, 0, 0),
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
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/icons/copy.png',
                                              height: 20,
                                              width: 20,
                                            ),
                                            const Text('Copy link to share',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  fontFamily: 'Questrial',
                                                )),
                                          ],
                                        ),
                                      ),
                                      Text(
                                          'Venture.link.lat23.45.67.long89.12.34',
                                          style: TextStyle(
                                            fontSize: 15,
                                            height: 2,
                                            fontFamily: 'Questrial',
                                          )),
                                      const Text(
                                        '__________________________________',
                                        style: TextStyle(
                                          height: -.2,
                                          fontFamily: 'Questrial',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: InkWell(
                          child: Container(
                            child: Image.asset(
                              'assets/images/icons/delete.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Container(
                                  height: 200,
                                  width: 250,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(230, 0, 0, 0),
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
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 48),
                                        child: Text(
                                            'Are you sure you want to delete this saved location?',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Questrial',
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 0, 50, 0),
                                            child: TextButton(
                                              child: const Text(
                                                'CANCEL',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  height: 2,
                                                  color: Colors.blue,
                                                  fontFamily: 'Questrial',
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: TextButton(
                                              child: const Text(
                                                'YES',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  height: 2,
                                                  color: Colors.red,
                                                  fontFamily: 'Questrial',
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
