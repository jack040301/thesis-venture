import 'package:flutter/material.dart';
import 'data_population.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:main_venture/models/demog_result.dart';

class PointsLineChart extends StatelessWidget {
  const PointsLineChart({super.key});

  // Defining the data

  // ignore: non_constant_identifier_names
  List<charts.Series<SalesData, int>> _LineSeries() {
    final data = [
      SalesData(months: 0, sales: 10),
      SalesData(months: 1, sales: 50),
      SalesData(months: 2, sales: 300),
      SalesData(months: 3, sales: 150),
    ];

    var anotherdata = [
      SalesData(months: 0, sales: 15),
      SalesData(months: 1, sales: 75),
      SalesData(months: 2, sales: 300),
      SalesData(months: 3, sales: 225),
    ];

    return [
      charts.Series(
          id: "Sales",
          data: data,
          domainFn: (SalesData series, _) => series.months,
          measureFn: (SalesData series, _) => series.sales,
          colorFn: (SalesData series, _) =>
              charts.MaterialPalette.blue.shadeDefault),
      charts.Series(
          id: "Sales",
          data: anotherdata,
          domainFn: (SalesData series, _) => series.months,
          measureFn: (SalesData series, _) => series.sales,
          colorFn: (SalesData series, _) =>
              charts.MaterialPalette.green.shadeDefault),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
    appBar: AppBar(
    backgroundColor: Colors.transparent,

    title: const Text("Forecasting Graphs"),
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

      Container(
        width: 350,
        height: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(32, 5, 32, 2),
            child: Card(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      "Sales",
                      style: TextStyle(
                          fontSize: 23.0)),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: charts.LineChart(
                        _LineSeries(),
                        animate: true,
                        defaultRenderer:
                            charts.LineRendererConfig(includePoints: true),
                      ),
                    ),

                  ],
                ),
              ),
            ),
        Container(
            width: 450,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.fromLTRB(18, 4, 18, 5),
            child: const Center(
              child: Text(
                'The graph shows that lorem ipsum dolor sit amet.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  height: 1.5,
                  color: Color.fromARGB(255, 54, 54, 54),
                  fontSize: 14.5,
                ),
              ),
            ),
        ),
    ]))));

  }
}
