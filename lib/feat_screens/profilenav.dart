import 'package:flutter/material.dart';
import 'package:main_venture/feat_screens/contactus.dart';
//import 'package:main_venture/feat_screens/pinnedlocationshistory.dart';
import 'package:main_venture/feat_screens/termscondi.dart';
import 'package:main_venture/feat_screens/pinnedlocation_new.dart';
import 'package:main_venture/feat_screens/upgrade_account.dart';

import '../userInfo.dart';
import 'ChangePassword.dart';
import 'about_us.dart';
import 'customize_acc.dart';
import 'history.dart';
import 'how_to_use_app.dart';
import 'settings.dart';
import 'listhistorycard.dart';

//THIS IS THE DIALOG OF PROFILE

class ProfileNav {
  final String firstname,
      lastname; // init firstname lastname string for class parameters

  ProfileNav(
      {required this.firstname,
        required this.lastname}); //get the firstname lastname in the homepage.dart

  // late final fname = firstname.length > 1;

  Future<void> showProfileNav(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          //  initState(); //bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                content: Form(
                    child: SingleChildScrollView(
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          const SizedBox(
                            height: 5.0,
                          ),
                          // const Align(
                          // alignment: Alignment.topRight,
                          //child: Icon(Icons.close)),
                          const SizedBox(
                            height: 5.0,
                          ),
                          /*     const Align(
                  alignment: Alignment.topRight, child: Icon(Icons.close),
                  ), */
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: TextButtonTheme(
                              data: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Profile().profile == null
                                        ? const Image(
                                        image: AssetImage('assets/images/pic.png'),
                                        height: 50.0,
                                        width: 50.0)
                                        : Image.network(
                                      Profile().profile ?? "",
                                      height: 50.0,
                                      width: 50.0,
                                    ),
                                    label: Text(
                                      //  fname = firstname.length > 1? firstname![1];
                                        "$firstname $lastname",
                                        // "${firstname[0].toUpperCase() + firstname.substring(1).toLowerCase()} ${lastname[0].toUpperCase() + lastname.substring(1).toLowerCase()}", //display firstname and lastname from the firestore
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 22.0)),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Text("\t\tACCOUNT",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Questrial',
                                          height: 1.5)),

                                  //EDIT PERSONAL INFORMATION
                                  TextButton.icon(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CustomizeAccScreen(
                                              firstname: firstname,
                                              lastname: lastname,
                                            )),
                                      );
                                    },
                                    icon: const ImageIcon(
                                      AssetImage("assets/images/icons/editProfileIcon.png"),
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    label: const Text('Edit Personal Information',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 15.0)),
                                  ),

                                  // Change Password
                                  TextButton.icon(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const ChangePasswordScreen(
                                              //  password: password,
                                              // confirmpassword: confirmpassword,
                                            )),
                                      );
                                    },
                                    icon: const ImageIcon(
                                      AssetImage("assets/images/icons/ChangePasssIcon.png"),
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    label: const Text('Change Password',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 15.0)),
                                  ),
                                  Row(children: <Widget>[
                                    Expanded(
                                      child: Divider(
                                          color: Color.fromARGB(255, 105, 105, 105),
                                          endIndent: 2),
                                    ),
                                  ]),
                                  // PINNED LOCATIONS HISTORY
                                  TextButton.icon(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const ListViewHomeLayout()),
                                      );
                                    },
                                    icon: const ImageIcon(
                                      AssetImage("assets/images/icons/historyIcon.png"),
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    label: const Text('Pinned Locations History',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 15.0)),
                                  ),
                                  // REQUEST FOR PINNING OF LOCATION
                                  TextButton.icon(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const UpgradeAccScreen()),
                                      );
                                    },
                                    icon: const ImageIcon(
                                      AssetImage(
                                          "assets/images/icons/requestForPinningLocationIcon.png"),
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    label: const Text('Request for Pinning of Location',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 15.0)),
                                  ),
                                  //HOW TO USE THE APP
                                  TextButton.icon(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const ManualScreen()),
                                      );
                                    },
                                    icon: const ImageIcon(
                                      AssetImage(
                                          "assets/images/icons/HowToUseTheAppIcon.png"),
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    label: const Text('How to use the App',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 15.0)),
                                  ),

                                  //LOG OUT
                                  TextButton.icon(
                                    onPressed: () async {
                                      singingOut(context);
                                    },
                                    icon: const ImageIcon(
                                      AssetImage("assets/images/icons/logout.png"),
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    label: const Text('Log out',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 15.0)),
                                  ),
                                  Row(children: <Widget>[
                                    Expanded(
                                      child: Divider(
                                          color: Color.fromARGB(255, 105, 105, 105),
                                          endIndent: 2),
                                    ),
                                  ]),
                                  const Text("\t\tABOUT AND TERMS",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Questrial',
                                          height: 1.5)),

                                  //ABOUT
                                  TextButton.icon(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const AboutUsScreen()),
                                      );
                                    },
                                    icon: const ImageIcon(
                                      AssetImage("assets/images/icons/aboutIcon.png"),
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    label: const Text('About',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 15.0)),
                                  ),

                                  //CONTACT US
                                  TextButton.icon(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const contactus()),
                                      );
                                    },
                                    icon: const ImageIcon(
                                      AssetImage("assets/images/icons/contactUsIcon.png"),
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    label: const Text('Contact Us',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 15.0)),
                                  ),

                                  //TERMS OF SERVICE
                                  TextButton.icon(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const TermsCondiScreen()),
                                      );
                                    },
                                    icon: const ImageIcon(
                                      AssetImage(
                                          "assets/images/icons/termsOfServiceIcon.png"),
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    label: const Text('Terms of Service',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 15.0)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]))));
          });
        });
  }
}

Future<void> singingOut(context) async {
  PopSnackbar popSnackbar = PopSnackbar();

  return await popSnackbar.showLogoutDialog(context);
}
