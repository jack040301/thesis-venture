import 'package:flutter/material.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';

class LayerSimulationScreen extends StatefulWidget {
  const LayerSimulationScreen({super.key});

  @override
  State<LayerSimulationScreen> createState() => _LayerSimulationScreenState();
}

class _LayerSimulationScreenState extends State<LayerSimulationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Simulate Your Business'),
        foregroundColor: const Color.fromARGB(255, 44, 45, 48),
        elevation: 0.0,
        leading: const BackButton(
          color: Color.fromARGB(255, 44, 45, 48),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(50, 25, 50, 0),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 173, 172, 172),
                        ),
                        hintText: "MY BUSINESS"),
                  ),
                ),
                const SizedBox(
                  height: 350.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.fromLTRB(250, 0, 15, 0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.upgrade,
                    ),
                    iconSize: 20,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                  width: 300.0,
                  child: RawMaterialButton(
                    fillColor: const Color.fromARGB(255, 0, 110, 195),
                    onPressed: () {},
                    elevation: 0.0,
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: const Text("Save Changes",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14.0)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
