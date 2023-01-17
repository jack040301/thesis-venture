import 'package:flutter/material.dart';

class PinnedLocationScreen extends StatefulWidget {
  const PinnedLocationScreen({super.key});

  @override
  State<PinnedLocationScreen> createState() => _PinnedLocationScreenState();
}

class _PinnedLocationScreenState extends State<PinnedLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Pinned Locations'),
        foregroundColor: const Color.fromARGB(255, 44, 45, 48),
        elevation: 0.0,
        leading: const BackButton(
          color: Color.fromARGB(255, 44, 45, 48),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
    child: Image.asset(
    'assets/images/icons/pin.png',
    height: 25,
    width: 25,
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
    child: Column(
    children: const [
    Text(
    'NORTH CALOOCAN',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontFamily: 'Questrial',
    ),
    ),
    SingleChildScrollView(
    child: Text(
    'Q386+XCQ, Uyguanco St., 188 Tala, Caloocan',
    style: TextStyle(
    fontSize: 12,
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
    content: SizedBox(
    height: 530,
    width: 450,
      child: SingleChildScrollView(
    child: Column(
    children: <Widget>[
    Row(
    children: [
    const Text(''),
    const Padding(
    padding: EdgeInsets.fromLTRB(
    20, 0, 5, 0),
    child: Text(
    'PINNED LOCATIONS',
    style: TextStyle(
    fontSize: 18,
    fontFamily: 'Questrial',
    ),
    ),
    ),
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
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
    Column(
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: const [
    Text(
    'NORTH CALOOCAN',
    style: TextStyle(
    fontSize: 18,
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
    Text(
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
    ),
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
    Row(
    mainAxisAlignment:
    MainAxisAlignment.end,
    children: [
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
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
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding:
    const EdgeInsets
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
    const EdgeInsets
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
    20,
    fontFamily:
    'Questrial',
    )),
    ],
    ),
    ),
    const Text(
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
    padding:
    const EdgeInsets.fromLTRB(
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
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding:
    const EdgeInsets
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
    padding:
    const EdgeInsets.fromLTRB(
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
    padding:
    const EdgeInsets.fromLTRB(
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
    ),
    );
    },
    ),
    ),
    const Text('___________________'),
    ],
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
    child: InkWell(
    child: Container(
    child: Image.asset(
    'assets/images/icons/share.png',
    height: 18,
    width: 18,
    ),
    ),
    onTap: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(
    220, 0, 0, 0),
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
    padding: const EdgeInsets.fromLTRB(
    0, 30, 0, 0),
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
    const Text(
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
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
    child: InkWell(
    child: Container(
    child: Image.asset(
    'assets/images/icons/delete.png',
    height: 18,
    width: 18,
    ),
    ),
    onTap: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(
    230, 0, 0, 0),
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
    padding: const EdgeInsets.fromLTRB(
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
    padding: const EdgeInsets.fromLTRB(
    0, 0, 0, 0),
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
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
    child: Container(
    child: Image.asset(
    'assets/images/icons/pin.png',
    height: 25,
    width: 25,
    ),
    ),
    ),
    Container(
    child: Column(
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
    child: TextButton(
    child: Padding(
    padding:
    const EdgeInsets.fromLTRB(18, 0, 9.6, 0),
    child: Column(
    children: [
    const Text(
    'BAGONG SILANG',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black,
    ),
    ),
    const Text(
    'Barangay 176, Caloocan, Metro Manila',
    style: TextStyle(
    fontSize: 12,
    color: Colors.black,
    ),
    ),
    ],
    ),
    ),
    onPressed: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: SizedBox(
    height: 530,
    width: 450,
      child: SingleChildScrollView(
    child: Column(
    children: <Widget>[
    Row(
    children: [
    const Text(''),
    const Padding(
    padding: EdgeInsets.fromLTRB(
    20, 0, 5, 0),
    child: Text(
    'PINNED LOCATIONS',
    style: TextStyle(
    fontSize: 18,
    ),
    ),
    ),
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
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
    Navigator.of(context)
        .pop();
    },
    ),
    ),
    ],
    ),
    Column(
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: const [
    Text(
    'NORTH CALOOCAN',
    style: TextStyle(
    fontSize: 20,
    height: 3,
    ),
    ),
    Text(
    'Population',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '1,661,584',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    'Revenue Per Year',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '6,811,974,121.00',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    'Land per sq',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '17,333.33',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    'Budget Required for the Area',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '693,333.2',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    'Related Businesses',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '2',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    '67%',
    style: TextStyle(
    fontSize: 40,
    height: 2,
    ),
    ),
    ],
    ),
    Row(
    mainAxisAlignment:
    MainAxisAlignment.end,
    children: [
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
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
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding:
    const EdgeInsets
        .fromLTRB(
    220,
    0,
    0,
    0),
    child:
    InkWell(
    child:
    Container(
    child: Image
        .asset(
    'assets/images/icons/close.png',
    height:
    20,
    width:
    20,
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
    const EdgeInsets
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
    Image
        .asset(
    'assets/images/icons/copy.png',
    height:
    20,
    width:
    20,
    ),
    const Text(
    'Copy link to share',
    style:
    TextStyle(
    fontSize:
    25,
    )),
    ],
    ),
    ),
    const Text(
    'Venture.link.lat23.45.67.long89.12.34',
    style: TextStyle(
    fontSize:
    15,
    height:
    2)),
    const Text(
    '__________________________________',
    style: TextStyle(
    height:
    -.2),
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
    padding:
    const EdgeInsets.fromLTRB(
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
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding:
    const EdgeInsets
        .fromLTRB(
    230,
    0,
    0,
    0),
    child:
    InkWell(
    child:
    Container(
    child: Image
        .asset(
    'assets/images/icons/close.png',
    height:
    20,
    width:
    20,
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
    padding: EdgeInsets
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
    )),
    ),
    Row(
    children: [
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
    20,
    0,
    50,
    0),
    child:
    TextButton(
    child:
    const Text(
    'CANCEL',
    style: TextStyle(
    fontSize: 20,
    height: 2,
    color: Colors.blue),
    ),
    onPressed:
    () {
    Navigator.of(context)
        .pop();
    },
    ),
    ),
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
    0,
    0,
    0,
    0),
    child:
    TextButton(
    child:
    const Text(
    'YES',
    style: TextStyle(
    fontSize: 20,
    height: 2,
    color: Colors.red),
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
    ),
    );
    },
    ),
    ),
    const Text('___________________'),
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
    child: InkWell(
    child: Container(
    child: Image.asset(
    'assets/images/icons/share.png',
    height: 18,
    width: 18,
    ),
    ),
    onTap: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(
    220, 0, 0, 0),
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
    padding: const EdgeInsets.fromLTRB(
    0, 30, 0, 0),
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
    )),
    ],
    ),
    ),
    const Text(
    'Venture.link.lat23.45.67.long89.12.34',
    style: TextStyle(
    fontSize: 15, height: 2)),
    const Text(
    '__________________________________',
    style: TextStyle(height: -.2),
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
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
    child: InkWell(
    child: Container(
    child: Image.asset(
    'assets/images/icons/delete.png',
    height: 18,
    width: 18,
    ),
    ),
    onTap: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(
    230, 0, 0, 0),
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
    )),
    ),
    Row(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(
    20, 0, 50, 0),
    child: TextButton(
    child: const Text(
    'CANCEL',
    style: TextStyle(
    fontSize: 20,
    height: 2,
    color: Colors.blue),
    ),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(
    0, 0, 0, 0),
    child: TextButton(
    child: const Text(
    'YES',
    style: TextStyle(
    fontSize: 20,
    height: 2,
    color: Colors.red),
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
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
    child: Container(
    child: Image.asset(
    'assets/images/icons/pin.png',
    height: 25,
    width: 25,
    ),
    ),
    ),
    Container(
    child: Column(
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.fromLTRB(
    0,
    0,
    0,
    5,
    ),
    child: TextButton(
    child: Column(
    children: [
    const Text(
    'CONGRESSIONAL ROAD EX....',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black,
    ),
    ),
    const Text(
    'Barangay 171, Caloocan, Metro Manila',
    style: TextStyle(
    fontSize: 12,
    color: Colors.black,
    ),
    ),
    ],
    ),
    onPressed: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: SizedBox(
    height: 530,
    width: 450,
      child: SingleChildScrollView(
    child: Column(
    children: <Widget>[
    Row(
    children: [
    const Text(''),
    const Padding(
    padding: EdgeInsets.fromLTRB(
    20, 0, 5, 0),
    child: Text(
    'PINNED LOCATIONS',
    style: TextStyle(
    fontSize: 18,
    ),
    ),
    ),
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
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
    Navigator.of(context)
        .pop();
    },
    ),
    ),
    ],
    ),
    Column(
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: const [
    Text(
    'NORTH CALOOCAN',
    style: TextStyle(
    fontSize: 18,
    height: 3,
    ),
    ),
    Text(
    'Population',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '1,661,584',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    'Revenue Per Year',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '6,811,974,121.00',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    'Land per sq',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '17,333.33',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    'Budget Required for the Area',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '693,333.2',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    'Related Businesses',
    style: TextStyle(
    fontSize: 15,
    height: 2,
    ),
    ),
    Text(
    '2',
    style: TextStyle(
    fontSize: 23,
    ),
    ),
    Text(
    '67%',
    style: TextStyle(
    fontSize: 40,
    height: 2,
    ),
    ),
    ],
    ),
    Row(
    mainAxisAlignment:
    MainAxisAlignment.end,
    children: [
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
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
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding:
    const EdgeInsets
        .fromLTRB(
    220,
    0,
    0,
    0),
    child:
    InkWell(
    child:
    Container(
    child: Image
        .asset(
    'assets/images/icons/close.png',
    height:
    20,
    width:
    20,
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
    const EdgeInsets
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
    Image
        .asset(
    'assets/images/icons/copy.png',
    height:
    20,
    width:
    20,
    ),
    const Text(
    'Copy link to share',
    style:
    TextStyle(
    fontSize:
    20,
    )),
    ],
    ),
    ),
    const Text(
    'Venture.link.lat23.45.67.long89.12.34',
    style: TextStyle(
    fontSize:
    15,
    height:
    2)),
    const Text(
    '__________________________________',
    style: TextStyle(
    height:
    -.2),
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
    padding:
    const EdgeInsets.fromLTRB(
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
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding:
    const EdgeInsets
        .fromLTRB(
    230,
    0,
    0,
    0),
    child:
    InkWell(
    child:
    Container(
    child: Image
        .asset(
    'assets/images/icons/close.png',
    height:
    20,
    width:
    20,
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
    padding: EdgeInsets
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
    )),
    ),
    Row(
    children: [
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
    20,
    0,
    50,
    0),
    child:
    TextButton(
    child:
    const Text(
    'CANCEL',
    style: TextStyle(
    fontSize: 20,
    height: 2,
    color: Colors.blue),
    ),
    onPressed:
    () {
    Navigator.of(context)
        .pop();
    },
    ),
    ),
    Padding(
    padding:
    const EdgeInsets.fromLTRB(
    0,
    0,
    0,
    0),
    child:
    TextButton(
    child:
    const Text(
    'YES',
    style: TextStyle(
    fontSize: 20,
    height: 2,
    color: Colors.red),
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
    ),
    );
    },
    ),
    ),
    const Text('___________________'),
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
    child: InkWell(
    child: Container(
    child: Image.asset(
    'assets/images/icons/share.png',
    height: 18,
    width: 18,
    ),
    ),
    onTap: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(
    220, 0, 0, 0),
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
    padding: const EdgeInsets.fromLTRB(
    0, 30, 0, 0),
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
    fontSize: 20,
    )),
    ],
    ),
    ),
    const Text(
    'Venture.link.lat23.45.67.long89.12.34',
    style: TextStyle(
    fontSize: 15, height: 2)),
    const Text(
    '__________________________________',
    style: TextStyle(height: -.2),
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
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
    child: InkWell(
    child: Container(
    child: Image.asset(
    'assets/images/icons/delete.png',
    height: 18,
    width: 18,
    ),
    ),
    onTap: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: SizedBox(
    height: 200,
    width: 250,
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(
    230, 0, 0, 0),
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
    )),
    ),
    Row(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(
    20, 0, 50, 0),
    child: TextButton(
    child: const Text(
    'CANCEL',
    style: TextStyle(
    fontSize: 20,
    height: 2,
    color: Colors.blue),
    ),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(
    0, 0, 0, 0),
    child: TextButton(
    child: const Text(
    'YES',
    style: TextStyle(
    fontSize: 20,
    height: 2,
    color: Colors.red),
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
    ),
    ],
    ),
    ),
    )
  );
}
}