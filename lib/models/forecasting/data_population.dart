import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String year;
  int financial;
  final charts.Color color;

  BarChartModel({
    required this.year,
    required this.financial,
    required this.color,
  });
}

class SalesData {
  double months;
  double sales;

  SalesData({
    required this.months,
    required this.sales,
  });
}

class BusinessLineGraph {
  int months;
  double cost;

  BusinessLineGraph({
    required this.months,
    required this.cost,
  });
}

class ChartData {
  ChartData({
    required this.months,
    required this.cost,
  });
  String months;
  double cost;
}
