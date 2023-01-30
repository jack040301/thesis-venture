import 'package:flutter/material.dart';
import 'data_population.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
        appBar: AppBar(
          title: const Text('Line Chart Example'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: 550,
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Sales",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: charts.LineChart(
                        _LineSeries(),
                        animate: true,
                        defaultRenderer:
                            charts.LineRendererConfig(includePoints: true),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
