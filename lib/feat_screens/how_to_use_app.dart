import 'package:flutter/material.dart';

class ManualScreen extends StatefulWidget {
  const ManualScreen({super.key});

  @override
  State<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('How to Use the Application'),
        foregroundColor: const Color.fromARGB(255, 44, 45, 48),
        elevation: 0.0,
        leading: const BackButton(
          color: Color.fromARGB(255, 44, 45, 48),
        ),
      ),
      body: const ContentHowToUse(),
    );
  }
}

class ContentHowToUse extends StatelessWidget {
  const ContentHowToUse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(35, 20, 35, 7),
              child: Row(
                children: const [
                  ImageIcon(
                    AssetImage("assets/images/icons/device.png"),
                    color: Color.fromARGB(255, 28, 28, 28),
                    size: 18,
                  ),
                  Text(
                    ' How to use the app',
                    style: TextStyle(
                        color: Color.fromARGB(255, 28, 28, 28), fontSize: 19),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(65, 10, 35, 5),
              child: Row(
                children: const <Widget>[
                  Image(
                      image: const AssetImage('assets/images/device1.PNG'),
                      height: 200)
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 2, 40, 7),
              child: const Center(
                child: Text("Creating and Log-in Account",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color.fromARGB(255, 28, 28, 28),
                        fontSize: 18.0)), // <-- Text
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 2, 35, 7),
              color: Colors.white,
              child: const Center(
                child: Text(
                  '1. On your Mobile phone or tablet, open the Venture application.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 2, 35, 7),
              color: Colors.white,
              child: const Center(
                child: Text(
                  '2. If you do not have an Account, you can create your account by Signing-up Requirements or you can connect to your Google to create an account.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 2, 35, 7),
              color: Colors.white,
              child: const Center(
                child: Text(
                  '3. Now you have an account, proceed to log-in your account so you can go to the landing page.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(65, 5, 35, 5),
              child: Row(
                children: const <Widget>[
                  Image(
                      image: const AssetImage('assets/images/device2.PNG'),
                      height: 200)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 2, 70, 7),
              color: Colors.white,
              child: const Center(
                child: Text("Search and Pin Location",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color.fromARGB(255, 28, 28, 28),
                        fontSize: 18.0)), // <-- Text
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 2, 35, 7),
              color: Colors.white,
              child: const Center(
                child: Text(
                  '1. Now you are done claiming your daily rewards you can search and pin location on the map by tapping your preferred location to start a business.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontFamily: 'Questrial',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 2, 35, 7),
              color: Colors.white,
              child: const Center(
                child: Text(
                  '2. Once you select your preferred location for your business, you can choose what business you prefer then proceed.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 2, 35, 15),
              color: Colors.white,
              child: const Center(
                child: Text(
                  '3. After Venture calculated the data, the result is available for viewing the computation of the population, traffic and utility services and it will display the percentage if your chosen business is appropriate for your preferred location.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
