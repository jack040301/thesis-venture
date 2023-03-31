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
      body: const WidgetTermsAndCondition(),
    );
  }
}

class WidgetTermsAndCondition extends StatelessWidget {
  const WidgetTermsAndCondition({
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
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 7),
                    child: Row(
                      children: const <Widget>[
                        const ImageIcon(
                          AssetImage("assets/images/icons/termsOfServiceIcon.png"),
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Text(
                            ' Terms and Conditons',
                            style: TextStyle(
                                height: 1.5,
                                color: Color.fromARGB(255, 33, 33, 33),
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(30, 2, 30, 7),
                    child: const Text(
                      'You must agree to the Venture Terms of Conditions in order to use Venture. Please carefully read each of these documents. "Terms" refer to all of these agreements as a whole. They lay out what we anticipate from you as a user of our services and what you can anticipate from us. The Privacy Policy is not a part of these terms, but we encourage you to read it to learn more about how to edit, manage, export, and delete your information.\n',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(30, 2, 83, 7),
                    child: const Text(
                      'Interpretation and Definitions\n\tInterpretation',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 210, 7),
                    child: const Text(
                      'Definitions',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'For the purposes of this Privacy Policy:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Color.fromARGB(255, 54, 54, 54),
                          fontFamily: 'Questrial',
                          fontSize: 16,),
                        children: <TextSpan>[
                          TextSpan(text: '• Account ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'means a unique account created for You to access our Service or parts of our Service.\n'),
                          TextSpan(text: '• Application ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'refers to Venture, a hybrid application provided by the team Hexagon.\n'),
                          TextSpan(text: '• Team ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '( referred to as either “The Team”,”We”,”Us” or “Our”) refers to Venture.\n'),
                          TextSpan(text: '• Device ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'means any device that can access the Service such as a Desktop Computer, a Mobile Phones or a Digital Tablets.\n'),
                          TextSpan(text: '• Personal Data ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'is any information that relates to an identified or identifiable individual.\n'),
                          TextSpan(text: '• Service ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'refers to the Application\n'),
                          TextSpan(text: '• Usage Data ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'refers to data collected automatically  “Email Details”  either generated by the use of the Service or from the Service infrastructure itself.\n'),
                          TextSpan(text: '• Location Information ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'means collecting information about your location when you use our services, which helps us offer features like search results for things near you.\n'),
                          TextSpan(text: '• You ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'mean the individual accessing or using the Service or Application,or other legal entity on behalf of which such individual is accessing or using the Service, as applicable. \n'),
                        ],
                      ),
                    ),),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 150, 7),
                    child: const Text(
                      'Acknowledgement ',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                      child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              style: TextStyle(
                                height: 1.5,
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontFamily: 'Questrial',
                                fontSize: 16,),
                              children: <TextSpan>[
                                TextSpan(text: 'These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.\n\n'),
                                TextSpan(text: 'Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all users and others who access or use the Service\n\n'),
                                TextSpan(text: 'By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.\n\n'),
                                TextSpan(text: 'Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.\n'),
                              ]))),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Color.fromARGB(255, 54, 54, 54),
                          fontFamily: 'Questrial',
                          fontSize: 16,),
                        children: <TextSpan>[
                          TextSpan(text: 'License. ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'The Venture Terms and Conditions grant you a license to make use of certain features, including those that allow you to:\n'),
                          TextSpan(text: '• View and annotate maps;\n'),
                          TextSpan(text: '• Publicly display content with proper attribution online.\n\n'),
                          TextSpan(text: 'Prohibited Actions. ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Your observance of the restrictions on use in this license agreement You might not be able to use Venture (or allow those acting on your behalf to do so).\n'),
                          TextSpan(text: '• Create a new product or service based on Venture, or redistribute or sell any portion of Venture.\n'),
                          TextSpan(text: '• Copy the content\n'),
                          TextSpan(text: '• Mass download the content or generate bulk feeds (or permit others to do so);\n'),
                        ],
                      ),
                    ),),

                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                      child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              style: TextStyle(
                                height: 1.5,
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontFamily: 'Questrial',
                                fontSize: 16,),
                              children: <TextSpan>[
                                TextSpan(text: 'Assumption of Risk: Actual Conditions. ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: 'Use Venture at your own risk and use the map data, traffic, directions, and other content at your own risk even though actual conditions may differ from the results and content of the map. You are always in charge of your actions and their effects.:\n\n'),
                                TextSpan(text: 'Your Content in Venture: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: 'The terms of service for Venture, including the license in the section titled "Permission to use your content," apply to any content you upload, submit, store, send, or receive through Venture. However, since it is not uploaded or submitted to Venture, locally stored content that stays on your device is not covered by this license.\n\n'),
                                TextSpan(text: 'Termination: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: 'We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions. Upon termination, Your right to use the Service will cease immediately.\n'),
                              ]))),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(30, 2, 122, 7),
                    child: const Text(
                      'Severability and Waiver\n\tSeverability',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'If any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 235, 7),
                    child: const Text(
                      'Waiver',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'Except as provided herein, the failure to exercise a right or to require performance of an obligation under these Terms shall not affect a party\'s ability to exercise such right or require such performance at any time thereafter nor shall the waiver of a breach constitute a waiver of any subsequent breach.\n',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'Changes to These Terms and Conditions',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.\nBy continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 7),
                    child: Row(
                      children: const <Widget>[
                        const ImageIcon(
                          AssetImage("assets/images/icons/termsOfServiceIcon.png"),
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                height: 1.5,
                                color: Color.fromARGB(255, 33, 33, 33),
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(30, 2, 30, 7),
                    child: const Text(
                      'Venture is a hybrid application that aims to help the inspiring entrepreneurs to startup a business. By the help of the Google Map API the user can access the map and select the pinned location in the specific area where he wants to set up a business. We use Your Personal data ”Email Account” to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.\nThis Privacy Policy describes our policies and procedures on the collection,use and disclosure of your information when you use the service and tells you about your privacy rights and how the law protects You.\n',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(30, 2, 83, 7),
                    child: const Text(
                      'Interpretation and Definitions\n\tInterpretation',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 210, 7),
                    child: const Text(
                      'Definitions',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'For the purposes of this Privacy Policy:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Color.fromARGB(255, 54, 54, 54),
                          fontFamily: 'Questrial',
                          fontSize: 16,),
                        children: <TextSpan>[
                          TextSpan(text: '• Account ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'means a unique account created for You to access our Service or parts of our Service.\n'),
                          TextSpan(text: '• Application ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'refers to Venture, a hybrid application provided by the team Hexagon.\n'),
                          TextSpan(text: '• Team ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '( referred to as either “The Team”,”We”,”Us” or “Our”) refers to Venture.\n'),
                          TextSpan(text: '• Device ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'means any device that can access the Service such as a Desktop Computer, a Mobile Phones or a Digital Tablets.\n'),
                          TextSpan(text: '• Personal Data ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'is any information that relates to an identified or identifiable individual.\n'),
                          TextSpan(text: '• Service ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'refers to the Application\n'),
                          TextSpan(text: '• Usage Data ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'refers to data collected automatically  “Email Details”  either generated by the use of the Service or from the Service infrastructure itself.\n'),
                          TextSpan(text: '• Location Information ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'means collecting information about your location when you use our services, which helps us offer features like search results for things near you.\n'),
                          TextSpan(text: '• You ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'mean the individual accessing or using the Service or Application,or other legal entity on behalf of which such individual is accessing or using the Service, as applicable. \n'),
                        ],
                      ),
                    ),),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(30, 2, 40, 7),
                    child: const Text(
                      'Collecting and Using Your Personal Data\n\tPersonal Data',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'While using Our Service, We may ask You to provide Us with certain personally identifiable information ”Email Address”  that can be used to contact or identify You.\n',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 199, 7),
                    child: const Text(
                      'Usage Data',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'Is collected automatically when using the Service. When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use unique device identifiers and other diagnostic data.\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.\n',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'Information Collected while Using the Application',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'While using our  Application, in order to provide features of Our Application, We may collect, with Your prior permission:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Color.fromARGB(255, 54, 54, 54),
                          fontFamily: 'Questrial',
                          fontSize: 16,),
                        children: <TextSpan>[
                          TextSpan(text: '• Information regarding your location\n', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'We use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Web Application ”Admin Site” or it may be simply stored on your device.\n'),
                        ],
                      ),
                    ),),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 98, 7),
                    child: const Text(
                      'Use of Your Personal Data',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'The Application may use Personal Data for the following purposes:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Color.fromARGB(255, 54, 54, 54),
                          fontFamily: 'Questrial',
                          fontSize: 16,),
                        children: <TextSpan>[
                          TextSpan(text: '• To Provide and Maintain Our Service\n'),
                          TextSpan(text: '• To Manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.\n'),
                          TextSpan(text: '• To Contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.\n'),
                          TextSpan(text: '• To Manage Your Request: To attend and manage your request to us.\n'),
                          TextSpan(text: '• For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, and to evaluate and improve our services.\n'),
                          TextSpan(text: '• For business transfer: We may share or transfer your personal information in connection with, or during negotiations of,any merger,sale of team assets,financing,or acquisition of all or a portion of Our business to another company.\n'),
                          TextSpan(text: '• With your consent: We may disclose your personal information for any other purpose with your consent.\n'),
                        ],
                      ),
                    ),),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 57, 7),
                    child: const Text(
                      'Retention of Your Personal Data',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                      child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              style: TextStyle(
                                height: 1.5,
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontFamily: 'Questrial',
                                fontSize: 16,),
                              children: <TextSpan>[
                                TextSpan(text: 'The Team will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations(for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\n'),
                                TextSpan(text: 'The Team will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.\n'),
                              ]))),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 67, 7),
                    child: const Text(
                      'Transfer of Your Personal Data',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                      child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              style: TextStyle(
                                height: 1.5,
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontFamily: 'Questrial',
                                fontSize: 16,),
                              children: <TextSpan>[
                                TextSpan(text: 'Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.\n'),
                                TextSpan(text: 'The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.\n'),
                              ]))),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 97, 7),
                    child: const Text(
                      'Delete Your Personal Data',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                      child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              style: TextStyle(
                                height: 1.5,
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontFamily: 'Questrial',
                                fontSize: 16,),
                              children: <TextSpan>[
                                TextSpan(text: 'You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You. Our Service may give You the ability to delete certain information about You from within the Service.\n'),
                                TextSpan(text: 'You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.\n'),
                                TextSpan(text: 'Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.\n'),
                              ]))),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 52, 7),
                    child: const Text(
                      'Disclosure of Your Personal Data',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Color.fromARGB(255, 54, 54, 54),
                          fontFamily: 'Questrial',
                          fontSize: 16,),
                        children: <TextSpan>[
                          TextSpan(text: '• Comply with a legal obligation\n'),
                          TextSpan(text: '• Protect and defend the rights or property of the Company\n'),
                          TextSpan(text: '• Prevent or investigate possible wrongdoing in connection with the Service\n'),
                          TextSpan(text: '• Protect the personal safety of Users of the Service or the public\n'),
                          TextSpan(text: '• Protect against legal liability\n'),
                        ],
                      ),
                    ),),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 68, 7),
                    child: const Text(
                      'Security of Your Personal Data',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.\n',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 71, 7),
                    child: const Text(
                      'Changes to this Privacy Policy',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the "Last updated" date at the top of this Privacy Policy.\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.\n',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),

                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 205, 7),
                    child: const Text(
                      'Contact Us',
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                    child: const Text(
                      'If you have any questions about these Terms and Conditions, You can contact us:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontFamily: 'Questrial',
                        fontSize: 16,
                      ),
                    ),),

                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(35, 2, 35, 20),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                height: 1.5,
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontFamily: 'Questrial',
                                fontSize: 16,),
                              children: <TextSpan>[
                                TextSpan(text: '• By email: '),
                                TextSpan(text: 'ucc.venture@gmail.com\n', style: TextStyle(color: Color.fromARGB(255, 31, 182, 223),)),
                                TextSpan(text: '• By visiting our facebook page:\n'),
                                TextSpan(text: 'Venture App', style: TextStyle(color: Color.fromARGB(255, 31, 182, 223),)),
                              ] )))])));
  }
}