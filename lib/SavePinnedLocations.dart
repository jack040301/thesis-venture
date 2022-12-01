/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/feat_screens/profile_screen.dart';

class DialogVenture extends StatefulWidget {
  const DialogVenture({Key? key}) : super(key: key);

  @override
  _DialogVentureState createState() => _DialogVentureState();

  static void showInformationDialog(BuildContext context) {}
}

class _DialogVentureState extends State<DialogVenture> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  var preferBusinessController = TextEditingController();
  final areaBudgetController = TextEditingController();
  final areaController = TextEditingController();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
        
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.close),
                      ),
                      const SizedBox(
                        height: 20.0,
                      );



                      //@override
                      //Widget build(BuildContext context) {
                      // TODO: implement build
                      //throw UnimplementedError();
                      //}
                      // }
                      @override
    Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
    padding: const EdgeInsets.all(30.0),
    child: SingleChildScrollView(
    child: Center(
    child: ElevatedButton(
    onPressed: () async {
    await showInformationDialog(context);
    },
    child: const Text(
    "Click Me",
    style: TextStyle(color: Colors.white, fontSize: 16),
}*/
