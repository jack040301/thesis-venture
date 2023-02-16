import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'data_population.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncLineChart extends StatelessWidget {
  SyncLineChart({super.key});

  late TooltipBehavior _tooltipBehavior;
  double landbudgetdblB = 0;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  final List<BusinessLineGraph> loadedList = [];
  FirebaseFirestore database = FirebaseFirestore.instance;
  List<ChartData> dummyData1 = [];
  List<ChartData> dummyData2 = [];

  @override
  Widget build(BuildContext context) {
    initState();
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
                    Expanded(
                        child: SfCartesianChart(
                            legend: Legend(isVisible: true),
                            title: ChartTitle(text: "Line Graph Forecasting"),
                            tooltipBehavior: _tooltipBehavior,
                            primaryXAxis: CategoryAxis(),
                            series: LINE))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  List<ChartSeries<dynamic, dynamic>> get LINE {
    database
        .collection("business")
        .doc("Coffee Shop")
        .get()
        .then((DocumentSnapshot snapshot) {
      var dataDoc = snapshot.data() as Map;
      landbudgetdblB = double.parse(dataDoc['marketing_cost']);

      dummyData1 = List.generate(
          12,
          (index) => ChartData(
              DateFormat('MMM').format(DateTime(0, index + 1)).toString(),
              landbudgetdblB));
      dummyData2 = List.generate(
          12,
          (index) => ChartData(
              DateFormat('MMM').format(DateTime(0, index + 1)).toString(),
              index * landbudgetdblB * Random().nextDouble()));
    });

    return <ChartSeries>[
      // Initialize line series
      LineSeries<ChartData, String>(
        enableTooltip: true,
        dataSource:
            dummyData1 /* [
          // Bind data source
          ChartData('Jan', 35),
          ChartData('Feb', 28),
          ChartData('Mar', 34),
          ChartData('Apr', 32),
          ChartData('May', 40)
        ] */
        ,
        markerSettings: const MarkerSettings(isVisible: true),
        xValueMapper: (ChartData data, _) => data.months,
        yValueMapper: (ChartData data, _) => data.cost,
      ),
      LineSeries<ChartData, String>(
        enableTooltip: true,
        dataSource:
            dummyData2 /* [
          // Bind data source
          ChartData('Jan', 35),
          ChartData('Feb', 28),
          ChartData('Mar', 34),
          ChartData('Apr', 32),
          ChartData('May', 40)
        ] */
        ,
        markerSettings: const MarkerSettings(isVisible: true),
        xValueMapper: (ChartData data, _) => data.months,
        yValueMapper: (ChartData data, _) => data.cost,
      )
    ];
  }
}
/*   List<ChartSeries<dynamic, dynamic>> get LineGraphFore {
    database
        .collection("business")
        .doc("Coffee Shop")
        .get()
        .then((DocumentSnapshot snapshot) async {
      var dataDoc = snapshot.data() as Map;

      double landbudgetdblB = double.parse(dataDoc['marketing_cost']);
      dummyData1 = List.generate(
          12,
          (index) => ChartData(
              months: DateFormat('M').parse(index.toString()).toString(),
              cost: landbudgetdblB));

      dummyData2 = List.generate(
          12,
          (index) => ChartData(
              months: DateFormat('M').parse(index.toString()).toString(),
              cost: index * landbudgetdblB));
    });

    return <ChartSeries>[
      LineSeries<ChartData, String>(
          dataSource: dummyData1,
          xValueMapper: (ChartData data, _) => data.months,
          yValueMapper: (ChartData data, _) => data.cost),
      LineSeries<ChartData, String>(
          dataSource: dummyData2,
          xValueMapper: (ChartData data, _) => data.months,
          yValueMapper: (ChartData data, _) => data.cost),
    ];
  }
} */
