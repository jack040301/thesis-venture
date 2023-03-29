import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/forecasting/forecast_bottomnav.dart';

class HistoryDialogLayout extends StatefulWidget {
  final String historyid;
  const HistoryDialogLayout({super.key, required this.historyid});

  @override
  HistoryDialog createState() {
    return HistoryDialog();
  }
}

class HistoryDialog extends State<HistoryDialogLayout> {
  @override
  Widget build(BuildContext context) {
    CollectionReference mark =
    FirebaseFirestore.instance.collection("pinnedlocation");
    // final String con = widget.marker.trim(); //this still has problem
    return FutureBuilder<DocumentSnapshot>(
      future: mark.doc(widget.historyid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong"); //error in getting the data
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Retry loading the application"); //put here
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          String placename = data['place_name'];
          String percentage = data['percentage'];

          String idealShop = data['ideal_shop'];
          String population = data['population'];
          String landSize = data['land_area'];
          String revenue = data['revenue'];
          String budgetRequired = data['budget_required'];
          String markerId = data['marker_id'];

          //String placename = data['place'];

          //for land size

          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 241, 242, 242),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text("Demographical Result Saved"),
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            DemogPlace(placename: placename),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Population", //POPULATION
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            DemogPopulation(popstrB: population),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Revenue per year", //REVENUE PER YEAR
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                              color: Colors.white,
                              child: Center(
                                child: Text('₱ $revenue', //REVENUE PER YEAR
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 20.0)), // <-- Text
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Land per SqM", //LAND PER SQ
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            LandPerSQM(landstr: landSize),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Budget required for the area",
                                    //BUDGET REQUIRED FOR THE AREA
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            BudgetRequiredArea(landbudgetstrB: '₱ $budgetRequired'),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                    textAlign: TextAlign.justify,
                                    "The Feasibilty (%) of your ideal \n business is",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 65, 99, 200),
                                        fontSize: 16.0)), // <-- Text
                              ),
                            ),
                            IdealBusinessResult(resultfinal: percentage),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 2, 35, 5),
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                    "Venture Suggested Business in this Place",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                              color: Colors.white,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(idealShop,
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 65, 99, 200),
                                          fontSize: 20.0)),
                                ), // <-- Text
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                          child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0.0,
                                                padding: const EdgeInsets.all(10.0),
                                                primary: const Color.fromARGB(
                                                    255, 0, 110, 195), // background
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(5.0)),
                                                minimumSize: const Size(
                                                    70, 40), //////// HERE
                                              ),
                                              onPressed: () async {
                                                await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForecastingNavBar(
                                                              markerid: markerId,
                                                              businessname:
                                                              idealShop,
                                                            )));
                                              },
                                              icon: const Icon(
                                                Icons.file_download_outlined,
                                                size: 18.0,
                                              ),
                                              label: const Text(
                                                "Show Forecast",
                                                style:
                                                TextStyle(color: Colors.white),
                                              ))),
                                      //Spacer(),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                    ]))
                          ]))));
        }
        return const Center(
            child:
            CircularProgressIndicator.adaptive()); //while loading the data
      },
    );
  }
}

class IdealBusinessResult extends StatelessWidget {
  const IdealBusinessResult({
    super.key,
    required this.resultfinal,
  });
  final String resultfinal;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 5),
      color: Colors.white,
      child: Center(
        child: Text(resultfinal,
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 23.0)), // <-- Text
      ),
    );
  }
}

class BudgetRequiredArea extends StatelessWidget {
  const BudgetRequiredArea({
    super.key,
    required this.landbudgetstrB,
  });
  final String landbudgetstrB;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
      color: Colors.white,
      child: Center(
        child: Text(landbudgetstrB,
            //BUDGET REQUIRED FOR THE AREA
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 20.0)), // <-- Text
      ),
    );
  }
}

class LandPerSQM extends StatelessWidget {
  const LandPerSQM({
    super.key,
    required this.landstr,
  });
  final String landstr;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
      color: Colors.white,
      child: Center(
        child: Text('$landstr' 'sqm', //LAND PER SQ
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 20.0)), // <-- Text
      ),
    );
  }
}

class DemogPopulation extends StatelessWidget {
  const DemogPopulation({
    super.key,
    required this.popstrB,
  });
  final String popstrB;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 2, 35, 10),
      color: Colors.white,
      child: Center(
        child: Text(popstrB, //POPULATION
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 20.0)), // <-- Text
      ),
    );
  }
}

class DemogPlace extends StatelessWidget {
  const DemogPlace({
    super.key,
    required this.placename,
  });
  final String placename;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(35, 10, 35, 15),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(placename, //DATA FOR PLACE
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 44, 45, 48), fontSize: 18.0)),
          )
        ],
      ),
    );
  }
}