import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:main_venture/screens/home_page.dart';

class IntroductionScreens extends StatelessWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Tap anywhere on the map',
              body:
                  'You can choose any location by tapping anywhere on the map around Caloocan',
              image: Center(
                  child: Image.asset("assets/images/icons/1TapAnywhere.png",
                      height: 5000)),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Pinned Location\'s Display',
              body:
                  'After pinning a location, available zone markers will be shown and can be tapped',
              image: Center(
                  child: Image.asset(
                      "assets/images/icons/2PinnedLocDisplay.png",
                      height: 5000)),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Pinned Location\'s Place Name',
              body:
                  'Pinned location\'s place name will be shown including the Barangay and the City',
              image: Center(
                  child: Image.asset("assets/images/icons/3PinnedLoc.png",
                      height: 5000)),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Pinned Location\'s Coordinates',
              body:
                  'Coordinates of the pinned location will be shown including its latitude and longitude',
              image: Center(
                  child: Image.asset("assets/images/icons/4PinnedLoc.png",
                      height: 5000)),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Pinned Location\'s Land Size',
              body: 'You can see the land size here',
              image: Center(
                  child: Image.asset("assets/images/icons/5PinnedLoc.png",
                      height: 5000)),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Pinned Location\'s Population',
              body: 'Here, you can see the pinned location\'s population',
              image: Center(
                  child: Image.asset("assets/images/icons/6PinnedLoc.png",
                      height: 5000)),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Pinned Location\'s Revenue',
              body:
                  'In this section, you can see the pinned location\'s approximate revenue',
              image: Center(
                  child: Image.asset("assets/images/icons/7PinnedLoc.png",
                      height: 5000)),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Venture it!',
              body: 'Tap the button to begin your Venture',
              image: Center(
                  child: Image.asset("assets/images/icons/8PinnedLoc.png",
                      height: 5000)),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            // When done button is press
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));

            /*   if (kDebugMode) {
              print("Done clicked");
            } */
          },
          //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          isBottomSafeArea: true,
          skip:
              const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.forward),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: getDotsDecorator()),
    );
  }

  //widget to add the image on screen

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 50),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 10, right: 10),
      titlePadding: EdgeInsets.only(top: 40),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 14),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
