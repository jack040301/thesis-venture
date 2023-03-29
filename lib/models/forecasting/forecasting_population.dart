import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/screens/home_page.dart';
/* import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart'; */
import 'dart:typed_data';
import 'dart:math';

import 'data_population.dart';

class BarchartPop extends StatelessWidget {
  final String markerid;
  const BarchartPop({super.key, required this.markerid});
  //const BarchartPop({super.key});
  //const BarchartPop({super.key});

  @override
  Widget build(BuildContext context) {
    //   String docuid = markerid;
    CollectionReference population =
        FirebaseFirestore.instance.collection("testmarkers");

    return FutureBuilder<DocumentSnapshot>(
      future: population.doc(markerid).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Retry");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> datafirebase =
              snapshot.data!.data() as Map<String, dynamic>;

          double pastPop = double.parse(datafirebase["popu_past"]);
          double presentPop = double.parse(datafirebase["popu_present"]);
          double futurePop = double.parse(datafirebase["popu_future"]);

          final List<BarChartModel> data = [
            BarChartModel(
              year: "2015",
              financial: pastPop,
              color: charts.ColorUtil.fromDartColor(
                  const Color.fromARGB(255, 32, 175, 246)),
            ),
            BarChartModel(
              year: "2020",
              financial: presentPop,
              color: charts.ColorUtil.fromDartColor(
                  const Color.fromARGB(255, 14, 122, 193)),
            ),
            BarChartModel(
              year: "2025",
              financial: futurePop,
              color: charts.ColorUtil.fromDartColor(
                  const Color.fromARGB(255, 29, 95, 154)),
            ),
          ];

          List<charts.Series<BarChartModel, String>> series = [
            charts.Series(
              id: "population",
              data: data,
              domainFn: (BarChartModel series, _) => series.year,
              measureFn: (BarChartModel series, _) => series.financial,
              colorFn: (BarChartModel series, _) => series.color,
              labelAccessorFn: (BarChartModel series, _) =>
                  series.financial.toString(),
            ),
          ];

          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 241, 242, 242),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Center(
                          child: Container(
                              height: 700,
                              padding: const EdgeInsets.all(5),
                              child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 20, 5, 10),
                                      child: Column(children: <Widget>[
                                        const Text("Bar Chart Forecast",
                                            style: TextStyle(fontSize: 19.0)),
                                        Expanded(
                                          child: charts.BarChart(
                                            series,
                                            animate: true,
                                            barRendererDecorator: charts
                                                .BarLabelDecorator<String>(),
                                            domainAxis:
                                                const charts.OrdinalAxisSpec(),
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'The graph shows the population data from 2015 to 2020 a slight increase (1.049%) in 5 years utilizing its growth percent we can assume the forecasted population by year 2025',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                height: 1.5,
                                                color: Color.fromARGB(
                                                    255, 54, 54, 54),
                                                fontSize: 15,
                                              ),
                                            )),
                                        Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 20),
                                            color: Colors.white,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Expanded(
                                                      child:
                                                          ElevatedButton.icon(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                elevation: 0.0,
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                primary: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    0,
                                                                    110,
                                                                    195), // background
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                minimumSize:
                                                                    const Size(
                                                                        70,
                                                                        40), //////// HERE
                                                              ),
                                                              onPressed: () {},
                                                              icon: const Icon(
                                                                Icons
                                                                    .file_download_outlined,
                                                                size: 18.0,
                                                              ),
                                                              label: const Text(
                                                                "Download",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ))),
                                                  //Spacer(),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Expanded(
                                                      child: TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const HomePage()),
                                                              (Route route) =>
                                                                  false);
                                                    },
                                                    style: TextButton.styleFrom(
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
                                                  ))
                                                ]))
                                      ])))))
                    ])),
              ));
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
