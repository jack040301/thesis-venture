import 'package:flutter/material.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';

class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({super.key});

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            mini: true,
            child: const Icon(Icons.person),
            onPressed: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            mini: true,
            child: const Icon(Icons.house),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 630, 20, 0),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 30, 10),
                    prefixIcon: Icon(Icons.search,
                        color: Color.fromARGB(255, 102, 103, 105)),
                    hintText: "Search an area around Caloocan",
                    hintStyle: TextStyle(fontSize: 14.0),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
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
