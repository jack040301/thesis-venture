import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/auth_screen.dart';

import 'package:main_venture/screens/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main.dart';

//final userphoto = FirebaseAuth.instance.currentUser!.photoURL??"";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

Future logOut() async {
  try {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    print('Signout initiated');
  } catch (e) {
    print("error in sign in $e");
  }
  try {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User has Signed out');
      } else {
        print('User is logged in');
      }
    });
  } on FirebaseAuthException catch (e) {
    print('Logout pressed: ${e.message}');
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> singingOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  // List<ListItem> _dropdownItems = [
  //   ListItem(1, "GeeksforGeeks"),
  //   ListItem(2, "Javatpoint"),
  //   ListItem(3, "tutorialandexample"),
  //   ListItem(4, "guru99")
  // ];
  //
  // List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  // ListItem _itemSelected;
  //
  // void initState() {
  //   super.initState();
  //   _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
  //   _itemSelected = _dropdownMenuItems[1].value;
  // }
  //
  // List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
  //   List<DropdownMenuItem<ListItem>> items = List();
  //   for (ListItem listItem in listItems) {
  //     items.add(
  //       DropdownMenuItem(
  //         child: Text(listItem.name),
  //         value: listItem,
  //       ),
  //     );
  //   }
  //   return items;
  // }

  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              child: Column(
                children: [
                  const Text('What kind of business do you prefer?'),
                  // DropdownButtonHideUnderline(
                  //   child: DropdownButton(
                  //       // value: _itemSelected,
                  //       // items: _dropdownMenuItems,
                  //       // onChanged: (value) {
                  //       //   setState(() {
                  //       //     _itemSelected = value;
                  //       //   });
                  //       // }),
                  // ),

                  TextField(
                    controller: customController,
                    decoration: const InputDecoration(
                        //labelText: 'What kind of business do you prefer?',
                        border: OutlineInputBorder(),
                        hintText: 'Choose your business'),
                  ),
                  const Text('Enter budget for the area (per square meter)'),
                  TextField(
                    controller: customController,
                    decoration: const InputDecoration(
                      //labelText: 'Enter budget for the area (per square meter)',
                      border: OutlineInputBorder(),
                      //hintText: 'Choose your business'),
                    ),
                  ),
                  const Text('Enter value of area (square meter)'),
                  TextField(
                    controller: customController,
                    decoration: const InputDecoration(
                      //labelText: 'Enter value of area (square meter)',
                      border: OutlineInputBorder(),
                      //hintText: 'Choose your business'),
                    ),
                  ),
                ],
              ),
            ),

            // title: Text(""),
            // content: TextField(
            //   controller: customController,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       hintText: 'Enter a search term',),
            //
            // ),

            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FirebaseAuth.instance.currentUser!.photoURL == null
                ? const Image(image: AssetImage('assets/images/pic.png'))
                : Image.network(
                    FirebaseAuth.instance.currentUser!.photoURL ?? ""),
            Text(
              FirebaseAuth.instance.currentUser!.displayName ?? "Default Name",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  await singingOut().then((value) =>
                      Navigator.of(context, rootNavigator: true)
                          .pushReplacement(MaterialPageRoute(
                              builder: (context) => const AuthScreen())));
                },
                child: const Text("Logout Account")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text("Map")),
          ],
        ),
      ),
    );
  }
}
