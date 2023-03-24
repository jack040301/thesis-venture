import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../userInfo.dart';

class contactus extends StatefulWidget {
  const contactus({super.key});

  @override
  State<contactus> createState() => _contactusState();
}

class _contactusState extends State<contactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Contact Us'),
        foregroundColor: const Color.fromARGB(255, 44, 45, 48),
        elevation: 0.0,
        leading: const BackButton(
          color: Color.fromARGB(255, 44, 45, 48),
        ),
      ),
      body: const WidgetUpgradeAccount(),
    );
  }
}

class WidgetUpgradeAccount extends StatelessWidget {
  const WidgetUpgradeAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(23, 20, 30, 7),
                child: Row(
                  children: const <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text('\n\nYou have Questions? Contact our Team!\n',
                          style: TextStyle(
                              color: Color.fromARGB(255, 44, 45, 48),
                              fontSize: 16.0)),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                child: const Center(
                  child: Text(
                      "Hexagon is lorem ipsum dolor sit ametghgh upgrading your account allows you to add your commercial space to be rented and be available on map. It can be seen by the other users of the application. Tap the link provided below to submit your request for upgrading your account.\nNote: Approval of requests may take up to 24hrs to approve.\n\nUpgrading your account allows you to add your commercial space to be rented and be available on map. It can be seen by the other users of the application. Tap the link provided below to submit your request for upgrading your account. \nNote: Approval of requests may take up to 24hrs to approve.\n\n",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color.fromARGB(255, 44, 45, 48),
                          fontSize: 17.0)),
                ),
              ),
              GestureDetector(
                child: Material(
                  color: const Color.fromARGB(255, 0, 110, 195),
                  borderRadius: BorderRadius.circular(5.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  Ink.image(
                      //  image: const AssetImage(
                      //  'assets/images/icons/contactUsIcon.png'),
                      // height: 40,
                      //  width: 30),
                      const SizedBox(width: 10.0, height: 50),
                      const Text('Send us an email',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                child: const Center(
                  child: Text("\n\n\n\nConnect with us",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color.fromARGB(255, 44, 45, 48),
                          fontSize: 17.0)),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(135, 20, 30, 7),
                child: Row(
                  children: const <Widget>[
                    ImageIcon(
                      AssetImage(
                          "assets/images/icons/upgrade.png"), //FACEBOOK ICON
                      color: Color.fromARGB(255, 44, 45, 48),
                      size: 25,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    ImageIcon(
                      AssetImage(
                          "assets/images/icons/upgrade.png"), //TWITTER ICON
                      color: Color.fromARGB(255, 44, 45, 48),
                      size: 25,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    ImageIcon(
                      AssetImage("assets/images/icons/upgrade.png"), //IG ICON
                      color: Color.fromARGB(255, 44, 45, 48),
                      size: 25,
                    ),

                    // Container(
                    //   color: Colors.white,
                    //   padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    // ),
                  ],
                ),
              )
            ])));
  }
}
