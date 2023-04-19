// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:main_venture/auth_screens/login.dart';
import 'package:flutter/services.dart';

import '../userInfo.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

final CollectionReference _users =
    FirebaseFirestore.instance.collection('users');

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final textFieldFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      } else {
        textFieldFocusNode.canRequestFocus = true;
      } // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Change Password'),
          foregroundColor: const Color.fromARGB(255, 44, 45, 48),
          elevation: 0.0,
          leading: const BackButton(
            color: Color.fromARGB(255, 44, 45, 48),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        "New Password",
                        style: TextStyle(
                          fontSize: 16,
                        ),

                        textAlign: TextAlign.left, // has impact
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    TextField(
                      controller: _passwordController,
                      enableInteractiveSelection: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(
                            '[a-zA-Z0-9á-úÁ-Ú_.!@#%^&*()/{}:;' '""<>-]')),
                      ],
                      obscureText: _obscured,
                      decoration: InputDecoration(
                        hintText: '************',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        fillColor: const Color.fromARGB(255, 230, 230, 230),
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: InkWell(
                          onTap: _toggleObscured,
                          child: Icon(
                              _obscured
                                  ? Icons.visibility
                                  : Icons.visibility_off_rounded,
                              color: const Color.fromARGB(255, 74, 74, 74)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: const Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontSize: 16,
                        ),

                        textAlign: TextAlign.left, // has impact
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    TextField(
                      obscureText: true,
                      controller: _confirmPasswordController,
                      enableInteractiveSelection: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(
                            '[a-zA-Z0-9á-úÁ-Ú_.!@#%^&*()/{}:;' '""<>-]')),
                      ],
                      decoration: const InputDecoration(
                        hintText: '************',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        fillColor: Color.fromARGB(255, 230, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RawMaterialButton(
                              padding: const EdgeInsets.all(13.0),
                              fillColor: const Color.fromARGB(255, 0, 110, 195),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              onPressed: () async {
                                updatePassword();
                              },
                              child: const Text(
                                'Save Changes',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ]),
            )));
  }

//changepass
  Future updatePassword() async {
    User? user = FirebaseAuth.instance.currentUser;
    PopSnackbar popSnackbar = PopSnackbar();

    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;
    if (password.isNotEmpty && confirmPassword.isNotEmpty) {
      if (user != null) {
        if (confirmPassword == password) {
          _changePassword(
              user, password, confirmPassword, context, popSnackbar);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(popSnackbar
              .popsnackbar("Password and Confirm Password did not match"));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(popSnackbar.popsnackbar("User is null"));
      }
    } else {
      popSnackbar.showErrorDialog(_confirmPasswordController,
          _passwordController, context, "Please fill out all the fields");
    }
  } //close change pass
} //class close

void _changePassword(User user, String password, String confirmPassword,
    context, PopSnackbar popSnackbar) async {
  user.updatePassword(password).then((_) {
    PopSnackbar popSnackbar = PopSnackbar();

    _users.doc(GoogleUserStaticInfo().uid).update({
      "password": password,
    });

    ScaffoldMessenger.of(context).showSnackBar(
        popSnackbar.popsnackbar("Successfully updated your Password"));

    Future.delayed(const Duration(seconds: 1)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage())));
  }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(
        popSnackbar.popsnackbar("Password cant be changed due to $error"));
  });
}
