import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/auth_screen.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';



//final userphoto = FirebaseAuth.instance.currentUser!.photoURL??"";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();


}

Future<void> logOut() async {
  try {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print("error in sign in $e");
  }
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //FirebaseAuth.instance.currentUser!.photoURL == null ? const Text("No Image") : Image.network(FirebaseAuth.instance.currentUser!.photoURL??""),
            FirebaseAuth.instance.currentUser!.photoURL == null ? const Image(image: AssetImage('assets/images/pic.png')) : Image.network(FirebaseAuth.instance.currentUser!.photoURL??""),
            Text(
              FirebaseAuth.instance.currentUser!.displayName ?? "Default Name",
              style: const TextStyle(fontSize: 30,

            Image.network(FirebaseAuth.instance.currentUser!.photoURL ?? ""),
            SizedBox(
              height: 20,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.displayName ?? "",
              style: const TextStyle(
                  fontSize: 30,

                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: logOut, child: Text("Logout Account")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Map")),
          ],
        ),
      ),
    );
  }




}
