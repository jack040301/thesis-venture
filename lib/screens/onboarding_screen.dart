import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:main_venture/screens/home_page.dart';


class IntroductionScreens extends StatefulWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}
class _IntroductionScreensState extends State<IntroductionScreens>{
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required String urlImage,
  }) =>
      Container(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(urlImage,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 10),
                        width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 5)),
                  ])));

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
        padding: const EdgeInsets.fromLTRB(0,30,0,0),
        child: PageView(
            controller: controller,
            onPageChanged: (index){
              setState(() => isLastPage = index ==8);
            },
            children: [
              buildPage(
                  urlImage: 'assets/images/icons/Welcome.png'),
              buildPage(
                  urlImage: 'assets/images/icons/1TapAnywhere.png'),
              buildPage(
                  urlImage: 'assets/images/icons/2PinnedLocDisplay.png'),
              buildPage(
                  urlImage: 'assets/images/icons/3PinnedLoc.png'),
              buildPage(
                  urlImage: 'assets/images/icons/4PinnedLoc.png'),
              buildPage(
                  urlImage: 'assets/images/icons/5PinnedLoc.png'),
              buildPage(
                urlImage: 'assets/images/icons/6PinnedLoc.png',),
              buildPage(
                  urlImage: 'assets/images/icons/7PinnedLoc.png'),
              buildPage(
                urlImage: 'assets/images/icons/8PinnedLoc.png',),
            ])
    ),
    bottomSheet: isLastPage
        ? TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 0, 110, 195),
          minimumSize: const Size.fromHeight(50)
      ),
      child: const Text('Get Started',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
      },
    )
        :
    Container(
      padding: const EdgeInsets.fromLTRB(2,0,2,0),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            child: const Text('SKIP'),
            onPressed: () => controller.jumpToPage(8),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 8,
              effect: WormEffect(
                spacing: 12,
                dotHeight: 12,
                dotWidth: 12,
                dotColor: Colors.black26,
                activeDotColor:Color.fromARGB(255, 0, 110, 195),
              ),
              onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn),
            ),
          ),
          TextButton(
            child: const Text('NEXT'),
            onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
          ),
        ],
      ),
    ),

  );
}
