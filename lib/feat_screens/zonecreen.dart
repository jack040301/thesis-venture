import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/feat_screens/dialogbutton.dart';
import 'package:main_venture/onboarding_screens/quick_guide_zone.dart';

import '../userInfo.dart';

class ZoneScreen extends StatefulWidget {
  const ZoneScreen(
      {super.key,
        required this.dataID,
        required this.place,
        required this.coordinates_latitude,
        required this.coordinates_longitude,
        required this.land_size,
        required this.population,
        required this.revenue});

  final String dataID, place, land_size, population, revenue;

  final double coordinates_latitude, coordinates_longitude;

  @override
  State<ZoneScreen> createState() => _ZoneScreenState();
}

class _ZoneScreenState extends State<ZoneScreen> {
  List<DropdownData> dropdownDatas = [];
  List<DropdownDataAssumption> dropdownAssumption = [];
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  String popstrA = '';
  String landbudgetstrA = '';
  String revstrA = '';

  Future getBusiness() async {
    await FirebaseFirestore.instance
        .collection("business")
        .get()
        .then((QuerySnapshot snapshot) => {
      snapshot.docs.forEach((documents) async {
        var data = documents.data() as Map;

        dropdownDatas.add(DropdownData(nameofbusiness: documents.id));
        dropdownAssumption.add(
            DropdownDataAssumption(budgetassump: data['budgetassump']));
      })
    });
  }

  @override
  void initState() {
    getBusiness();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Pinned Location'),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 20.0),
            icon: Icon(
              Icons.info_outline,
              color: Color.fromARGB(
                  255, 65, 99, 200),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const SliderZoneScreen()));
            },
          )
        ],
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
//             fontSize: 18.0, )), // <-- Text
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
                  children: <Widget>[
                    Image(
                        image: AssetImage(
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
                          )),
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
                  children: <Widget>[
                    const Image(
                        image: AssetImage('assets/images/icons/PlaceIcon.png'),
                        height: 100),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text('Place: ${widget.place}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
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
                  children: <Widget>[
                    const Image(
                        image: AssetImage(
                            'assets/images/icons/CoordinatesIcon.png'),
                        height: 70),
                    const SizedBox(
                      width: 17.0,
                    ),
                    Expanded(
                      child: Text(
                          'Coordinates: \nLatitude: ${widget.coordinates_latitude} \nLongitude: ${widget.coordinates_longitude}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
                    )
                  ],
                ),
              ),
/*   //ZONE
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
                            'assets/images/icons/ZoneIcon.png'),
                        height: 90),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                      child: Text('Zone:',
                          style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
                    )
                  ],
                ),
              ), */
//LAND SIZE
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                child: Row(
                  children: <Widget>[
                    const Image(
                        image:
                        AssetImage('assets/images/icons/LandSizeIcon.png'),
                        height: 80),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Text(
                          'Land Size: ${widget.land_size}'
                              .replaceAllMapped(reg, mathFunc)
                              .toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
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
                child: Row(
                  children: <Widget>[
                    const Image(
                        image: AssetImage(
                            'assets/images/icons/PopulationIcon.png'),
                        height: 80),
                    const SizedBox(
                      width: 26.0,
                    ),
                    Expanded(
                      child: Text(
                          'Population: ${widget.population}'
                              .replaceAllMapped(reg, mathFunc)
                              .toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
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
                child: Row(
                  children: <Widget>[
                    const Image(
                        image:
                        AssetImage('assets/images/icons/RevenueIcon.png'),
                        height: 80),
                    const SizedBox(
                      width: 35.0,
                    ),
                    Expanded(
                      child: Text(
                          'Revenue: ₱${widget.revenue}'
                              .replaceAllMapped(reg, mathFunc)
                              .toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RawMaterialButton(
                          padding: const EdgeInsets.all(15.0),
                          fillColor: const Color.fromARGB(255, 0, 110, 195),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () async {
                            await DialogQuestion(widget.dataID, dropdownDatas,
                                dropdownAssumption)
                                .showMyDialog(context);
                          },
                          child: const Text(
                            'Venture It!',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
