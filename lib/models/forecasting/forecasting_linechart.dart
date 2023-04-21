import 'dart:io';
import 'dart:math';
// ignore: depend_on_referenced_packages
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/models/forecasting/forecasting_population.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:main_venture/userInfo.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

class SyncLineChart extends StatelessWidget {
  final String markerid, suggestedbusiness;

  SyncLineChart(
      {super.key, required this.markerid, required this.suggestedbusiness});

  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();
  late TooltipBehavior _tooltipBehavior;
  late TooltipBehavior _tooltip;
  late List<_ChartData> piedata;
  late GlobalKey<SfCartesianChartState> _cartesianChartKey;
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
      assumptItems = 0;

  double totalform2ndyear = 0, totalform3rdyear = 0;
  @override
  void initState() {
    _cartesianChartKey = GlobalKey();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _tooltip = TooltipBehavior(enable: true);
  }

  FirebaseFirestore database = FirebaseFirestore.instance;
  List<ChartData> dummyData1 = [];
  List<ChartData> dummyData2 = [];
  CollectionReference forebusiness =
      FirebaseFirestore.instance.collection("business");
  void _printScreen() {
    /*   Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();
      final image = await WidgetWraper.fromKey(
        key: _printKey,
        pixelRatio: 2.0,
      );
      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));
      return doc.save();
    }); */
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
        /* appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Forecasting Graphs"),
          //  title: Text(widget.ideal),
          foregroundColor: const Color.fromARGB(255, 44, 45, 48),
          elevation: 0.0,
          leading: const BackButton(
            color: Color.fromARGB(255, 44, 45, 48),
          ),
        ), */
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  FutureBuilder<DocumentSnapshot>(
                      future: forebusiness.doc(suggestedbusiness).get(),
                      builder: //(BuildContext context,
                          //   AsyncSnapshot<DocumentSnapshot> snapshot)
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Error");
                        } else if (snapshot.hasData) {
                          Map<String, dynamic> dataDoc =
                              snapshot.data!.data() as Map<String, dynamic>;
                          //monthly cost
                          marketcost = double.parse(dataDoc['marketing_cost']);
                          laborcost = double.parse(dataDoc['labor_cost']);
                          foodsup = double.parse(dataDoc['food_supply']);
                          utilLease = double.parse(dataDoc['lease_utilities']);
                          misc = double.parse(dataDoc['misc']);
                          assumptItems = double.parse(dataDoc['sales_per_day']);
                          monthlyResultCost = marketcost +
                              laborcost +
                              foodsup +
                              utilLease +
                              misc;
                          dailyyResultCost = (marketcost +
                                  laborcost +
                                  foodsup +
                                  utilLease +
                                  misc) /
                              30;
                          double pieLabor =
                              (laborcost / monthlyResultCost) * 100;
                          double pieFoodSup =
                              (foodsup / monthlyResultCost) * 100;
                          double pieUtilLease =
                              (utilLease / monthlyResultCost) * 100;
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
                          return RepaintBoundary(
                              key: _printKey,
                              child: Center(
                                  child: Container(
                                      height: 1100,
                                      padding: const EdgeInsets.all(5),
                                      child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 20, 5, 10),
                                              child: Column(children: <Widget>[
                                                const Text(
                                                    "Line Graph Forecast",
                                                    style: TextStyle(
                                                        fontSize: 19.0)),
                                                Expanded(
                                                    child: SfCartesianChart(
                                                        key: _cartesianChartKey,
                                                        legend: Legend(
                                                            isVisible: true),
                                                        tooltipBehavior:
                                                            _tooltipBehavior,
                                                        primaryXAxis:
                                                            CategoryAxis(),
                                                        series:
                                                            getData(context))),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(7.0),
                                                    child: Text(
                                                      "the graph shows the potential growth of the chose business starting with the first month "
                                                      "up to the last month of the year with the use of venture's Average algorithm and Parameters "
                                                      "The Blue line dot in the graph represents the One Time Cost in establishing the business"
                                                      "The Red line dot represents the daily revenue of the business"
                                                      // yung parameters siguro gray nalang to and mas maliit para maempasize na parang legend lang sya or meaning ganun
                                                      "Parameters includes the following "
                                                      "*Daily Cost (Man power, Supplies, Marketing Cost, Lease and Utilities and lastly Miscellaneous) "
                                                      "*One Time Cost (Stalls, Equipment and Permit) "
                                                      "*Assumed Sales (Sample Items and Sales per day) "
                                                      "*Daily Revenue (Assumed Sales - Daily Cost)"
                                                      // ito di normal text na ulit
                                                      "The First month as state in the graph shows a lower revenue unlike the following year"
                                                      "for the reason because the first month of the business there is a allocation of Marketing Cost for the advertisement"
                                                      "and promotion of business The intersection of the Red and Blue line in the Graph states the ROI (Return of investment) "
                                                      "that let you visualize the Timespan in which the the revenue will surpass the one time cost in simpler term the month in which you can get your investment back after "
                                                      // ito same gray ulit na maliit nalang
                                                      "*ROI (Return of Investment) Return on investment or return on costs is a Computation between net income and investment."
                                                      "The Early the ROI reach means the faster the investment can be back to the owner. As a performance measure, ROI is used to evaluate the efficiency of"
                                                      "an investment or to compare the efficiencies of several different investments",
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        height: 1.5,
                                                        color: Color.fromARGB(
                                                            255, 54, 54, 54),
                                                        fontSize: 15,
                                                      ),
                                                    )),
                                                //   iuncomment to para sa barchart
                                                /* const SizedBox(
                                                  height: 10.0,
                                                ),
                                                const Text("Bar Chart Forecast",
                                                    style: TextStyle(
                                                        fontSize: 19.0)), */
                                                /*  Expanded(
                                                    child: BarchartPop(
                                                  markerid: markerid,
                                                )), */
                                                /* const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'The graph shows the population data from 2015 to 2020 a slight increase (1.049%) in 5 years utilizing its growth percent we can assume the forecasted population by year 2025',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        height: 1.5,
                                                        color: Color.fromARGB(
                                                            255, 54, 54, 54),
                                                        fontSize: 15,
                                                      ),
                                                    )),
                                                const Text("Pie Chart Forecast",
                                                    style: TextStyle(
                                                        fontSize: 19.0)),
                                                Expanded(
                                                    child: SfCircularChart(
                                                        tooltipBehavior:
                                                            _tooltip,
                                                        series: <CircularSeries>[
                                                      DoughnutSeries<_ChartData,
                                                              String>(
                                                          dataSource: piedata,
                                                          xValueMapper:
                                                              (_ChartData data,
                                                                      _) =>
                                                                  data.x,
                                                          yValueMapper:
                                                              (_ChartData data,
                                                                      _) =>
                                                                  data.y,
                                                          dataLabelMapper:
                                                              (_ChartData data,
                                                                      _) =>
                                                                  data.x,
                                                          dataLabelSettings:
                                                              const DataLabelSettings(
                                                                  isVisible:
                                                                      true,
                                                                  labelPosition:
                                                                      ChartDataLabelPosition
                                                                          .outside,
                                                                  // Renders background rectangle and fills it with series color
                                                                  useSeriesColor:
                                                                      true),
                                                          // Explode the segments on tap
                                                          explode: true,
                                                          explodeIndex: 1)
                                                    ])), 
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'The graph shows the allocation of monthly cost into following categories such as Labor Cost, Food Supply, Utility/Lease and Miscellaneous excluding the one time cost',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        height: 1.5,
                                                        color: Color.fromARGB(
                                                            255, 54, 54, 54),
                                                        fontSize: 15,
                                                      ),
                                                    )),*/
                                                Container(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10, 5, 10, 20),
                                                    color: Colors.white,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          Expanded(
                                                              child: ElevatedButton
                                                                  .icon(
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        elevation:
                                                                            0.0,
                                                                        padding:
                                                                            const EdgeInsets.all(10.0),
                                                                        primary: const Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            110,
                                                                            195), // background
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0)),
                                                                        minimumSize: const Size(
                                                                            70,
                                                                            40), //////// HERE
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        _printScreen();
                                                                        _renderChartAsImage(
                                                                            context,
                                                                            _cartesianChartKey);
                                                                      },
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .file_download_outlined,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      label:
                                                                          const Text(
                                                                        "Download",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ))),
                                                          //Spacer(),
                                                          const SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Expanded(
                                                              child: TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pushAndRemoveUntil(
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const HomePage()),
                                                                  (Route route) =>
                                                                      false);
                                                            },
                                                            style: TextButton
                                                                .styleFrom(
                                                              minimumSize:
                                                                  const Size(70,
                                                                      40), //<-- SEE HERE
                                                              side:
                                                                  const BorderSide(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        110,
                                                                        195),
                                                                width: 3,
                                                              ),
                                                            ),
                                                            child: const Text(
                                                                'Done'),
                                                          ))
                                                        ]))
                                              ]))))));
                        }
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      })
                ]))));
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
    double secondyear = dummyData2[1].cost;
    double resultform = secondyear * 12;
    double firstyearRevenue = dummyData2[7].cost;

    totalform2ndyear = resultform + firstyearRevenue;
    totalform3rdyear = resultform + totalform2ndyear;

    final updateData = {
      "firstyear": firstyearRevenue,
      "secondyear": totalform2ndyear,
      "thirdyear": totalform3rdyear,
    };

    FirebaseFirestore.instance
        .collection('forecast')
        .doc("8gt1T3xZKOfRPZMgkscB")
        .set(updateData)
        .onError((e, _) => print("Error writing document: $e"));

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
  //PopSnackbar popSnackbar = PopSnackbar();
  // var a = details.dataPoints?.toList();
  // ScaffoldMessenger.of(context)
  // .showSnackBar(popSnackbar.popsnackbar(a.toString()));
}

Future<void> _renderChartAsImage(context, _cartesianChartKey) async {
  final ui.Image data =
      await _cartesianChartKey.currentState!.toImage(pixelRatio: 3.0);
  final ByteData? bytes = await data.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List imageBytes =
      bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

  final PdfBitmap bitmap = PdfBitmap(imageBytes);

  final PdfDocument document = PdfDocument();
  document.pageSettings.size =
      Size(bitmap.width.toDouble(), bitmap.height.toDouble());
  final PdfPage page = document.pages.add();
  final Size pageSize = page.getClientSize();
  page.graphics
      .drawImage(bitmap, Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
  final List<int> bits = document.saveSync();
  document.dispose();
  //Get external storage directory
  final Directory directory = await getApplicationSupportDirectory();
  //Get directory path
  final String path = directory.path;
  //Create an empty file to write PDF data
  File file = File('$path/Venture_Forecast-Breakeven.pdf');
  //Write PDF bytes data
  await file.writeAsBytes(bits, flush: true);
  //Open the PDF document in mobile
  OpenFile.open('$path/Venture_Forecast-Breakeven.pdf');

  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text('Processing...'),
  ));
}
