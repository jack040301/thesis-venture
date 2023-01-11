import 'package:flutter/material.dart';

class TermsCondiScreen extends StatefulWidget {
  const TermsCondiScreen({super.key});

  @override
  State<TermsCondiScreen> createState() => _TermsCondiScreenState();
}

class _TermsCondiScreenState extends State<TermsCondiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Terms and Conditions'),
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
                                                "assets/images/icons/note.png"),
                                            color: Colors.black,
                                            size: 23,
                                          ),
                                          Text(
                                            ' Terms and Conditon',
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
    );
  }
}
