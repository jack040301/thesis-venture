// import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'auth_screen.dart';

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _collection = _firestore.collection('users');

class GoogleUserStaticInfo {
  final name = FirebaseAuth.instance.currentUser!.displayName;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  // final names = FirebaseAuth.instance.currentUser!.displayName.split(' ');
  //  f(String? name){
  //   if(name != null && name.length > 1){
  //       final Name = FirebaseAuth.instance.currentUser?.displayName.split(' ');
  //     late final lastname = Name?[0];
  //     late final firstname = Name?.length;
  //     }
  // }
  final names = FirebaseAuth.instance.currentUser!.displayName?.split(' ');
  late final lastname = names![0];
  late final firstname = names!.length > 1 ? names![1] : '';
}

class Profile {
  final profile = FirebaseAuth.instance.currentUser!.photoURL;
} //end class

class FunctionAuthentication with GoogleUserStaticInfo {
  Future logOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      //  print('Signout initiated');
    } catch (e) {
      //print("error in sign in $e");
    }
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          //    print('User has Signed out');
        } else {
          //  print('User is logged in');
        }
      });
    } on FirebaseAuthException catch (e) {
      //  print('Logout pressed: ${e.message}');
    }
  }
}

//Popsnackbar Information

class PopSnackbar extends FunctionAuthentication {
  SnackBar popsnackbar(String contentpop) {
    var popContent = SnackBar(
      content: Text(contentpop),
    );

    return popContent;
  }

  Future<void> showErrorDialog(TextEditingController controller1,
      TextEditingController controller2, context, errormessage) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: SingleChildScrollView(
            child: Text(errormessage.toString()),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
                controller1.clear();
                controller2.clear();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showLogoutDialog(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const SingleChildScrollView(
            child: Text("Are you sure you want to logout?"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () async {
                await logOut().then((value) =>
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const AuthScreen())));
              },
            ),
          ],
        );
      },
    );
  }
}

class Functio {
  Future signInWithGoogle() async {
    //trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    //obtain the auth details from the internet
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create a new credential
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // await users.doc(uid).set({
    //   'firstname': 'Firstname',
    //   'lastname': 'Lastname',
    //   'email': 'Email',
    // }).onError((error, stackTrace) => Println(error.toString()));

    // final FirebaseFirestore  user =
    //     (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    //once signed in, return the user credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class DialogShowBusiness {
  List? datalist;
  Future getBusiness() async {
    await FirebaseFirestore.instance
        .collection("business")
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((documents) async {
                //var data = documents.data() as Map;
                var data = documents.data() as Map;

                datalist = [DropdownData(nameofbusiness: data['name'],
            )];
              })
            });
  }
}

class DropdownData {
  final String nameofbusiness;


  DropdownData({required this.nameofbusiness});
}

class DropdownDataAssumption {
  final String budgetassump;


  DropdownDataAssumption({required this.budgetassump});
}