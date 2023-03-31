import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../userInfo.dart';

class UpgradeAccScreen extends StatefulWidget {
  const UpgradeAccScreen({super.key});

  @override
  State<UpgradeAccScreen> createState() => _UpgradeAccScreenState();
}

class _UpgradeAccScreenState extends State<UpgradeAccScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Request for Pinning of Location'),
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
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 7),
                child: Row(
                  children: const <Widget>[
                    ImageIcon(
                      AssetImage("assets/images/icons/upgrade.png"),
                      color: Color.fromARGB(255, 44, 45, 48),
                      size: 20,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text('Sending Request for pinning of location',
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
                      "Sending a request to the Venture admin requires the user to pin a location on the map and proceed requesting. It will automatically be approved considering the restrictions of the map. \n\n",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color.fromARGB(255, 44, 45, 48),
                          fontSize: 17.0)), // <-- Text
                ),
              ),
              // Container(
              //   color: Colors.white,
              //   padding: const EdgeInsets.fromLTRB(30, 13, 30, 5),
              //   child: Row(
              //     children: const <Widget>[
              //       Image(
              //           image: AssetImage('assets/images/gmail.png'),
              //           height: 15,
              //           width: 23),
              //       SizedBox(
              //         width: 7.0,
              //       ),
              //       Expanded(
              //         child: Text('Email us at:',
              //             style: TextStyle(
              //                 color: Color.fromARGB(255, 44, 45, 48),
              //                 fontSize: 17.0)),
              //       )
              //     ],
              //   ),
              // ),
              GestureDetector(
                // onTap: () async {
                //   String email = Uri.encodeComponent("ucc.venture@gmail.com");
                //   String subject = Uri.encodeComponent("Hello Flutter");
                //   String body =
                //   Uri.encodeComponent("Hi! I'm Flutter Developer");
                //   print(subject); //output: Hello%20Flutter
                //   Uri mail =
                //   Uri.parse("mailto:$email?subject=$subject&body=$body");
                //   if (await launchUrl(mail)) {
                //     //email app opened
                //   } else {
                //     //email app is not opened
                //   }
                // },
                // color: Colors.white,
                // padding: const EdgeInsets.fromLTRB(35, 2, 35, 250),

                child: RawMaterialButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  fillColor: const Color.fromARGB(255, 0, 110, 195),
                  // icon: Icon(Icons.code),
                  //color: Colors.green,
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                              content: Text(
                                "Tap anywhere on the map where you want to request a location to be pinned and then tap again the Building icon"
                               ))
                          );
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()),
                    );
                    // new Image.asset("assets/imgaes/icons/gmail.png");
                    //new Tab(icon: new Icon(Icons.arrow_forward),
                    // icon: Icon(Icons.email, size: 18);
                    // String email = Uri.encodeComponent("ucc.venture@gmail.com");
                    // String subject =
                    //     Uri.encodeComponent("Request  for Pinning Location");
                    // String body = Uri.encodeComponent(
                    //     "(Fill out the necessary information below that will be used for pinning of location request, and wait for at least 72 hours for the response of the admin. The pinned location will then be reflected on the application. All information provided will be kept confidential.) \n\n Location:\n\nGeopoint\nLatitude   :\nLongitude: \n\nPopulation past: \n\nPopulation Present: \n\nLand value: \n\nLand size ( km² ): \n\nRevenue (The total earnings of the are/barangay you are at):");
                    // print(subject); //output: Hello%20Flutter
                    // Uri mail =
                    //     Uri.parse("mailto:$email?subject=$subject&body=$body");
                    // if (await launchUrl(mail)) {
                    //   //email app opened
                    // } else {
                    //   //email app is not opened
                    // }
                  },

                  child: const Center(
                    child: Text("Pin Location",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20.0,
                        )), // <-- Text
                  ),
                ),
                // Container(
                //   color: Colors.white,
                //   padding: const EdgeInsets.fromLTRB(35, 2, 35, 250),
                //   child: const Center(
                //     child: Text("ucc.venture@gmail.com",
                //         style: TextStyle(
                //             decoration: TextDecoration.underline,
                //             color: Color.fromARGB(255, 44, 45, 48),
                //             fontSize: 17.0)), // <-- Text
                //   ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
              ),
            ],
          ),
        ));
  }
}

// showAlertDialog(BuildContext context) {
//   // Create button
//   Widget okButton = TextButton(
//     child: const Text("OK"),
//     onPressed: () {
//       Navigator.of(context).pop();
//     },
//   );

//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: const <Widget>[
//         Align(alignment: Alignment.topRight, child: Icon(Icons.close)),
//         SizedBox(
//           height: 30.0,
//         ),
//         Text(
//           "Your request has been sent to the administrator!",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//     actions: [
//       Container(
//         width: 350,
//         height: 60,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//         ),
//         padding: const EdgeInsets.fromLTRB(35, 2, 35, 15),
//         child: RawMaterialButton(
//           fillColor: const Color.fromARGB(255, 0, 110, 195),
//           onPressed: () {},
//           elevation: 0.0,
//           padding: const EdgeInsets.fromLTRB(27, 10, 27, 10),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//           child: const Text("Okay",
//               style: TextStyle(color: Colors.white, fontSize: 15.0)),
//         ),
//       ),
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
// showAlertDialog(BuildContext context) {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Open Mailer"),
//           backgroundColor: Colors.redAccent,
//         ),
//         body: Container(
//             padding: EdgeInsets.only(top: 20, left: 20, right: 20),
//             alignment: Alignment.topCenter,
//             child: Column(
//               children: [
//                 ElevatedButton(
//                     onPressed: () async {
//                       String emailFrom = Uri.encodeComponent(
//                           GoogleUserStaticInfo().email.toString());
//                       String email =
//                       Uri.encodeComponent("ucc.venture@gmail.com");
//                       String subject = Uri.encodeComponent("Hello Flutter");
//                       String body =
//                       Uri.encodeComponent("Hi! I'm Flutter Developer");
//                       print(subject); //output: Hello%20Flutter
//                       Uri mail = Uri.parse(
//                           "mailto:$email?subject=$subject&body=$body");
//                       if (await launchUrl(mail)) {
//                         //email app opened
//                       } else {
//                         //email app is not opened
//                         print('Could not launch $mail');
//                       }
//                     },
//                     child: Text("Mail Us Now"))
//               ],
//             )));
//   }
// }