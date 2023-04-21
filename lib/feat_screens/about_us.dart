import 'package:flutter/material.dart';
import 'package:main_venture/global_objects/ui_class.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

var colorstext = Colors.grey.shade700;

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
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: ContentWidget(),
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(35, 20, 40, 7),
          child:  Row(
            children: <Widget>[
              ImageIcon(
                AssetImage("assets/images/icons/venture.png"),
                color: Color.fromARGB(255, 23, 23, 23),
                size: 23,
              ),
              SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Text('About the Application',
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 23, 23),
                        fontSize: 18.0)),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
          child: const Center(
            child: Text(
              'Is a Web-based Application that gives the users idea of the area he/she wants to rent, and enables them to customize the room based on the area and the layout of the space by the help of the Google API that gives the user a static view of the establishment and adding an option of Augmented reality in some selected establishment.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                height: 1.5,
                color: Color.fromARGB(255, 54, 54, 54),
                fontSize: 17,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(35, 20, 40, 7),
          child:  Row(
            children: <Widget>[
              ImageIcon(
                AssetImage("assets/images/icons/team.png"),
                color: Color.fromARGB(255, 23, 23, 23),
                size: 23,
              ),
              SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Text('About the Team',
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 23, 23),
                        fontSize: 18.0)),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(35, 2, 35, 70),
          child: const Text(
            'We are team Hexagon, and we would love you to meet our team. Our team consists of 14 brilliant computer science students from the University of Caloocan City',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Color.fromARGB(255, 54, 54, 54),
              height: 1.5,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
