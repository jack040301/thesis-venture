import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../component/loading.dart';

class DemogResult extends StatefulWidget {
  const DemogResult({super.key, required this.marker});

  final String marker;
  @override
  State<DemogResult> createState() => _DemogResultState();
}

class _DemogResultState extends State<DemogResult> {
<<<<<<< Updated upstream
=======
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  String popstrA = '';
  String landbudgetstrA = '';
  String revstrA = '';

  // ignore: prefer_typing_uninitialized_variables
  var businessname, businessbudget, landbudget, landrevenue, landpop;

  @override
  void initState() {
    getBusinessData();

    super.initState();
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

  Future<void> ChartForecasting(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ForecastingLineChart(
                  business: businessname,
                )));
  }

  Future getBusinessData() async {
    CollectionReference business =
        FirebaseFirestore.instance.collection("business");
    var bud = widget.budget.trim();
    String budgetf = bud.toString();
    final docRef = business.where("budget", isEqualTo: budgetf);
    await docRef.get().then(
      (QuerySnapshot doc) {
        doc.docs.forEach((documents) async {
          var data = documents.data() as Map;
          businessname = data['name'];
          businessbudget = data['budget'];
          landbudget = data['land value'];
          landrevenue = data['revenue'];
          landpop = data['population'];
          //landbudget = data['land value'];
          landrevenue = data['revenue'];
          //landpop = data['population'];

// for coversion of var to String
          landbudgetstrA = data['land value'].toString();
          revstrA = data['revenue'].toString();
          popstrA = data['population'].toString();
        });
      },
      onError: (e) => ("Error getting document: $e"),
    );
  }

  Future<String> savingImage(Uint8List bytes) async {
    PopSnackbar popSnackbar = PopSnackbar();

    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final filename = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: filename);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(popSnackbar.popsnackbar("Sucessfully Downloaded Result"));
    return result['filepath'];
  }

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    CollectionReference mark = FirebaseFirestore.instance.collection("markers");
    final String con = widget.marker.trim(); //this still has problem

    return FutureBuilder<DocumentSnapshot>(
<<<<<<< Updated upstream
      future: mark.doc("$con").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong"); //error in getting the data
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Retry loading the application"); //put here
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 241, 242, 242),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(widget.marker),
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
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.fromLTRB(35, 20, 35, 7),
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Text(data['place'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 44, 45, 48),
                                      fontSize: 20.0)),
                            )
                          ],
                        ),
                      ),
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
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Land per sq", //LAND PER SQ
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text(
                              "Budget required for the area", //BUDGET REQUIRED FOR THE AREA
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Your business is",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("67%",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 35.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("ideal",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 65, 99, 200),
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
                        child: const Center(
                          child: Text("Business Type",
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
                        child: const Center(
                          child: Text("Suggested business for you",
                              style: TextStyle(
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
                                              Size(150, 50), //////// HERE
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Download",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                //Spacer(),

                                Expanded(
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize:
                                          const Size(150, 50), //<-- SEE HERE
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 0, 110, 195),
                                        width: 3,
                                      ),
                                    ),
                                    child: Text('Done'),
                                  ),
                                ),
                              ]))
                    ],
                  ),
                )),
          );
        }

        return Loading(); //while loading the data
      },
=======
        future: mark.doc(con).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text(
                "Something went wrong"); //error in getting the data
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
            double popdblfinal = (popdblB / popdblB) * 100;

            // for revenue
            String revstrB = data['revenue'].toString();
            double revdblB = double.parse(revstrB);

            double revdblA = double.parse(revstrA);
            double revdblfinal = (revdblB / revdblB) * 100;

            // for budget
            String landbudgetstrB = data['land'].toString();
            double landbudgetdblB = double.parse(landbudgetstrB);

            double landbudgetdblA = double.parse(landbudgetstrA);
            /*  double landbudgetdblfinalA = landbudgetdblB - landbudgetdblB;
          double landbudgetdblfinalB = landbudgetdblB - landbudgetdblfinalA;
          double landbudgetdblfinalC =
              (landbudgetdblfinalB / landbudgetdblB) * 100; */
            double landbudgetdblfinalA = landbudgetdblB - landbudgetdblA;
            double landbudgetdblfinalB = landbudgetdblA - landbudgetdblfinalA;
            double landbudgetdblfinalC =
                (landbudgetdblfinalB / landbudgetdblA) * 100;
            if (landbudgetdblfinalC > 100) {
              landbudgetdblfinalC = 100.0;
            }

            double result =
                (popdblfinal + revdblfinal + landbudgetdblfinalC) / 3;

            String resultA = result.toStringAsFixed(2);
            String resultfinal = '${resultA}%';

            return Scaffold(
                backgroundColor: const Color.fromARGB(255, 241, 242, 242),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,

                  title: const Text("Demographical Result"),
                  //  title: Text(widget.ideal),
                  foregroundColor: const Color.fromARGB(255, 44, 45, 48),
                  elevation: 0.0,
                  leading: const BackButton(
                    color: Color.fromARGB(255, 44, 45, 48),
                  ),
                ),
                body: Screenshot(
                    controller: screenshotController,
                    child: Padding(
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
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 2, 35, 2),
                                child: const Center(
                                  child: Text("Population", //POPULATION
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 45, 48),
                                          fontSize: 15.0)), // <-- Text
                                ),
                              ),

                              DemogPopulation(popstrB: popstrB),
                              Container(
                                width: 350,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 2, 35, 0),
                                child: const Center(
                                  child: Text(
                                      "Revenue per year", //REVENUE PER YEAR
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 45, 48),
                                          fontSize: 15.0)), // <-- Text
                                ),
                              ),

                              Container(
                                width: 350,
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 0, 35, 10),
                                child: Center(
                                  child: Text(revstrB, //REVENUE PER YEAR
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 45, 48),
                                          fontSize: 20.0)), // <-- Text
                                ),
                              ),

                              Container(
                                width: 350,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 2, 35, 0),
                                child: const Center(
                                  child: Text("Land per SqM", //LAND PER SQ
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 45, 48),
                                          fontSize: 15.0)), // <-- Text
                                ),
                              ),
                              LandPerSQM(landstr: landstr),

                              Container(
                                width: 350,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 2, 35, 0),
                                child: const Center(
                                  child: Text("Budget required for the area",
                                      //BUDGET REQUIRED FOR THE AREA
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 45, 48),
                                          fontSize: 15.0)), // <-- Text
                                ),
                              ),
                              BudgetRequiredArea(
                                  landbudgetstrB: landbudgetstrB),

                              Container(
                                width: 350,
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 0, 35, 0),
                                child: const Center(
                                  child: Text("Your ideal business is",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 65, 99, 200),
                                          fontSize: 16.0)), // <-- Text
                                ),
                              ),
                              IdealBusinessResult(resultfinal: resultfinal),

                              Container(
                                width: 350,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 0, 35, 5),
                                child: Center(
                                  child: Text(widget.ideal,
                                      // ideal ni user
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 65, 99, 200),
                                          fontSize: 21.0)), // <-- Text
                                ),
                              ),

                              Container(
                                width: 350,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 2, 35, 0),
                                child: const Center(
                                  child: Text("Business Type",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 45, 48),
                                          fontSize: 15.0)), // <-- Text
                                ),
                              ),

                              Container(
                                width: 350,
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 0, 35, 10),
                                child: const Center(
                                  child: Text("Coffee Shop",
                                      //BUDGET REQUIRED FOR THE AREA
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 45, 48),
                                          fontSize: 20.0)), // <-- Text
                                ),
                              ),

                              Container(
                                width: 350,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 2, 35, 0),
                                child: const Center(
                                  child: Text("Suggested business for you",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 45, 48),
                                          fontSize: 15.0)), // <-- Text
                                ),
                              ),

                              Container(
                                width: 350,
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(35, 0, 35, 5),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      // StatisForecasting(context);
                                      ChartForecasting(context);
                                    },
                                    child: Text(businessname,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 65, 99, 200),
                                            fontSize: 20.0)),
                                  ), // <-- Text
                                ),
                              ),
////////////////////////////////////////////////////////////////////////////////////////////////
                              ///
                              Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0.0,
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  primary: const Color.fromARGB(
                                                      255,
                                                      0,
                                                      110,
                                                      195), // background
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  minimumSize: const Size(
                                                      70, 40), //////// HERE
                                                ),
                                                onPressed: () async {
                                                  final image =
                                                      await screenshotController
                                                          .capture(
                                                              delay: const Duration(
                                                                  milliseconds:
                                                                      10),
                                                              pixelRatio: 1.5);

                                                  if (image == null) return;
                                                  await savingImage(image);
                                                },
                                                child: const Text(
                                                  "Download",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ))),
                                        //Spacer(),
                                        const SizedBox(
                                          width: 10.0,
                                        ),

                                        Expanded(
                                            child: TextButton(
                                          onPressed: () {
                                            int count = 0;
                                            Navigator.of(context)
                                                .popUntil((_) => count++ >= 2);
                                          },
                                          style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Expanded(
                                                  child: ElevatedButton.icon(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 0.0,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        primary: const Color
                                                                .fromARGB(
                                                            255,
                                                            0,
                                                            110,
                                                            195), // background
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),

                                                        minimumSize: const Size(
                                                            70,
                                                            40), //<-- SEE HERE
                                                        side: const BorderSide(
                                                          color: Color.fromARGB(
                                                              255, 0, 110, 195),
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: const Text('Done'),
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons
                                                            .file_download_outlined,
                                                        size: 18.0,
                                                      ),
                                                      label: Text(
                                                        "Download",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ))),
                                              //Spacer(),

                                              const SizedBox(
                                                width: 10.0,
                                              ),

                                              Expanded(
                                                  child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const PointsLineChart()));
                                                  //getMarkerData();
                                                  //   getBusinessData();
                                                },
                                                style: TextButton.styleFrom(
                                                  minimumSize: const Size(
                                                      70, 40), //<-- SEE HERE
                                                  side: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 0, 110, 195),
                                                    width: 3,
                                                  ),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ))
                                      ])),

                              // }
                            ] //body children
                                ) //column
                            ) //SingleChildScrollView
                        )));

            return const Center(
                child: CircularProgressIndicator
                    .adaptive()); //while loading the data

          } // if snapshot has connection
        } //snapshot
        );
  } // overide
} // class

class IdealBusinessResult extends StatelessWidget {
  const IdealBusinessResult({
    super.key,
    required this.resultfinal,
  });

  final String resultfinal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 5),
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
      width: 350,
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
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
      width: 350,
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
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
      width: 350,
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(35, 2, 35, 10),
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
    required this.data,
  });

  final Map<String, dynamic> data;

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
            child: Text(data['place'], //DATA FOR PLACE
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 44, 45, 48), fontSize: 18.0)),
          )
        ],
      ),
>>>>>>> Stashed changes
    );
  }
}
