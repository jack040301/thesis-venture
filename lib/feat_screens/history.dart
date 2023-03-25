import 'package:flutter/material.dart';

import 'Dialogbutton.dart';

class PinnedLocationHistory extends StatefulWidget {
  const PinnedLocationHistory({super.key});

  @override
  State<PinnedLocationHistory> createState() => _PinnedLocationHistoryState();
}

class _PinnedLocationHistoryState extends State<PinnedLocationHistory> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Pinned Locations History'),
        foregroundColor: const Color.fromARGB(255, 44, 45, 48),
        elevation: 0.0,
        leading: const BackButton(
          color: Color.fromARGB(255, 44, 45, 48),
        ),
      ),
      body: const ContentHowToUse(),
    );
  }
}

class ContentHowToUse extends StatelessWidget {
  const ContentHowToUse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(45, 10, 35, 5),
                child: const Row(
                  children: <Widget>[
                    Image(
                        image: AssetImage('assets/images/icons/note.png'),
                        height: 20),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text('\n\t\tBelow are the recent locations pinned',
                          style: TextStyle(
                              color: Color.fromARGB(255, 44, 45, 48),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              //PLACE
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              ),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                        child: Image.asset(
                          'assets/images/icons/pin.png',
                          height: 25,
                          width: 18.6,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              5,
                            ),
                            child: TextButton(
                              child: const Column(
                                children: [
                                  Text(
                                    'NORTH CALOOCAN',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: 'Questrial',
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Text(
                                      'Q386+XCQ, Uyguanco Street, 188 Tala, Caloocan',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontFamily: 'Questrial',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Container(
                                      height: 530,
                                      width: 350,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              const Text(''),
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    20, 0, 5, 0),
                                                child: Text(
                                                  'PINNED LOCATIONS\t\t\t\t',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: 'Questrial',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
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
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        content: Container(
                                                          height: 200,
                                                          width: 250,
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            220,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: InkWell(
                                                                  child:
                                                                      Container(
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/icons/close.png',
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      'assets/images/icons/copy.png',
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                    ),
                                                                    const Text(
                                                                        'Copy link to share',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          fontFamily:
                                                                              'Questrial',
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
                                                                  'Venture.link.lat23.45.67.long89.12.34',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    height: 2,
                                                                    fontFamily:
                                                                        'Questrial',
                                                                  )),
                                                              const Text(
                                                                '__________________________________',
                                                                style:
                                                                    TextStyle(
                                                                  height: -.2,
                                                                  fontFamily:
                                                                      'Questrial',
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
                                                padding: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
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
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        content: Container(
                                                          height: 200,
                                                          width: 250,
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            230,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: InkWell(
                                                                  child:
                                                                      Container(
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/icons/close.png',
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            48),
                                                                child: Text(
                                                                    'Are you sure you want to delete this saved location?',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontFamily:
                                                                          'Questrial',
                                                                    )),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            20,
                                                                            0,
                                                                            50,
                                                                            0),
                                                                    child:
                                                                        TextButton(
                                                                      child:
                                                                          const Text(
                                                                        'CANCEL',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          height:
                                                                              2,
                                                                          color:
                                                                              Colors.blue,
                                                                          fontFamily:
                                                                              'Questrial',
                                                                        ),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        TextButton(
                                                                      child:
                                                                          const Text(
                                                                        'YES',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          height:
                                                                              2,
                                                                          color:
                                                                              Colors.red,
                                                                          fontFamily:
                                                                              'Questrial',
                                                                        ),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
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
                            ),
                          ),

//BAGONG SILANG
                          /* Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                      child: Image.asset('assets/images/icons/pin.png', height: 25, width: 18.6,),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5,),
                          child: TextButton(
                            child: Column(
                              children: [
                                Text('BAGONG SILANG', style: TextStyle(fontSize: 15, color: Colors.black,fontFamily: 'Questrial',),),
                                SingleChildScrollView(child: Text('Barangay 176, Caloocan, Metro Manila', style: TextStyle(fontSize: 10, color: Colors.black,fontFamily: 'Questrial',),),)
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
                                            padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                                            child: Text('PINNED LOCATIONS\t\t\t\t', style: TextStyle(fontSize: 25,fontFamily: 'Questrial',),),
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
                                          Text('1,661,584\n', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                          Text('Revenue Per Year', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                          Text('6,811,974,121.00\n', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                          Text('Land per sq', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                          Text('17,333.33\n', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                          Text('Budget Required for the Area', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                          Text('693,333.2\n', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                          Text('Your business is', style: TextStyle(fontSize: 20,height: 2,fontFamily: 'Questrial',),),
                                          Text('67%', style: TextStyle(fontSize: 40,fontFamily: 'Questrial',),),
                                          Text('ideal', style: TextStyle(fontSize: 20,height: 2,fontFamily: 'Questrial',),),
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
                          ),),*/
                          //CONGRESSIONAL ROAD
                          /* Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                      child: Image.asset('assets/images/icons/pin.png', height: 25, width: 18.6,),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5,),
                          child: TextButton(
                            child: Column(
                              children: [
                                Text('CONGRESSIONAL ROAD EX....', style: TextStyle(fontSize: 15, color: Colors.black,fontFamily: 'Questrial',),),
                                SingleChildScrollView(child: Text('Barangay 171, Caloocan, Metro Manila', style: TextStyle(fontSize: 10, color: Colors.black,fontFamily: 'Questrial',),),)
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
                                            padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                                            child: Text('PINNED LOCATIONS\t\t\t\t', style: TextStyle(fontSize: 25,fontFamily: 'Questrial',),),
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
                                          Text('1,661,584\n', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                          Text('Revenue Per Year', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                          Text('6,811,974,121.00\n', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                          Text('Land per sq', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                          Text('17,333.33\n', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                          Text('Budget Required for the Area', style: TextStyle(fontSize: 15,height: 2,fontFamily: 'Questrial',),),
                                          Text('693,333.2\n', style: TextStyle(fontSize: 23,fontFamily: 'Questrial',),),
                                          Text('Your business is', style: TextStyle(fontSize: 20,height: 2,fontFamily: 'Questrial',),),
                                          Text('67%', style: TextStyle(fontSize: 40,fontFamily: 'Questrial',),),
                                          Text('ideal', style: TextStyle(fontSize: 20,height: 2,fontFamily: 'Questrial',),),
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
                          ),),*/

                          //END
                        ],
                      ),
                    ],
                  ))
            ])));
  }
}
