/* import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/userInfo.dart';
import 'data_population.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncLineChart extends StatelessWidget {
  SyncLineChart({super.key});

  late TooltipBehavior _tooltipBehavior;
  double marketcost = 0,
      laborcost = 0,
      foodsup = 0,
      utilLease = 0,
      misc = 0,
      dailyResultCost = 0,
      monthlyResultCost = 0,
      stall = 0,
      equipment = 0,
      permit = 0,
      oneTimeCostResult = 0,
      assumptItems = 3500;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  final List<BusinessLineGraph> loadedList = [];
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
          title: const Text('Line Chart Example'),
          centerTitle: true,
        ),
        body: FutureBuilder<DocumentSnapshot>(
            future: forebusiness.doc("Coffee Shop").get(),
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
                    (marketcost + laborcost + foodsup + utilLease + misc) / 30;
                dailyResultCost =
                    (marketcost + laborcost + foodsup + utilLease + misc) / 30;

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
                                    series: getData(context)))
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
        (assumptItems - oneTimeCostResult) * 30; //formula of the first month
    double secondmonth = firstmonth + marketcost; //formula

    dummyData1 = List.generate(
        12,
        (index) => ChartData(
            months: DateFormat('MMM').format(DateTime(0, index + 1)).toString(),
            cost: oneTimeCostResult));
    dummyData2 = List.generate(
        12,
        (index) => ChartData(
            months: DateFormat('MMM').format(DateTime(0, index + 1)).toString(),
            cost: index * oneTimeCostResult));
    dummyData2[0] =
        ChartData(months: "Jan", cost: firstmonth); //plot the first month value
    dummyData2[1] = ChartData(
        months: "Feb", cost: secondmonth); //plot the first month value

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

/*   List<ChartSeries<dynamic, dynamic>> get LINE {
    double firstmonth = (assumptItems - oneTimeCostResult) * 30;
    double secondmonth = firstmonth * 30;

    dummyData1 = List.generate(
        12,
        (index) => ChartData(
            months: DateFormat('MMM').format(DateTime(0, index + 1)).toString(),
            cost: oneTimeCostResult));
    dummyData2 = List.generate(
        12,
        (index) => ChartData(
            months: DateFormat('MMM').format(DateTime(0, index + 1)).toString(),
            cost: index * oneTimeCostResult * Random().nextDouble()));
    dummyData2[0] = ChartData(months: "Jan", cost: firstmonth);

    //second month

    return <ChartSeries>[
      // Initialize line series
      LineSeries<ChartData, String>(
        legendItemText: 'One Time Series',
        xAxisName: 'Months',
        yAxisName: 'Cost',
        name: 'One Time Series',
        onPointLongPress: (ChartPointDetails details) {
          showSnack(context);
        },
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
 */
}

Future showSnack(context, ChartPointDetails details) async {
  PopSnackbar popSnackbar = PopSnackbar();

  var a = details.dataPoints?.toList();
  ScaffoldMessenger.of(context)
      .showSnackBar(popSnackbar.popsnackbar(a.toString()));
}
 */