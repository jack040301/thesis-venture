import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomizeAccScreen extends StatefulWidget {
  const CustomizeAccScreen({super.key});

  @override
  State<CustomizeAccScreen> createState() => _CustomizeAccScreenState();
}

class _CustomizeAccScreenState extends State<CustomizeAccScreen> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    inputData();
  }

  void inputData() {
    final User? user = auth.currentUser;

    final uid = user!.uid;
    _firstnameController.text = user.displayName!;
    _emailController.text = user.email!;

    // here you write the codes to input the data into firestore
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Customize Your Account'),
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
                width: 350,
                child: const Text(
                  "First Name",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                controller: _firstnameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350,
                child: const Text(
                  "Last Name",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350,
                child: const Text(
                  "Email Address",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                controller: _emailController,
                enabled: false,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350,
                child: const Text(
                  "Password",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: '************',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350,
                child: const Text(
                  "Confirm Password",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),

                  textAlign: TextAlign.left, // has impact
                ),
              ),
              TextField(
                obscureText: true,
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: '************',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 480,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(height: 1.5, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
