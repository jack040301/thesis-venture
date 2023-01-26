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

   int months;
   int sales;

  SalesData({required this.months, required this.sales,

  });


}