import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/feat_screens/dialogbutton.dart';

import '../userInfo.dart';

class ZoneScreen extends StatefulWidget {
  ZoneScreen(
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
  @override
  List<DropdownData> dropdownDatas = [];
  List<DropdownDataAssumption> dropdownAssumption = [];

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
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          title: const Text("Pinned Information"),
          //  title: Text(widget.ideal),
          foregroundColor: const Color.fromARGB(255, 44, 45, 48),
          elevation: 0.0,
          leading: const BackButton(
            color: Color.fromARGB(255, 44, 45, 48),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Center(
                    child: Container(
                        height: 1110,
                        padding: const EdgeInsets.all(5),
                        child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 20, 5, 10),
                                child: Column(children: <Widget>[
                                  const Text("You have Pinned This Location",
                                      style: TextStyle(fontSize: 19.0)),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Expanded(
                                    child: Expanded(child: Text(widget.place)),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Expanded(
                                      child: Text(
                                          "Coordinates:\nLatitude: ${widget.coordinates_latitude} \nLongitude: ${widget.coordinates_longitude}")),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Expanded(
                                      child: Text(
                                          "Landsize: ${widget.land_size}")),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Expanded(
                                      child: Text(
                                          "Population: ${widget.population}")),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Expanded(
                                      child:
                                          Text("Revenue: ${widget.revenue}")),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Expanded(
                                      child: TextButton(
                                    onPressed: () async {
                                      await DialogQuestion(widget.dataID,
                                              dropdownDatas, dropdownAssumption)
                                          .showMyDialog(context);
                                    },
                                    child: Material(
                                      color: const Color.fromARGB(
                                          255, 0, 110, 195),
                                      borderRadius: BorderRadius.circular(5.0),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(width: 10.0, height: 50),
                                          Text('Venture It',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.0)),
                                        ],
                                      ),
                                    ),
                                  ))
                                ]))))))));
  }
}
