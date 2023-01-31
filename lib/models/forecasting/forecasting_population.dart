import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'data_population.dart';

class BarchartPop extends StatelessWidget {
  final String markerid;
  const BarchartPop({super.key, required this.markerid});

  @override
  Widget build(BuildContext context) {
    String docuid = markerid;
    CollectionReference population =
        FirebaseFirestore.instance.collection("markers");

    return FutureBuilder<DocumentSnapshot>(
      future: population.doc(docuid).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("ERror");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Retry");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> datafirebase =
              snapshot.data!.data() as Map<String, dynamic>;

          int pastPop = int.parse(datafirebase["popu_past"]);
          int presentPop = int.parse(datafirebase["popu_present"]);
          int futurePop = int.parse(datafirebase["popu_future"]);

          final List<BarChartModel> data = [
            BarChartModel(
              year: "2015",
              financial: pastPop,
              color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
            ),
            BarChartModel(
              year: "2020",
              financial: presentPop,
              color: charts.ColorUtil.fromDartColor(Colors.red),
            ),
            BarChartModel(
              year: "2025",
              financial: futurePop,
              color: charts.ColorUtil.fromDartColor(Colors.green),
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
            appBar: AppBar(
              title: const Text("Population"),
              centerTitle: true,
              backgroundColor: Colors.green[700],
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: charts.BarChart(
                series,
                animate: true,
                barRendererDecorator: charts.BarLabelDecorator<String>(),
                domainAxis: const charts.OrdinalAxisSpec(),
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
           ],
          ),
            )),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
