import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/auth_screen.dart';
import 'package:main_venture/screens/home_page.dart';


class UpgradeAccScreen extends StatefulWidget {
  const UpgradeAccScreen({super.key});

  @override
  State<UpgradeAccScreen> createState() => _UpgradeAccScreenState();
}

class _UpgradeAccScreenState extends State<UpgradeAccScreen> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Upgrade Account'),
        foregroundColor: Color.fromARGB(255, 44, 45, 48),
        elevation: 0.0,
        leading: BackButton(
          color: Color.fromARGB(255, 44, 45, 48),
        ),),
      body: Padding(
          padding: EdgeInsets.all(10.0),

          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(
                  height: 10.0,
                ),

                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(35, 20, 35, 7),
                  child: Row(
                    children: <Widget>[
                      ImageIcon(
                        AssetImage("assets/images/icons/upgrade.png"),
                        color: Color.fromARGB(255, 44, 45, 48),
                        size: 20,
                      ),

                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('Upgrade your account as space owners', style: TextStyle(color: Color.fromARGB(255, 44, 45, 48), fontSize: 16.0)),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                  child: Center(
                    child: Text(
                        "Upgrading your account requires lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
                        style: TextStyle(color: Color.fromARGB(255, 44, 45, 48), fontSize: 16.0)), // <-- Text
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(35, 12, 35, 7),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text('Upload your files', style: TextStyle(color: Color.fromARGB(255, 44, 45, 48), fontSize: 16.0),
                          )
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 350,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.fromLTRB(35, 2, 35, 40),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        foregroundColor: Color.fromARGB(255, 55, 62, 78),
                        backgroundColor: Color.fromARGB(255, 241, 242, 242),
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        textStyle: TextStyle(
                            fontSize: 15, color: Colors.black, fontFamily: 'Questrial')),
                    onPressed: () {},
                    icon: Icon( // <-- Icon
                        Icons.file_upload_outlined,
                        size: 15.0),
                    label: Text('Choose File', style: TextStyle(
                        color: Color.fromARGB(255, 55, 62, 78)
                    )), // <-- Text
                  ),
                ),

                Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.fromLTRB(35, 2, 35, 50),

                  child: RawMaterialButton(
                    fillColor: const Color.fromARGB(255, 0, 110, 195),

                    onPressed: () {
                      showAlertDialog(context);
                    },
                    elevation: 0.0,
                    padding: const EdgeInsets.fromLTRB(27, 10, 27, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text("Request to upgrade my account",
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(10.0)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
            alignment: Alignment.topRight,
            child: Icon(
                Icons.close)),

        const SizedBox(
          height: 30.0,
        ),
        Container(
          child: Text(
            "Your request has been sent to the administrator!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
    actions: [

      Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(35, 2, 35, 15),

        child: RawMaterialButton(
          fillColor: const Color.fromARGB(255, 0, 110, 195),

          onPressed: () {},
          elevation: 0.0,
          padding: const EdgeInsets.fromLTRB(27, 10, 27, 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
          child: Text("Okay",
              style: TextStyle(color: Colors.white, fontSize: 15.0)),
        ),
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
