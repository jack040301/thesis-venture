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
            //Container(
            //  color: Colors.white,
            //  padding: const EdgeInsets.fromLTRB(35, 20, 35, 7),
            //  child: const Row(
            //children: const [
            //ImageIcon(
            //  AssetImage("assets/images/icons/device.png"),
            //  color: Color.fromARGB(255, 28, 28, 28),
            //   size: 18,
            // ),
            // Text(
            //  ' How to use the app',
            //    style: TextStyle(
            //      color: Color.fromARGB(255, 28, 28, 28), fontSize: 19),
            // ),
            //  ],
            // ),
            //     ),

            //CREATING AND LOG IN ACCOUNT
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(65, 10, 35, 5),
              child:  Row(
                children: <Widget>[
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
                child: Text("\t\t\t\t\t\t\t\t\t\tCreating and Log-in Account\n",
                    textAlign: TextAlign.center,
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
                  '3. If you received an email click the link from the email to verify your google account.',
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
                  '4. Now you have an account, proceed to log-in your account so you can go to the landing page.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            //Selecting a Pinned Location
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(100, 5, 35, 5),
              child:  Row(
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/images/icons/Selecting.png'),
                      height: 150)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 2, 70, 7),
              color: Colors.white,
              child: const Center(
                child: Text("\t\t\t\t\t\t\t\t\t\tSelecting a Pinned Location\n",
                    textAlign: TextAlign.center,
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
                  '1. After logging into your account, the map will be shown.',
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
                  '2. Tap the pin icon in the map from your preferred area.',
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
                  '3. Dialog box for selection of preference will be displayed.',
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
                  '4. Choose your preferred business.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '5. Choose your preferred budget for the business.',
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
                  '6. Enter value for your preferred area (per square meter).',
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
                  '7. Tap the proceed button button.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '8. Demographic results will be shown.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '9. Tap the Download button to save the result.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '10. Tap the Done button.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '11. The app will show the forecasted results after 3 years of the business.',
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
                  '12. Tap the Download button to save the forecasted result.',
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
                  '13. Tap the Done button to redirect to the Venture map.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            //	Customize Account (for changing personal information)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(100, 5, 35, 5),
              child:  Row(
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/images/icons/Customize.png'),
                      height: 150)
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 2, 40, 7),
              child: const Center(
                child: Text(
                    "Customize Account \n(for changing personal information)\n",
                    textAlign: TextAlign.center,
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
                  '1. Select your profile in the upper right corner.\t\t\t\t\t\t\t',
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
                  '2. Tap settings.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '3. Tap Customize Account.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '4. Update your information in the text field provided.',
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
                  '5. Tap the save button to save the changes.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            //	Change Password
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(100, 5, 35, 5),
              child:  Row(
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/images/icons/ChangePass.png'),
                      height: 150)
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 2, 40, 7),
              child: const Center(
                child: Text(
                    "Change Password \n (for changing the venture account’s password)\n",
                    textAlign: TextAlign.center,
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
                  '1. Tap your profile in the upper right corner.\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '2. Tap settings.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '3. Tap Change Password.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '4. Change your password from the text field provided.',
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
                  '5. Tap the save button to save the changes.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            //	Sending Request for pinning of location
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(100, 5, 35, 5),
              child:  Row(
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/images/icons/Request.png'),
                      height: 150)
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 2, 40, 7),
              child: const Center(
                child: Text(
                    "\t\t\t\t\t\t\t\t\t\tSending Request for pinning of location",
                    textAlign: TextAlign.center,
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
                  '1. Tap the profile.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '2. Tap the Request for pinning of location.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '3. Tap the gmail link of Venture to be redirected to the compose email form.\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
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
                  '4. Send the request email and wait for at least 72 hours for the admin to respond.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            /* Container(
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
            ),*/
          ],
        ),
      ),
    );
  }
}
