import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({Key? key}) : super(key: key);

  @override
  _ProfileNavigationState createState() => _ProfileNavigationState();
}

class _ProfileNavigationState extends State<ProfileNavigation> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController =
          TextEditingController();
          //bool isChecked = false;
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
                          // const Align(
                          // alignment: Alignment.topRight,
                          //child: Icon(Icons.close)),
                          SizedBox(
                            height: 5.0,
                          ),
                          const Align(
                              alignment: Alignment.topRight, child: Icon(Icons.close)),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: double.maxFinite,
                            child: TextButtonTheme(
                              data: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [


                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.account_circle_outlined,
                                      size: 50.0,),
                                    label: Text('Juan Dela Cruz',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 30.0)),),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.person_pin_circle_outlined,
                                      size: 30.0,),
                                    label: Text('      Pinned Locations',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20.0)),),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.settings,
                                      size: 30.0,),
                                    label: Text('      Settings',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20.0)),),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.upgrade,
                                      size: 30.0,),
                                    label: Text('      Upgrade Account',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20.0)),),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.switch_account,
                                      size: 30.0,),
                                    label: Text('      Switch Account',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20.0)),),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.logout,
                                      size: 30.0,),
                                    label: Text('      Log out',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20.0)),),
                                ],
                              ),
                            ),
                          )
                        ]
                    )));
          });
        });
  }

  @override
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

//END
                ),
              ),
            ),
          ),
        ));
  }
}