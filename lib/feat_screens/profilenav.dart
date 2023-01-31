import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/auth_screen.dart';
import 'package:main_venture/feat_screens/pinnedlocation_new.dart';

import '../userInfo.dart';
import 'settings.dart';

//THIS IS THE DIALOG OF PROFILE

@override

void initState(){
  AuthFunction().getfirstname();

}

class ProfileNav {


  Future<void> showProfileNav(BuildContext context) async {
      initState();
    return await showDialog(
        context: context,
        builder: (context) {
          //bool isChecked = false;
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
              Container(
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
                        icon: FirebaseAuth.instance.currentUser!.photoURL ==
                                null
                            ? const Image(
                                image: AssetImage('assets/images/pic.png'),
                                height: 50.0,
                                width: 50.0)
                            : Image.network(
                                FirebaseAuth.instance.currentUser!.photoURL ??
                                    "",
                                height: 50.0,
                                width: 50.0,
                              ),
                        label: Text(
                           userinfo().fname ??
                                "Default Name",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 30.0)),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextButton.icon(
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
                      ),
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
                      TextButton.icon(
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage("assets/images/icons/upgrade.png"),
                          size: 25.0,
                        ),
                        label: const Text('Upgrade Account',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage("assets/images/icons/switch.png"),
                          size: 25.0,
                        ),
                        label: const Text('Switch Account',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          await singingOut().then((value) =>
                              Navigator.of(context, rootNavigator: true)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) =>
                                          const AuthScreen())));
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

Future<void> singingOut() async {
  return await AuthFunction().logOut();
}
