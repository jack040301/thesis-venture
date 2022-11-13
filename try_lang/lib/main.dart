import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Questrial'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('PINNED LOCATIONS', style: TextStyle(fontSize: 20, fontFamily: 'Questrial',),),
                          ),
                          InkWell(
                            child: Container(
                              child: Image.asset('lib/images/close.png', height: 20, width: 20,),
                            ),
                            onTap: (){
                              Navigator.of(context).pop();

                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: Container(
                                child: Image.asset('lib/images/pin.png', height: 25, width: 24,),
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
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(20, 0, 10.4, 0),
                                                      child: Text('PINNED LOCATIONS', style: TextStyle(fontSize: 25,fontFamily: 'Questrial',),),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                      child: InkWell(
                                                        child: Container(
                                                          child: Image.asset('lib/images/close.png', height: 20, width: 20,),
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
                                                  children: [
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
                                                          child: Image.asset('lib/images/share.png', height: 25, width: 25,),
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
                                                                        child: Image.asset('lib/images/close.png', height: 20, width: 20,),
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
                                                                        Image.asset('lib/images/copy.png', height: 20, width: 20,),
                                                                        Text('Copy link to share', style: TextStyle(fontSize: 25,fontFamily: 'Questrial',)),
                                                                      ],),
                                                                  ),
                                                                  Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2,fontFamily: 'Questrial',)),
                                                                  Text('__________________________________', style: TextStyle(height: -.2,fontFamily: 'Questrial',),),
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
                                                          child: Image.asset('lib/images/delete.png', height: 25, width: 25,),
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
                                                                        child: Image.asset('lib/images/close.png', height: 20, width: 20,),
                                                                      ),
                                                                      onTap: (){
                                                                        Navigator.of(context).pop();

                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                                                    child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,fontFamily: 'Questrial',)),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                                        child: TextButton(
                                                                          child: Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue, fontFamily: 'Questrial',),),
                                                                          onPressed: (){
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                        child: TextButton(
                                                                          child: Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red, fontFamily: 'Questrial',),),
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

                                  Text('___________________'),
                                ],),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: InkWell(
                                child: Container(
                                  child: Image.asset('lib/images/share.png', height: 15, width: 12.2,),
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
                                                child: Image.asset('lib/images/close.png', height: 20, width: 20,),
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
                                                Image.asset('lib/images/copy.png', height: 20, width: 20,),
                                                Text('Copy link to share', style: TextStyle(fontSize: 25,fontFamily: 'Questrial',)),
                                              ],),
                                          ),
                                          Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2,fontFamily: 'Questrial',)),
                                          Text('__________________________________', style: TextStyle(height: -.2,),),
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
                                  child: Image.asset('lib/images/delete.png', height: 15, width: 12.2,),
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
                                                child: Image.asset('lib/images/close.png', height: 20, width: 20,),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                            child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontFamily: 'Questrial',)),
                                          ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                  child: TextButton(
                                                    child: Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue,fontFamily: 'Questrial',),),
                                                    onPressed: (){
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                  child: TextButton(
                                                    child: Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red,fontFamily: 'Questrial',),),
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
                                child: Image.asset('lib/images/pin.png', height: 25, width: 25,),
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
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(20, 0, 10.4, 0),
                                                      child: Text('PINNED LOCATIONS', style: TextStyle(fontSize: 25,),),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                      child: InkWell(
                                                        child: Container(
                                                          child: Image.asset('lib/images/close.png', height: 20, width: 20,),
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
                                                  children: [
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
                                                          child: Image.asset('lib/images/share.png', height: 25, width: 25,),
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
                                                                        child: Image.asset('lib/images/close.png', height: 20, width: 20,),
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
                                                                        Image.asset('lib/images/copy.png', height: 20, width: 20,),
                                                                        Text('Copy link to share', style: TextStyle(fontSize: 25,)),
                                                                      ],),
                                                                  ),
                                                                  Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2)),
                                                                  Text('__________________________________', style: TextStyle(height: -.2),),
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
                                                          child: Image.asset('lib/images/delete.png', height: 25, width: 25,),
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
                                                                        child: Image.asset('lib/images/close.png', height: 20, width: 20,),
                                                                      ),
                                                                      onTap: (){
                                                                        Navigator.of(context).pop();

                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                                                    child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                                        child: TextButton(
                                                                          child: Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue),),
                                                                          onPressed: (){
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                        child: TextButton(
                                                                          child: Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red),),
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

                                  Text('___________________'),
                                ],),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: InkWell(
                                child: Container(
                                  child: Image.asset('lib/images/share.png', height: 15, width: 12.2,),
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
                                                child: Image.asset('lib/images/close.png', height: 20, width: 20,),
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
                                                Image.asset('lib/images/copy.png', height: 20, width: 20,),
                                                Text('Copy link to share', style: TextStyle(fontSize: 25,)),
                                              ],),
                                          ),
                                          Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2)),
                                          Text('__________________________________', style: TextStyle(height: -.2),),
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
                                  child: Image.asset('lib/images/delete.png', height: 15, width: 12.2,),
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
                                                child: Image.asset('lib/images/close.png', height: 20, width: 20,),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                            child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                child: TextButton(
                                                  child: Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue),),
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: TextButton(
                                                  child: Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red),),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: Container(
                                child: Image.asset('lib/images/pin.png', height: 25, width: 25,),
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
                                                    Text(''),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(20, 0, 10.4, 0),
                                                      child: Text('PINNED LOCATIONS', style: TextStyle(fontSize: 25,),),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                      child: InkWell(
                                                        child: Container(
                                                          child: Image.asset('lib/images/close.png', height: 20, width: 20,),
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
                                                  children: [
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
                                                          child: Image.asset('lib/images/share.png', height: 25, width: 25,),
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
                                                                        child: Image.asset('lib/images/close.png', height: 20, width: 20,),
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
                                                                        Image.asset('lib/images/copy.png', height: 20, width: 20,),
                                                                        Text('Copy link to share', style: TextStyle(fontSize: 25,)),
                                                                      ],),
                                                                  ),
                                                                  Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2)),
                                                                  Text('__________________________________', style: TextStyle(height: -.2),),
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
                                                          child: Image.asset('lib/images/delete.png', height: 25, width: 25,),
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
                                                                        child: Image.asset('lib/images/close.png', height: 20, width: 20,),
                                                                      ),
                                                                      onTap: (){
                                                                        Navigator.of(context).pop();

                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                                                    child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                                        child: TextButton(
                                                                          child: Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue),),
                                                                          onPressed: (){
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                        child: TextButton(
                                                                          child: Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red),),
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

                                  Text('___________________'),
                                ],),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 22),
                              child: InkWell(
                                child: Container(
                                  child: Image.asset('lib/images/share.png', height: 15, width: 12.2,),
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
                                                child: Image.asset('lib/images/close.png', height: 20, width: 20,),
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
                                                Image.asset('lib/images/copy.png', height: 20, width: 20,),
                                                Text('Copy link to share', style: TextStyle(fontSize: 25,)),
                                              ],),
                                          ),
                                          Text('Venture.link.lat23.45.67.long89.12.34', style: TextStyle(fontSize: 15, height: 2)),
                                          Text('__________________________________', style: TextStyle(height: -.2),),
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
                                  child: Image.asset('lib/images/delete.png', height: 15, width: 12.2,),
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
                                                child: Image.asset('lib/images/close.png', height: 20, width: 20,),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 30, 0, 48),
                                            child: Text('Are you sure you want to delete this saved location?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                                child: TextButton(
                                                  child: Text('CANCEL', style: TextStyle(fontSize: 20,height: 2, color: Colors.blue),),
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: TextButton(
                                                  child: Text('YES', style: TextStyle(fontSize: 20,height: 2, color: Colors.red),),
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
