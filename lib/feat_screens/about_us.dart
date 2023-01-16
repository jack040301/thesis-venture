import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('About Us'),
          foregroundColor: const Color.fromARGB(255, 44, 45, 48),
          elevation: 0.0,
          leading: const BackButton(
            color: Color.fromARGB(255, 44, 45, 48),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(5, 0, 0, 20),
                                    child: Row(
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                              "assets/images/icons/venture.png"),
                                          color: Colors.black,
                                          size: 23,
                                        ),
                                        Text(
                                          ' About the Application',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Questrial',
                                              color: Colors.grey.shade900,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Is a Web-based Application that gives the users idea of the area he/she wants to rent, and enables them to customize the room based on the area and the layout of the space by the help of the Google API that gives the user a static view of the establishment and adding an option of Augmented reality in some selected establishment.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      height: 1.5,
                                      color: Colors.grey.shade700,
                                      fontFamily: 'Questrial',
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(5, 0, 0, 20),
                                    child: Row(
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                              "assets/images/icons/team.png"),
                                          color: Colors.black,
                                          size: 23,
                                        ),
                                        Text(
                                          ' About the Team',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Questrial',
                                              color: Colors.grey.shade900,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'We are team Hexagon, and we would love you to meet our team. Our team consists of 14 brilliant computer science students from the University of Caloocan City',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      height: 1.5,
                                      color: Colors.grey.shade700,
                                      fontFamily: 'Questrial',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
  }
}
