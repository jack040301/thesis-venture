import 'dart:ui';

import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String year;
  double financial;
  final Color color;

  BarChartModel({
    required this.year,
    required this.financial,
    required this.color,
  });
}

<<<<<<< Updated upstream
class BarDataThreeYears {
  String year;
  double revenue;
  final Color color;

  BarDataThreeYears({
    required this.year,
    required this.revenue,
    required this.color,
  });
}

=======
>>>>>>> Stashed changes
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
