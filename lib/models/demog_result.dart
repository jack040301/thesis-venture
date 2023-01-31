import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'forecasting/forecasting_population.dart';

class DemogResult extends StatefulWidget {
  const DemogResult(
      {super.key,
      required this.marker,
      required this.budget,
      required this.ideal});
  final String marker, ideal, budget;
  @override
  State<DemogResult> createState() => _DemogResultState();
}

class _DemogResultState extends State<DemogResult> {
  String popstrA = '';
  String landbudgetstrA = '';
  String revstrA = '';

  // ignore: prefer_typing_uninitialized_variables
  var businessname, businessbudget, landbudget, landrevenue, landpop;

  @override
  void initState() {
    super.initState();
    getBusinessData();
  }

  // ignore: non_constant_identifier_names
  Future<void> StatisForecasting(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BarchartPop(
          markerid: widget.marker,
        ),
      ),
    );
  }

  getBusinessData() async {
    CollectionReference business =
        FirebaseFirestore.instance.collection("business");
    var bud = widget.budget.trim();
    String budgetf = bud.toString();
    final docRef = business.where("budget",
        isEqualTo:
            budgetf); // yung budgets na variable yung gagamitin dito para matawag yung specific document accroding sa budget
    await docRef.get().then(
      (QuerySnapshot doc) {
        doc.docs.forEach((documents) async {
          var data = documents.data() as Map;
          businessname = data['name'];
          businessbudget = data['budget'];
          landbudget = data['land value'];
          landrevenue = data['revenue'];
          landpop = data['population'];
          landbudget = data['land value'];
          landrevenue = data['revenue'];
          landpop = data['population'];

// for coversion of var to String
          landbudgetstrA = data['land value'].toString();
          revstrA = data['revenue'].toString();
          popstrA = data['population'].toString();
        });
      },
      onError: (e) => ("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference mark = FirebaseFirestore.instance.collection("markers");
    final String con = widget.marker.trim(); //this still has problem

    return FutureBuilder<DocumentSnapshot>(
      future: mark.doc(con).get(),
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

          //for land size
          String landstr = data['land size'].toString();
          //  String landstrfinal = '${landstr}sqm';

          // for population
          String popstrB = data['population'].toString();
          double popdblB = double.parse(popstrB);
          double popdblA = double.parse(popstrA);
          double popdblfinal = (popdblB / popdblA) * 100;

          // for revenue
          String revstrB = data['revenue'].toString();
          double revdblB = double.parse(revstrB);

          double revdblA = double.parse(revstrA);
          double revdblfinal = (revdblB / revdblA) * 100;

          // for budget
          String landbudgetstrB = data['land'].toString();
          double landbudgetdblB = double.parse(landbudgetstrB);

          double landbudgetdblA = double.parse(landbudgetstrA);

          double landbudgetdblfinalA = landbudgetdblB - landbudgetdblA;
          double landbudgetdblfinalB = landbudgetdblA - landbudgetdblfinalA;
          double landbudgetdblfinalC =
              (landbudgetdblfinalB / landbudgetdblA) * 100;
          if (landbudgetdblfinalC > 100) {
            landbudgetdblfinalC = 100.0;
          }

          double result = (popdblfinal + revdblfinal + landbudgetdblfinalC) / 3;

          String resultA = result.toStringAsFixed(2);
          String resultfinal = '${resultA}%';

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 241, 242, 242),
            appBar: AppBar(
              backgroundColor: Colors.transparent,

              title: const Text("Demographical Result"),
              // title: Text(resultfinal),

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
                      DemogPlace(data: data),
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Population", //POPULATION
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      DemogPopu(popstrB: popstrB),
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Revenue per year", //REVENUE PER YEAR
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      DemogRevenue(revstrB: revstrB),
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Land per SqM", //LAND PER SQ
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      DemogLandsqm(landstr: landstr),
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Budget required for the area",
                              //BUDGET REQUIRED FOR THE AREA
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      DemogBudget(landbudgetstrB: landbudgetstrB),
                      DemogResultFinal(resultfinal: resultfinal),
                      Container(
                        width: 350,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Your ideal business is",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      DemogIdealBusiness(widget: widget),
                      Container(
                        width: 350,
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Business Type: Start Up",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: Center(
                          child: Text(
                              "Suggested business for you" '\n' '$businessname',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color.fromARGB(
                                              255, 0, 110, 195), // background
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          minimumSize:
                                              const Size(150, 50), //////// HERE
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Download",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                //Spacer(),

                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      //getMarkerData();
                                      // getBusinessData();

                                      StatisForecasting(context);
                                    },
                                    style: TextButton.styleFrom(
                                      minimumSize:
                                          const Size(150, 50), //<-- SEE HERE
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 0, 110, 195),
                                        width: 3,
                                      ),
                                    ),
                                    child: const Text('Done'),
                                  ),
                                ),
                              ]))
                    ],
                  ),
                )),
          );
        }

        return const Center(
            child: CircularProgressIndicator()); //while loading the data
      },
    );
  }
}

class DemogIdealBusiness extends StatelessWidget {
  const DemogIdealBusiness({
    super.key,
    required this.widget,
  });

  final DemogResult widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
      child: Center(
        // child: Text('',
        child: Text(widget.ideal,

            // ito dito ko sana sya ilalabas kaso ayaw nya
            //baa,
            style: const TextStyle(
                color: Color.fromARGB(255, 65, 99, 200),
                fontSize: 16.0)), // <-- Text
      ),
    );
  }
}

class DemogResultFinal extends StatelessWidget {
  const DemogResultFinal({
    super.key,
    required this.resultfinal,
  });

  final String resultfinal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
      child: Center(
        child: Text(resultfinal,
            style: const TextStyle(
                color: Color.fromARGB(255, 65, 99, 200),
                fontSize: 35.0)), // <-- Text
      ),
    );
  }
}

class DemogBudget extends StatelessWidget {
  const DemogBudget({
    super.key,
    required this.landbudgetstrB,
  });

  final String landbudgetstrB;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
      child: Center(
        child: Text(landbudgetstrB,
            //BUDGET REQUIRED FOR THE AREA
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 16.0)), // <-- Text
      ),
    );
  }
}

class DemogLandsqm extends StatelessWidget {
  const DemogLandsqm({
    super.key,
    required this.landstr,
  });

  final String landstr;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
      child: Center(
        child: Text('$landstr' 'sqm', //LAND PER SQ
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 16.0)), // <-- Text
      ),
    );
  }
}

class DemogRevenue extends StatelessWidget {
  const DemogRevenue({
    super.key,
    required this.revstrB,
  });

  final String revstrB;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
      child: Center(
        child: Text(revstrB, //REVENUE PER YEAR
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 16.0)), // <-- Text
      ),
    );
  }
}

class DemogPopu extends StatelessWidget {
  const DemogPopu({
    super.key,
    required this.popstrB,
  });

  final String popstrB;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
      child: Center(
        child: Text(popstrB, //POPULATION
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 16.0)), // <-- Text
      ),
    );
  }
}

class DemogPlace extends StatelessWidget {
  const DemogPlace({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(35, 20, 35, 7),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(data['place'], //DATA FOR PLACE
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 44, 45, 48), fontSize: 20.0)),
          )
        ],
      ),
    );
  }
}