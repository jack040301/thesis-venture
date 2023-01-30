import 'package:flutter/material.dart';

class ManualScreen extends StatefulWidget {
  const ManualScreen({super.key});

  @override
  State<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('How to Use the App'),
          foregroundColor: const Color.fromARGB(255, 44, 45, 48),
          elevation: 0.0,
          leading: const BackButton(
            color: Color.fromARGB(255, 44, 45, 48),
          ),
        ),
        body: const WidgetUseAppImages());
  }
}

class WidgetUseAppImages extends StatelessWidget {
  const WidgetUseAppImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 20),
              child: Row(
                children: [
                  const ImageIcon(
                    AssetImage("assets/images/icons/device.png"),
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
              height: 50,
              width: 50,
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
              height: 50,
              width: 50,
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
    );
  }
}
