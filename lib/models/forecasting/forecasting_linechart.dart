import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/userInfo.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


import 'package:main_venture/models/demog_result.dart';

class PointsLineChart extends StatelessWidget {
  const PointsLineChart({super.key});

  final String business;
  late TooltipBehavior _tooltipBehavior;
  late TooltipBehavior _tooltip;
  late List<_ChartData> piedata;

  double marketcost = 0,
      laborcost = 0,
      foodsup = 0,
      utilLease = 0,
      misc = 0,
      monthlyResultCost = 0,
      dailyyResultCost = 0,
      stall = 0,
      equipment = 0,
      permit = 0,
      oneTimeCostResult = 0,
      assumptItems = 3500;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _tooltip = TooltipBehavior(enable: true);
  }

  FirebaseFirestore database = FirebaseFirestore.instance;
  List<ChartData> dummyData1 = [];
  List<ChartData> dummyData2 = [];

  CollectionReference forebusiness =
      FirebaseFirestore.instance.collection("business");

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(

        appBar: AppBar(
          title: const Text('Forecasting Line Chart'),
          centerTitle: true,
        ),
        body: FutureBuilder<DocumentSnapshot>(
            future: forebusiness.doc(business).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Error");
              }
              if (snapshot.hasData) {
                Map<String, dynamic> dataDoc =
                    snapshot.data!.data() as Map<String, dynamic>;
                //monthly cost
                marketcost = double.parse(dataDoc['marketing_cost']);
                laborcost = double.parse(dataDoc['labor_cost']);
                foodsup = double.parse(dataDoc['food_supply']);
                utilLease = double.parse(dataDoc['lease_utilities']);
                misc = double.parse(dataDoc['misc']);

                monthlyResultCost =
                    marketcost + laborcost + foodsup + utilLease + misc;

                dailyyResultCost =
                    (marketcost + laborcost + foodsup + utilLease + misc) / 30;

                double pieLabor = (laborcost / monthlyResultCost) * 100;

                double pieFoodSup = (foodsup / monthlyResultCost) * 100;
                double pieUtilLease = (utilLease / monthlyResultCost) * 100;
                double pieMisc = (misc / monthlyResultCost) * 100;

                piedata = [
                  _ChartData('Labor Cost', pieLabor),
                  _ChartData('Food Supply', pieFoodSup),
                  _ChartData('Utility Lease', pieUtilLease),
                  _ChartData('Miscellaneous', pieMisc)
                ];

                //one time cost
                permit = double.parse(dataDoc['permit']);
                equipment = double.parse(dataDoc['equipment']);
                stall = double.parse(dataDoc["stall"]);

                oneTimeCostResult = permit + equipment + stall;
                return Center(
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
                                    title: ChartTitle(
                                        text: "Line Graph Forecasting"),
                                    tooltipBehavior: _tooltipBehavior,
                                    primaryXAxis: CategoryAxis(),
                                    series: getData(context))),
                            Expanded(
                                child: SfCircularChart(
                                    tooltipBehavior: _tooltip,
                                    series: <CircularSeries>[
                                  DoughnutSeries<_ChartData, String>(
                                      dataSource: piedata,
                                      xValueMapper: (_ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (_ChartData data, _) =>
                                          data.y,
                                      dataLabelMapper: (_ChartData data, _) =>
                                          data.x,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: true),
                                      // Explode the segments on tap
                                      explode: true,
                                      explodeIndex: 1)
                                ]))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator.adaptive());
            }));
  }

  List<ChartSeries<dynamic, dynamic>> getData(context) {
    Future.delayed(const Duration(seconds: 2));
    double firstmonth =
        (assumptItems - dailyyResultCost) * 30; //formula of the first month
    double secondmonth = firstmonth + marketcost;
    double sec = secondmonth; //formula of the second month
    double secondfinal = firstmonth + secondmonth;

    dummyData1 = List.generate(
        12,
        (index) => ChartData(
            months: DateFormat('MMM').format(DateTime(0, index + 1)).toString(),
            cost: oneTimeCostResult));
    dummyData2 = List.generate(
        12,
        (index) => ChartData(
            months: DateFormat('MMM').format(DateTime(1, index + 1)).toString(),
            cost: (sec * index) + firstmonth));
    dummyData2[0] = ChartData(months: "Jan", cost: firstmonth);

    //plot the first month value
    //  dummyData2[1] = ChartData(months: "Feb", cost: secondmonth); //plot the first month value

    return <ChartSeries>[
      // Initialize line series
      LineSeries<ChartData, String>(
        legendItemText: 'One Time Series',
        xAxisName: 'Months',
        yAxisName: 'Cost',
        name: 'One Time Series',
        /*      onPointTap: (pointInteractionDetails) {
          showSnack(context, pointInteractionDetails);
        }, */
        enableTooltip: true,
        dataSource: dummyData1,
        markerSettings: const MarkerSettings(isVisible: true),
        xValueMapper: (ChartData data, _) => data.months,
        yValueMapper: (ChartData data, _) => data.cost,
      ),
      LineSeries<ChartData, String>(
        legendItemText: 'Predictive Series',
        name: 'Predictive Series',
        xAxisName: 'Months',
        yAxisName: 'Cost',
        enableTooltip: true,
        dataSource: dummyData2,
        markerSettings: const MarkerSettings(isVisible: true),
        xValueMapper: (ChartData data, _) => data.months,
        yValueMapper: (ChartData data, _) => data.cost,
      )
    ];

  }
}

class ChartData {
  ChartData({
    required this.months,
    required this.cost,
  });
  String months;
  double cost;
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}

Future showSnack(context, ChartPointDetails details) async {
  PopSnackbar popSnackbar = PopSnackbar();

  var a = details.dataPoints?.toList();
  ScaffoldMessenger.of(context)
      .showSnackBar(popSnackbar.popsnackbar(a.toString()));
}
