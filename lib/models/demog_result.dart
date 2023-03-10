import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'forecasting/forecasting_linechart.dart';
import 'package:main_venture/models/forecasting/forecasting_linechart.dart';
import 'forecasting/forecasting_population.dart';
import 'package:main_venture/userInfo.dart';

import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;

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
            // markerid: widget.marker,
            ),
      ),
    );
  }

  Future<void> ChartForecasting(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SyncLineChart(
                //         markerid: widget.budget,
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
          revstrA = data['revenue_standard'].toString();
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

    // pw.Document pdf = pw.Document();
    // pdf.addPage(
    //   pw.Page(
    //     pageFormat: PdfPageFormat.a4,
    //     build: (context) {
    //       return pw.Expanded(
    //         // change this line to this:
    //         child: pw.Image(pw.MemoryImage(result), fit: pw.BoxFit.contain),
    //       );
    //     },
    //   ),
    // );
    // File pdfFile = File('Your path + File name');
    // pdfFile.writeAsBytesSync(await pdf.save());
    ////////////////////////////////////

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(popSnackbar.popsnackbar("Sucessfully Downloaded Result"));
    return result['filepath'];
  }

  // Future getPdf(Uint8List image) async {
  //   pw.Document pdf = pw.Document();
  //   pdf.addPage(
  //     pw.Page(
  //       pageFormat: PdfPageFormat.a4,
  //       build: (context) {
  //         return pw.Expanded(
  //           // change this line to this:
  //           child: pw.Image(pw.MemoryImage(image), fit: pw.BoxFit.contain),
  //         );
  //       },
  //     ),
  //   );
  //   File pdfFile = File('Your path + File name');
  //   pdfFile.writeAsBytesSync(await pdf.save());
  // }

  @override
  Widget build(BuildContext context) {
    CollectionReference mark =
        FirebaseFirestore.instance.collection("testmarkers");
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
          /*  double landbudgetdblfinalA = landbudgetdblB - landbudgetdblB;
          double landbudgetdblfinalB = landbudgetdblB - landbudgetdblfinalA;
          double landbudgetdblfinalC =
              (landbudgetdblfinalB / landbudgetdblB) * 100; */
          double landbudgetdblfinalA = landbudgetdblB - landbudgetdblA; //2600
          double landbudgetdblfinalB =
              landbudgetdblA - landbudgetdblfinalA; // 2800
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
                              padding: const EdgeInsets.fromLTRB(35, 2, 35, 2),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Population", //POPULATION
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            DemogPopulation(popstrB: popstrB),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 2, 35, 0),
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                    "Revenue per year", //REVENUE PER YEAR
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                              color: Colors.white,
                              child: Center(
                                child: Text(revstrB, //REVENUE PER YEAR
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 20.0)), // <-- Text
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 2, 35, 0),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Land per SqM", //LAND PER SQ
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            LandPerSQM(landstr: landstr),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 2, 35, 0),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Budget required for the area",
                                    //BUDGET REQUIRED FOR THE AREA
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            BudgetRequiredArea(landbudgetstrB: landbudgetstrB),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                    "The Feasibilty (%) of your ideal business is",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 65, 99, 200),
                                        fontSize: 16.0)), // <-- Text
                              ),
                            ),
                            IdealBusinessResult(resultfinal: resultfinal),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 5),
                              color: Colors.white,
                              child: Center(
                                child: Text("ideal",
                                    // ideal ni user
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 21.0)), // <-- Text
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 2, 35, 0),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Business Type",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Coffee Shop",
                                    //BUDGET REQUIRED FOR THE AREA
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 20.0)), // <-- Text
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 2, 35, 0),
                              color: Colors.white,
                              child: const Center(
                                child: Text("Suggested business for you",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 15.0)), // <-- Text
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 5),
                              color: Colors.white,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    // StatisForecasting(context);
                                    ChartForecasting(context);
                                  },
                                  child: Text(businessname,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 65, 99, 200),
                                          fontSize: 20.0)),
                                ), // <-- Text
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                          child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0.0,
                                                padding:
                                                    const EdgeInsets.all(10.0),
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
                                                            delay:
                                                                const Duration(
                                                                    milliseconds:
                                                                        10),
                                                            pixelRatio: 1.5);

                                                if (image == null) return;
                                                await savingImage(image);
                                                /////////////////////////////////////////////
                                                // await getPdf(image);
                                                int count = 0;
                                                Navigator.of(context).popUntil(
                                                    (_) => count++ >= 2);
                                              },
                                              icon: Icon(
                                                Icons.file_download_outlined,
                                                size: 18.0,
                                              ),
                                              label: Text(
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SyncLineChart()));
                                          //getMarkerData();
                                          //   getBusinessData();
                                        },
                                        style: TextButton.styleFrom(
                                          minimumSize:
                                              const Size(70, 40), //<-- SEE HERE
                                          side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 0, 110, 195),
                                            width: 3,
                                          ),
                                        ),
                                        child: const Text('Done'),
                                      ))
                                    ]))
                          ])))));
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
    );
  }
}
