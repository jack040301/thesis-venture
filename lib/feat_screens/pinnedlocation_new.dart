import 'package:flutter/material.dart';

import 'Dialogbutton.dart';

class pinnedlocation extends StatefulWidget {
  const pinnedlocation({super.key});

  @override
  State<pinnedlocation> createState() => _pinnedlocationState();
}

class _pinnedlocationState extends State<pinnedlocation> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Pinned Location'),
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
            // Container(
            //   color: Colors.white,
            //   padding: const EdgeInsets.fromLTRB(20, 2, 40, 7),
            //   child: const Center(
            //     child: Text("\n\nYou have pinned this location\n",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             color: Color.fromARGB(255, 28, 28, 28),
            //             fontSize: 18.0, fontWeight: FontWeight.bold)), // <-- Text
            //   ),
            // ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(70, 10, 35, 5),
              child: Row(
                children: const <Widget>[
                  Image(
                      image: const AssetImage(
                          'assets/images/icons/pinBuildingIcon.png'),
                      height: 30),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text('You have pinned this location',
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            //PLACE
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
              child: Row(
                children: const <Widget>[
                  Image(
                      image:
                          const AssetImage('assets/images/icons/PlaceIcon.png'),
                      height: 100),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text('Place:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //COORDINATES
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
              child: Row(
                children: const <Widget>[
                  Image(
                      image: const AssetImage(
                          'assets/images/icons/CoordinatesIcon.png'),
                      height: 70),
                  SizedBox(
                    width: 17.0,
                  ),
                  Expanded(
                    child: Text('Coordinates:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            //ZONE
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
              child: Row(
                children: const <Widget>[
                  Image(
                      image:
                          const AssetImage('assets/images/icons/ZoneIcon.png'),
                      height: 90),
                  SizedBox(
                    width: 25.0,
                  ),
                  Expanded(
                    child: Text('Zone:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            //LAND SIZE
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
              child: Row(
                children: const <Widget>[
                  Image(
                      image: const AssetImage(
                          'assets/images/icons/LandSizeIcon.png'),
                      height: 80),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Text('Land Size:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            //POPULATION
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
              child: const Row(
                children:  <Widget>[
                  Image(
                      image: const AssetImage(
                          'assets/images/icons/PopulationIcon.png'),
                      height: 80),
                  SizedBox(
                    width: 26.0,
                  ),
                  Expanded(
                    child: Text('Population:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            //REVENUE
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
              child: const Row(
                children:  <Widget>[
                  Image(
                      image: const AssetImage(
                          'assets/images/icons/RevenueIcon.png'),
                      height: 80),
                  SizedBox(
                    width: 35.0,
                  ),
                  Expanded(
                    child: Text('Revenue:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            // const SizedBox(
            //   height: 1.0,
            // ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            ),
            GestureDetector(
              onTap: () async {
                //  Navigator.of(context).push(MaterialPageRoute(
                //        builder: (context) => const DialogQuestion()));
              },
              child: Material(
                color: const Color.fromARGB(255, 0, 110, 195),
                borderRadius: BorderRadius.circular(5.0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10.0, height: 50),
                    const Text('Venture it!\t\t',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    // Ink.image(
                    //     image: const AssetImage(
                    //         'assets/images/icons/back.png'),
                    //     height: 40,
                    //     width: 30),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 20),
            ),

            //END
          ],
        ),
      ),
    );
  }
}
