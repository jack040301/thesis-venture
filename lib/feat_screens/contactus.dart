import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../userInfo.dart';

class contactus extends StatefulWidget {
  const contactus({super.key});

  @override
  State<contactus> createState() => _contactusState();
}

Future<void> goToWebPage(String urlString) async {
  final Uri _url = Uri.parse(urlString);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
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
                child: const Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text('\n\nYou have questions? Contact our team!\n',
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
                      "Hexagon is a team of young and dynamic individuals with a shared passion for innovation and technology. We work collaboratively to develop cutting-edge solutions that address real-world challenges. With our diverse skill sets and backgrounds, we pride ourselves on being able to deliver high-quality products that meet the unique needs of our clients. Our team is committed to excellence, creativity, and customer satisfaction, and we always strive to exceed expectations.\nNote: Approval of requests may take up to 24hrs to approve.\n\nUpgrading your account allows you to add your commercial space to be rented and be available on map. It can be seen by the other users of the application. Tap the link provided below to submit your request for upgrading your account. \nNote: Approval of requests may take up to 24hrs to approve.\n\n",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color.fromARGB(255, 44, 45, 48),
                          fontSize: 16.0)),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  String email = Uri.encodeComponent("ucc.venture@gmail.com");
                  String subject = Uri.encodeComponent("Question/s");
                  String body = Uri.encodeComponent("Hi Developers, \n");
                  print(subject); //output: Hello%20Flutter
                  Uri mail =
                      Uri.parse("mailto:$email?subject=$subject&body=$body");
                  if (await launchUrl(mail)) {
                    //email app opened
                  } else {
                    //email app is not opened
                  }
                },
                //  color: Colors.white,
                // padding: const EdgeInsets.fromLTRB(35, 2, 35, 250),
                child: Material(
                  color: const Color.fromARGB(255, 0, 110, 195),
                  borderRadius: BorderRadius.circular(5.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  Ink.image(
                      //  image: const AssetImage(
                      //  'assets/images/icons/contactUsIcon.png'),
                      // height: 40,
                      //  width: 30),
                      SizedBox(width: 10.0, height: 50),
                      Text('Send us an email',
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
                padding: const EdgeInsets.fromLTRB(35, 20, 30, 7),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          await goToWebPage(
                              "https://www.facebook.com/profile.php?id=100090538134749");
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/images/icons/Facebook.png"),
                          color: Color.fromARGB(255, 44, 45, 48),
                          size: 25,
                        )),
                    const SizedBox(
                      width: 20.0,
                    ),
                    IconButton(
                        onPressed: () async {
                          await goToWebPage("https://twitter.com/ventureapp5");
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/images/icons/Twitter.png"),
                          color: Color.fromARGB(255, 44, 45, 48),
                          size: 25,
                        )),
                    const SizedBox(
                      width: 20.0,
                    ),
                    IconButton(
                        onPressed: () async {
                          await goToWebPage(
                              "https://www.instagram.com/ventureapp5/");
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/images/icons/Instagram.png"),
                          color: Color.fromARGB(255, 44, 45, 48),
                          size: 25,
                        )),
                  ],
                ),
              )
            ])));
  }
}
