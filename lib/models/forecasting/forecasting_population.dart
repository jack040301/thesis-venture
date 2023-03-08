import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'data_population.dart';

class BarchartPop extends StatelessWidget {
 // final String markerid;
  //const BarchartPop({super.key, required this.markerid});
 const BarchartPop({super.key});
  @override
  Widget build(BuildContext context) {
 //   String docuid = markerid;
    CollectionReference population =
        FirebaseFirestore.instance.collection("testmarkers");

    return FutureBuilder<DocumentSnapshot>(
      future: population.doc("SZRH2HoNBjRGpY4RuaoD").get(),
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



            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: charts.BarChart(
                series,
                animate: true,
                barRendererDecorator: charts.BarLabelDecorator<String>(),
                domainAxis: const charts.OrdinalAxisSpec(),
              ),
            ),




          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
