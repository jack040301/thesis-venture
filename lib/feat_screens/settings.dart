import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text(
            'Settings',
            style: TextStyle(
                fontFamily: 'Questrial',
                color: Colors.grey.shade900,
                fontSize: 20),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Container(
                  padding: const EdgeInsets.all(28),
                  height: 400,
                  width: 500,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(''),
                            Text(
                              'Settings',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Questrial',
                                color: Colors.grey.shade900,
                                fontSize: 22,
                                height: -1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                              child: InkWell(
                                child: Image.asset(
                                  'assets/images/icons/close.png',
                                  height: 20,
                                  width: 20,
                                ),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          child: Text(
                            'Customize Account',
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                color: Colors.grey.shade900,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Container(
                                  padding: const EdgeInsets.all(28),
                                  height: 800,
                                  width: 500,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            IconButton(
                                              icon:
                                                  const Icon(Icons.arrow_back),
                                              color: Colors.grey.shade700,
                                              iconSize: 30,
                                              onPressed: () =>
                                                  Navigator.pop(context, false),
                                            ),
                                            Text(
                                              'Customize your Account',
                                              style: TextStyle(
                                                  fontFamily: 'Questrial',
                                                  color: Colors.grey.shade900,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Container(
                                        width: 350,
                                        child: const Text(
                                          "First Name",
                                          style: TextStyle(
                                            height: 1.5,
                                            fontSize: 18,
                                          ),

                                          textAlign:
                                              TextAlign.left, // has impact
                                        ),
                                      ),
                                      TextField(
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

                                          textAlign:
                                              TextAlign.left, // has impact
                                        ),
                                      ),
                                      TextField(
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

                                          textAlign:
                                              TextAlign.left, // has impact
                                        ),
                                      ),
                                      TextField(
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

                                          textAlign:
                                              TextAlign.left, // has impact
                                        ),
                                      ),
                                      TextField(
                                        obscureText: true,
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

                                          textAlign:
                                              TextAlign.left, // has impact
                                        ),
                                      ),
                                      TextField(
                                        obscureText: true,
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
                                            style: TextStyle(
                                                height: 1.5, fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      TextButton(
                          child: Text(
                            'How to use the App',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                color: Colors.grey.shade900,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Container(
                                  height: 780,
                                  width: 480,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 20),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_back),
                                                color: Colors.grey.shade700,
                                                iconSize: 30,
                                                onPressed: () => Navigator.pop(
                                                    context, false),
                                              ),
                                              Text(
                                                'How to use the app',
                                                style: TextStyle(
                                                    fontFamily: 'Questrial',
                                                    color: Colors.grey.shade900,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 0, 20),
                                          child: Row(
                                            children: [
                                              const ImageIcon(
                                                AssetImage(
                                                    "assets/images/icons/device.png"),
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                              Text(
                                                'How to use the app',
                                                style: TextStyle(
                                                    fontFamily: 'Questrial',
                                                    color: Colors.grey.shade900,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/device1.PNG',
                                          height: 180,
                                          width: 180,
                                        ),
                                        const Text(
                                          'Creating and Log-in Account',
                                          style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '1. On your Mobile phone or tablet, open the Venture application.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '2. If you dont have an Account, you can create your account by Signing-up Requirements or you can connect to your Google  to create an account.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '3. Now you have an account,proceed to log-in your account so you can go to the landing page.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/device2.PNG',
                                          height: 200,
                                          width: 200,
                                        ),
                                        const Text(
                                          'Search and Pin Location',
                                          style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '1. Now youre done claiming your daily rewards you can search and pin location on the map by tapping your preferred location to start a business.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '2. Once you select your preferred location for your business, you can choose what business you prefer then proceed.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '3. After Venture calculated the data, the result is available for viewing the computation of the population, traffic and utility services and it will display the percentage if your chosen business is appropriate for your preferred location.',
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
                              ),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                        child: TextButton(
                          child: Text(
                            'About us',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                color: Colors.grey.shade900,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Container(
                                  height: 780,
                                  width: 280,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 20),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              icon:
                                                  const Icon(Icons.arrow_back),
                                              color: Colors.grey.shade700,
                                              iconSize: 30,
                                              onPressed: () =>
                                                  Navigator.pop(context, false),
                                            ),
                                            Text(
                                              'About us',
                                              style: TextStyle(
                                                  fontFamily: 'Questrial',
                                                  color: Colors.grey.shade900,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 20),
                                        child: Row(
                                          children: [
                                            const ImageIcon(
                                              AssetImage(
                                                  "assets/images/icons/venture.png"),
                                              color: Colors.black,
                                              size: 23,
                                            ),
                                            Text(
                                              'About the Application',
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
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 20),
                                        child: Row(
                                          children: [
                                            const ImageIcon(
                                              AssetImage(
                                                  "assets/images/icons/team.png"),
                                              color: Colors.black,
                                              size: 23,
                                            ),
                                            Text(
                                              'About the Team',
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
                          },
                        ),
                      ),
                      TextButton(
                          child: Text(
                            'Terms and Condition',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                color: Colors.grey.shade900,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Container(
                                  height: 780,
                                  width: 280,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 20),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_back),
                                                color: Colors.grey.shade700,
                                                iconSize: 30,
                                                onPressed: () => Navigator.pop(
                                                    context, false),
                                              ),
                                              Text(
                                                'Terms and Condition',
                                                style: TextStyle(
                                                    fontFamily: 'Questrial',
                                                    color: Colors.grey.shade900,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 0, 20),
                                          child: Row(
                                            children: [
                                              const ImageIcon(
                                                AssetImage(
                                                    "assets/images/icons/note.png"),
                                                color: Colors.black,
                                                size: 23,
                                              ),
                                              Text(
                                                'Terms and Conditon',
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
                                          'You must agree to the Venture Terms of Conditions in order to use Venture. Please carefully read each of these documents. "Terms" refer to all of these agreements as a whole. They lay out what we anticipate from you as a user of our services and what you can anticipate from us. The Privacy Policy is not a part of these terms, but we encourage you to read it to learn more about how to edit, manage, export, and delete your information.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          ' 1. License. The Venture Terms and Conditions grant you a license to make use of certain features, including those that allow you to: a. view and annotate maps b. publicly display content with proper attribution online.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          ' 2. Prohibited Actions. Your observance of the restrictions on use in this license agreement You might not be able to use Venture (or allow those acting on your behalf to do so.) a.create a new product or service based on Venture, or redistribute or sell any portion of Venture.b. copy the content c. mass download the content or generate bulk feeds (or permit others to do so).',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          ' 3. Assumption of Risk: Actual Conditions. Use Venture at your own risk and use the map data, traffic, directions, and other content at your own risk even though actual conditions may differ from the results and content of the map. You are always in charge of your actions and their effects.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'Questrial',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          ' 4. Your Content in Venture: The terms of service for Venture, including the license in the section titled "Permission to use your content," apply to any content you upload, submit, store, send, or receive through Venture. However, since it is not uploaded or submitted to Venture, locally stored content that stays on your device is not covered by this license.',
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
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
