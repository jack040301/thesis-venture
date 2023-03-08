import 'package:flutter/material.dart';

import 'package:main_venture/feat_screens/pinnedlocation_new.dart';
import 'package:main_venture/feat_screens/upgrade_account.dart';

import '../userInfo.dart';
import 'customize_acc.dart';
import 'settings.dart';

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
                            "${firstname[0].toUpperCase() + firstname.substring(1).toLowerCase()} ${lastname[0].toUpperCase() + lastname.substring(1).toLowerCase()}", //display firstname and lastname from the firestore
                            style: const TextStyle(
                                color: Colors.black, fontSize: 22.0)),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      /*TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PinnedLocationScreen()));
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/images/icons/savedpin.png"),
                          size: 25.0,
                        ),
                        label: const Text('Pinned Locations',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),*/

                      TextButton.icon(
                        onPressed: () {
                          SetDialog().showMyDialog(context);
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/images/icons/settings.png"),
                          size: 25.0,
                        ),
                        label: const Text('Settings',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                      /*      TextButton(
                        child: Text(
                          'Customize Account',
                          style: TextStyle(
                              fontFamily: 'Questrial',
                              color: Colors.grey.shade900,
                              fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CustomizeAccScreen()));
                        },
                      ), */
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
                          AssetImage("assets/images/icons/team.png"),
                          size: 25.0,
                        ),
                        label: const Text('Customize Account',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpgradeAccScreen()),
                          );
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/images/icons/upgrade.png"),
                          size: 25.0,
                        ),
                        label: const Text('Upgrade Account',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          singingOut(context);
                          /*   await singingOut().then((value) =>
                              Navigator.of(context, rootNavigator: true)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) =>
                                          const AuthScreen()))); */
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/images/icons/logout.png"),
                          size: 25.0,
                        ),
                        label: const Text('Log out',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                    ],
                  ),
                ),
              )
            ])));
          });
        });
  }
}

Future<void> singingOut(context) async {
  PopSnackbar popSnackbar = PopSnackbar();

  return await popSnackbar.showLogoutDialog(context);
}
