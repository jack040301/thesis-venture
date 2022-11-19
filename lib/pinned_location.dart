import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main_venture/profile_screen.dart';
import 'package:main_venture/auth_screen.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:main_venture/component/customComponent.dart';


class PinnedLocation extends StatefulWidget {
  const PinnedLocation({Key? key}) : super(key: key);

  @override
  _PinnedLocationState createState() => _PinnedLocationState();
}

class _PinnedLocationState extends State<PinnedLocation> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              showDialog(context: context, builder: (context) => AlertDialog(
                content: Container(
                  height: 450,
                  width: 500,
                  child: Column(
                    children: [
                      Row (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(''),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('PINNED LOCATIONS', style: TextStyle(fontSize: 20, fontFamily: 'Questrial',),),
                          ),
                          InkWell(
                            child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                            onTap: (){
                              Navigator.of(context).pop();

                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: Image.asset('assets/images/icons/pin.png', height: 25, width: 24,),
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5,),
                                  child: TextButton(
                                    child: Column(
                                      children: [
                                        Text('NORTH CALOOCAN', style: TextStyle(fontSize: 15, color: Colors.black,fontFamily: 'Questrial',),),
                                        Text('Q386+XCQ, Uyguanco Street, 188 Tala, Caloocan', style: TextStyle(fontSize: 10, color: Colors.black,fontFamily: 'Questrial',),),
                                      ],
                                    ),
                                    onPressed: (){
                                      showDialog(context: context, builder: (context) => AlertDialog(
                                        content: Container(
                                          height: 530,
                                          width: 350,
                                          child: Column(
                                            children: <Widget> [
                                              Row (
                                                children: [
                                                  Text(''),
                                                  const Padding(
                                                    padding: EdgeInsets.fromLTRB(20, 0, 10.4, 0),
                                                    child: Text('PINNED LOCATIONS', style: TextStyle(fontSize: 25,fontFamily: 'Questrial',),),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                    child: InkWell(
                                                      child: Container(
                                                        child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                                      ),
                                                      onTap: (){
                                                        Navigator.of(context).pop();

                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Text('NORTH CALOOCAN', style: TextStyle(fontSize: 20, height: 3,fontFamily: 'Questrial',),),
                                                  Text('Population', style: TextStyle(fontSize: 15, height: 2,fontFamily: 'Questrial',),),
                                                  Text('1,661,584', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                                  Text('Revenue Per Year', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                                  Text('6,811,974,121.00', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                                  Text('Land per sq', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                                  Text('17,333.33', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                                  Text('Budget Required for the Area', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                                  Text('693,333.2', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                                  Text('Related Businesses', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                                  Text('2', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                                  Text('67%', style: TextStyle(fontSize: 40,height: 2,fontFamily: 'Questrial',),),

                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                    child: InkWell(
                                                      child: Container(
                                                        child: Image.asset('assets/images/icons/share.png', height: 25, width: 25,),
                                                      ),
                                                      onTap: (){
                                                        showDialog(context: context, builder: (context) => AlertDialog(
                                                          content:
                                                          Container(
                                                            height: 200,
                                                            width: 250,
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.fromLTRB(220, 0, 0, 0),
                                                                  child: InkWell(
                                                                    child: Container(
                                                                      child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                                                    ),
                                                                    onTap: (){
                                                                      Navigator.of(context).pop();

                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Image.asset('assets/images/icons/copy.png', height: 20, width: 20,),
                                                                      const Text('Copy link to share', style: TextStyle(fontSize: 25,fontFamily: 'Questrial',)),
                                                                    ],),
                                                                ),
                                                                Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2,fontFamily: 'Questrial',)),
                                                                const Text('__________________________________', style: TextStyle(height: -.2,fontFamily: 'Questrial',),),
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
                                                        child: Image.asset('assets/images/icons/delete.png', height: 25, width: 25,),
                                                      ),
                                                      onTap: (){
                                                        showDialog(context: context, builder: (context) => AlertDialog(
                                                          content:
                                                          Container(
                                                            height: 200,
                                                            width: 250,
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.fromLTRB(230, 0, 0, 0),
                                                                  child: InkWell(
                                                                    child: Container(
                                                                      child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                                                    ),
                                                                    onTap: (){
                                                                      Navigator.of(context).pop();

                                                                    },
                                                                  ),
                                                                ),
                                                                const Padding(
                                                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                                                  child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,fontFamily: 'Questrial',)),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                                      child: TextButton(
                                                                        child: const Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue, fontFamily: 'Questrial',),),
                                                                        onPressed: (){
                                                                          Navigator.of(context).pop();
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                      child: TextButton(
                                                                        child: const Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red, fontFamily: 'Questrial',),),
                                                                        onPressed: (){
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
                                      ),
                                      );

                                    },
                                  ),),

                                const Text('___________________'),
                              ],),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: InkWell(
                                child: Container(
                                  child: Image.asset('assets/images/icons/share.png', height: 15, width: 11.7,),
                                ),
                                onTap: (){
                                  showDialog(context: context, builder: (context) => AlertDialog(
                                    content:
                                    Container(
                                      height: 200,
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(220, 0, 0, 0),
                                            child: InkWell(
                                              child: Container(
                                                child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset('assets/images/icons/copy.png', height: 20, width: 20,),
                                                const Text('Copy link to share', style: TextStyle(fontSize: 25,fontFamily: 'Questrial',)),
                                              ],),
                                          ),
                                          Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2,fontFamily: 'Questrial',)),
                                          const Text('__________________________________', style: TextStyle(height: -.2,),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  );

                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: InkWell(
                                child: Container(
                                  child: Image.asset('assets/images/icons/delete.png', height: 15, width: 11.7,),
                                ),
                                onTap: (){
                                  showDialog(context: context, builder: (context) => AlertDialog(
                                    content:
                                    Container(
                                      height: 200,
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(230, 0, 0, 0),
                                            child: InkWell(
                                              child: Container(
                                                child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                            child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontFamily: 'Questrial',)),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                child: TextButton(
                                                  child: const Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue,fontFamily: 'Questrial',),),
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: TextButton(
                                                  child: const Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red,fontFamily: 'Questrial',),),
                                                  onPressed: (){
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
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row (

                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: Container(
                                child: Image.asset('assets/images/icons/pin.png', height: 25, width: 25,),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                    child: TextButton(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(18, 0, 25, 0),
                                        child: Column(
                                          children: [
                                            Text('BAGONG SILANG', style: TextStyle(fontSize: 15, color: Colors.black,),),
                                            Text('Barangay 176, Caloocan, Metro Manila', style: TextStyle(fontSize: 10, color: Colors.black,),),
                                          ],
                                        ),
                                      ),
                                      onPressed: (){
                                        showDialog(context: context, builder: (context) => AlertDialog(
                                          content: Container(
                                            height: 530,
                                            width: 350,
                                            child: Column(
                                              children: <Widget> [
                                                Row (
                                                  children: [
                                                    Text(''),
                                                    const Padding(
                                                      padding: EdgeInsets.fromLTRB(20, 0, 10.4, 0),
                                                      child: Text('PINNED LOCATIONS', style: TextStyle(fontSize: 25,),),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                      child: InkWell(
                                                        child: Container(
                                                          child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                                        ),
                                                        onTap: (){
                                                          Navigator.of(context).pop();

                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Text('NORTH CALOOCAN', style: TextStyle(fontSize: 20, height: 3,),),
                                                    Text('Population', style: TextStyle(fontSize: 15, height: 2,),),
                                                    Text('1,661,584', style: TextStyle(fontSize: 23,),),
                                                    Text('Revenue Per Year', style: TextStyle(fontSize: 15,height: 2,),),
                                                    Text('6,811,974,121.00', style: TextStyle(fontSize: 23,),),
                                                    Text('Land per sq', style: TextStyle(fontSize: 15,height: 2,),),
                                                    Text('17,333.33', style: TextStyle(fontSize: 23,),),
                                                    Text('Budget Required for the Area', style: TextStyle(fontSize: 15,height: 2,),),
                                                    Text('693,333.2', style: TextStyle(fontSize: 23,),),
                                                    Text('Related Businesses', style: TextStyle(fontSize: 15,height: 2,),),
                                                    Text('2', style: TextStyle(fontSize: 23,),),
                                                    Text('67%', style: TextStyle(fontSize: 40,height: 2,),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                      child: InkWell(
                                                        child: Container(
                                                          child: Image.asset('assets/images/icons/share.png', height: 25, width: 25,),
                                                        ),
                                                        onTap: (){
                                                          showDialog(context: context, builder: (context) => AlertDialog(
                                                            content:
                                                            Container(
                                                              height: 200,
                                                              width: 250,
                                                              child: Column(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(220, 0, 0, 0),
                                                                    child: InkWell(
                                                                      child: Container(
                                                                        child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                                                      ),
                                                                      onTap: (){
                                                                        Navigator.of(context).pop();

                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        Image.asset('assets/images/icons/copy.png', height: 20, width: 20,),
                                                                        const Text('Copy link to share', style: TextStyle(fontSize: 25,)),
                                                                      ],),
                                                                  ),
                                                                  Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2)),
                                                                  const Text('__________________________________', style: TextStyle(height: -.2),),
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
                                                          child: Image.asset('assets/images/icons/delete.png', height: 25, width: 25,),
                                                        ),
                                                        onTap: (){
                                                          showDialog(context: context, builder: (context) => AlertDialog(
                                                            content:
                                                            Container(
                                                              height: 200,
                                                              width: 250,
                                                              child: Column(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(230, 0, 0, 0),
                                                                    child: InkWell(
                                                                      child: Container(
                                                                        child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                                                      ),
                                                                      onTap: (){
                                                                        Navigator.of(context).pop();

                                                                      },
                                                                    ),
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                                                    child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                                        child: TextButton(
                                                                          child: const Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue),),
                                                                          onPressed: (){
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                        child: TextButton(
                                                                          child: const Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red),),
                                                                          onPressed: (){
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
                                        ),
                                        );

                                      },
                                    ),),

                                  const Text('___________________'),
                                ],),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: InkWell(
                                child: Container(
                                  child: Image.asset('assets/images/icons/share.png', height: 15, width: 12.2,),
                                ),
                                onTap: (){
                                  showDialog(context: context, builder: (context) => AlertDialog(
                                    content:
                                    Container(
                                      height: 200,
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(220, 0, 0, 0),
                                            child: InkWell(
                                              child: Container(
                                                child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset('assets/images/icons/copy.png', height: 20, width: 20,),
                                                const Text('Copy link to share', style: TextStyle(fontSize: 25,)),
                                              ],),
                                          ),
                                          Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2)),
                                          const Text('__________________________________', style: TextStyle(height: -.2),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  );

                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: InkWell(
                                child: Container(
                                  child: Image.asset('assets/images/icons/delete.png', height: 15, width: 12.2,),
                                ),
                                onTap: (){
                                  showDialog(context: context, builder: (context) => AlertDialog(
                                    content:
                                    Container(
                                      height: 200,
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(230, 0, 0, 0),
                                            child: InkWell(
                                              child: Container(
                                                child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                            child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                child: TextButton(
                                                  child: const Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue),),
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: TextButton(
                                                  child: const Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red),),
                                                  onPressed: (){
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
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: Container(
                                child: Image.asset('assets/images/icons/pin.png', height: 25, width: 25,),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5,),
                                    child: TextButton(
                                      child: Column(
                                        children: [
                                          Text('CONGRESSIONAL ROAD EX....', style: TextStyle(fontSize: 15, color: Colors.black,),),
                                          Text('Barangay 171, Caloocan, Metro Manila', style: TextStyle(fontSize: 10, color: Colors.black,),),
                                        ],
                                      ),
                                      onPressed: (){
                                        showDialog(context: context, builder: (context) => AlertDialog(
                                          content: Container(
                                            height: 530,
                                            width: 350,
                                            child: Column(
                                              children: <Widget> [
                                                Row (
                                                  children: [
                                                    const Text(''),
                                                    const Padding(
                                                      padding: EdgeInsets.fromLTRB(20, 0, 10.4, 0),
                                                      child: Text('PINNED LOCATIONS', style: TextStyle(fontSize: 25,),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                      child: InkWell(
                                                        child: Container(
                                                          child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                                        ),
                                                        onTap: (){
                                                          Navigator.of(context).pop();

                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Text('NORTH CALOOCAN', style: TextStyle(fontSize: 20, height: 3,),),
                                                    Text('Population', style: TextStyle(fontSize: 15, height: 2,),),
                                                    Text('1,661,584', style: TextStyle(fontSize: 23,),),
                                                    Text('Revenue Per Year', style: TextStyle(fontSize: 15,height: 2,),),
                                                    Text('6,811,974,121.00', style: TextStyle(fontSize: 23,),),
                                                    Text('Land per sq', style: TextStyle(fontSize: 15,height: 2,),),
                                                    Text('17,333.33', style: TextStyle(fontSize: 23,),),
                                                    Text('Budget Required for the Area', style: TextStyle(fontSize: 15,height: 2,),),
                                                    Text('693,333.2', style: TextStyle(fontSize: 23,),),
                                                    Text('Related Businesses', style: TextStyle(fontSize: 15,height: 2,),),
                                                    Text('2', style: TextStyle(fontSize: 23,),),
                                                    Text('67%', style: TextStyle(fontSize: 40,height: 2,),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                      child: InkWell(
                                                        child: Container(
                                                          child: Image.asset('assets/images/icons/share.png', height: 25, width: 25,),
                                                        ),
                                                        onTap: (){
                                                          showDialog(context: context, builder: (context) => AlertDialog(
                                                            content:
                                                            Container(
                                                              height: 200,
                                                              width: 250,
                                                              child: Column(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(220, 0, 0, 0),
                                                                    child: InkWell(
                                                                      child: Container(
                                                                        child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                                                      ),
                                                                      onTap: (){
                                                                        Navigator.of(context).pop();

                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        Image.asset('assets/images/icons/copy.png', height: 20, width: 20,),
                                                                        const Text('Copy link to share', style: TextStyle(fontSize: 25,)),
                                                                      ],),
                                                                  ),
                                                                  Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2)),
                                                                  const Text('__________________________________', style: TextStyle(height: -.2),),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          );

                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                      child: InkWell(
                                                        child: Container(
                                                          child: Image.asset('assets/images/icons/delete.png', height: 25, width: 25,),
                                                        ),
                                                        onTap: (){
                                                          showDialog(context: context, builder: (context) => AlertDialog(
                                                            content:
                                                            Container(
                                                              height: 200,
                                                              width: 250,
                                                              child: Column(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(230, 0, 0, 0),
                                                                    child: InkWell(
                                                                      child: Container(
                                                                        child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                                                      ),
                                                                      onTap: (){
                                                                        Navigator.of(context).pop();

                                                                      },
                                                                    ),
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                                                    child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                                        child: TextButton(
                                                                          child: const Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue),),
                                                                          onPressed: (){
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                        child: TextButton(
                                                                          child: const Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red),),
                                                                          onPressed: (){
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
                                        ),
                                        );

                                      },
                                    ),),

                                  const Text('___________________'),
                                ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: InkWell(
                                child: Container(
                                  child: Image.asset('assets/images/icons/share.png', height: 15, width: 12.2,),
                                ),
                                onTap: (){
                                  showDialog(context: context, builder: (context) => AlertDialog(
                                    content:
                                    Container(
                                      height: 200,
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(220, 0, 0, 0),
                                            child: InkWell(
                                              child: Container(
                                                child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset('assets/images/icons/copy.png', height: 20, width: 20,),
                                                const Text('Copy link to share', style: TextStyle(fontSize: 25,)),
                                              ],),
                                          ),
                                          Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2)),
                                          const Text('__________________________________', style: TextStyle(height: -.2),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  );

                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: InkWell(
                                child: Container(
                                  child: Image.asset('assets/images/icons/delete.png', height: 15, width: 12.2,),
                                ),
                                onTap: (){
                                  showDialog(context: context, builder: (context) => AlertDialog(
                                    content:
                                    Container(
                                      height: 200,
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(230, 0, 0, 0),
                                            child: InkWell(
                                              child: Container(
                                                child: Image.asset('assets/images/icons/close.png', height: 20, width: 20,),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                            child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                child: TextButton(
                                                  child: const Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue),),
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: TextButton(
                                                  child: const Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red),),
                                                  onPressed: (){
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
                      ),
                    ],
                  ),
                ),
              ),);
            },
            child: const Text('Pinned Locations', style: TextStyle(color: Colors.black, fontFamily: 'Questrial'),),
          ),
        ),
      ),
    );
  }
}
