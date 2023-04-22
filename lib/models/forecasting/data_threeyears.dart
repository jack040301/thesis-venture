import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
/* import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart'; */
import 'dart:typed_data';
import 'dart:math';

import 'data_population.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:ui' as ui;
import 'dart:io';

class BarThreeYears extends StatelessWidget {
  BarThreeYears({super.key});
  //const BarThreeYears({super.key});
  //const BarThreeYears({super.key});
  late GlobalKey<SfCartesianChartState> _cartesianChartKey;
  void initState() {
    _cartesianChartKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    //   String docuid = markerid;
    initState();
    CollectionReference population =
    FirebaseFirestore.instance.collection("forecast");

    return FutureBuilder<DocumentSnapshot>(
      future: population.doc("8gt1T3xZKOfRPZMgkscB").get(),
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

          double pastPop = datafirebase["firstyear"];
          double presentPop = datafirebase["secondyear"];

          double futurePop = datafirebase["thirdyear"];

          final List<BarDataThreeYears> data = [
            BarDataThreeYears(
              year: "1st Year",
              revenue: pastPop,
              color: const Color.fromARGB(255, 76, 72, 72),
            ),
            BarDataThreeYears(
              year: "2nd Year",
              revenue: presentPop,
              color: const Color.fromARGB(255, 228, 228, 228),
            ),
            BarDataThreeYears(
              year: "3rd Year",
              revenue: futurePop,
              color: const Color.fromARGB(255, 37, 33, 33),
            ),
          ];

          /*   List<charts.Series<BarDataThreeYears, String>> series = [
            charts.Series(
              id: "Revenue",
              data: data,
              domainFn: (BarDataThreeYears series, _) => series.year,
              measureFn: (BarDataThreeYears series, _) => series.revenue,
              colorFn: (BarDataThreeYears series, _) => series.color,
              labelAccessorFn: (BarDataThreeYears series, _) =>
                  series.revenue.toString(),
            ),
          ]; */

          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 241, 242, 242),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Container(
                                  height: 1000,
                                  padding: const EdgeInsets.all(5),
                                  child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 20, 5, 10),
                                          child: Column(children: <Widget>[
                                            const Text("Forecasted Growth Revenue (3 Years)",
                                                style: TextStyle(fontSize: 19.0)),
                                            Expanded(
                                                child: SfCartesianChart(
                                                    key: _cartesianChartKey,
                                                    primaryXAxis: CategoryAxis(),
                                                    series: <ChartSeries<
                                                        BarDataThreeYears, String>>[
                                                      // Renders column chart

                                                      ColumnSeries<BarDataThreeYears,
                                                          String>(
                                                        dataSource: data,
                                                        xValueMapper:
                                                            (BarDataThreeYears data,
                                                            _) =>
                                                        data.year,
                                                        yValueMapper:
                                                            (BarDataThreeYears data,
                                                            _) =>
                                                            data.revenue.toDouble(),
                                                        pointColorMapper:
                                                            (BarDataThreeYears data,
                                                            _) =>
                                                        data.color,
                                                        dataLabelSettings:
                                                        const DataLabelSettings(
                                                            isVisible: true),
                                                      )
                                                    ])
                                              /*    charts.BarChart(
                                            series,
                                            animate: true,
                                            barRendererDecorator: charts
                                                .BarLabelDecorator<String>(),
                                            domainAxis:
                                                const charts.OrdinalAxisSpec(),
                                          ), */
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "The graph shows the potential growth of the chose business from its first three years with the use of venture's Average algorithm and Parameters "
                                                      "as shown in the graph the first year of the business displays a typical low revenue it is because the first year of the business is where the"
                                                      "invested money is being subtracted from the initial annual revenue as a result it has a lower income but the following years as forecasted"
                                                      "with different parameters (excluding the marketing cost and one time cost) as an outcome it has a bigger revenue and at the end of the 3 years forecast"
                                                      "we can interpret that the investment fund is not just returned but also matured and as the business progress we can conclude that the chosen business"
                                                      "is feasible and worth to ventured on \n\n"
                                                      "*Revenue may varies depending on the market factors like inflation",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    height: 1.5,
                                                    color: Color.fromARGB(
                                                        255, 54, 54, 54),
                                                    fontSize: 15,
                                                  ),
                                                )),
                                            Container(
                                                padding: const EdgeInsets.fromLTRB(
                                                    10, 5, 10, 20),
                                                color: Colors.white,
                                                child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: <Widget>[
                                                      Expanded(
                                                          child:
                                                          ElevatedButton.icon(
                                                              style:
                                                              ElevatedButton
                                                                  .styleFrom(
                                                                elevation: 0.0,
                                                                padding:
                                                                const EdgeInsets
                                                                    .all(
                                                                    10.0),
                                                                primary: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    0,
                                                                    110,
                                                                    195), // background
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        5.0)),
                                                                minimumSize:
                                                                const Size(
                                                                    70,
                                                                    40), //////// HERE
                                                              ),
                                                              onPressed: () {
                                                                _renderChartAsImage(
                                                                    context,
                                                                    _cartesianChartKey);
                                                              },
                                                              icon: const Icon(
                                                                Icons
                                                                    .file_download_outlined,
                                                                size: 18.0,
                                                              ),
                                                              label: const Text(
                                                                "Download",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ))),
                                                      //Spacer(),
                                                      const SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Expanded(
                                                          child: TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context)
                                                                  .pushAndRemoveUntil(
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                      const HomePage()),
                                                                      (Route route) =>
                                                                  false);
                                                            },
                                                            style: TextButton.styleFrom(
                                                              minimumSize: const Size(
                                                                  70,
                                                                  40), //<-- SEE HERE
                                                              side: const BorderSide(
                                                                color: Color.fromARGB(
                                                                    255, 0, 110, 195),
                                                                width: 3,
                                                              ),
                                                            ),
                                                            child: const Text('Done'),
                                                          ))
                                                    ]))
                                          ])))))
                        ])),
              ));
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
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
  page.graphics.drawString("Forecasted Growth Revenue (3 Years)",
    PdfStandardFont(PdfFontFamily.helvetica, 40, style: PdfFontStyle.bold),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    bounds: const Rect.fromLTWH(0, 10, 950, 2000),
    format: PdfStringFormat(alignment: PdfTextAlignment.center),
  );
  page.graphics
      .drawImage(bitmap, Rect.fromLTWH(-12, 80, 930, 490));
  page.graphics.drawString(

    "The graph shows the potential growth of the chose business from its first three years with "
        "the use of venture's Average algorithm and Parameters as shown in the graph the first year "
        "of the business displays a typical low revenue it is because the first year of the business "
        "is where the invested money is being subtracted from the initial annual revenue as a result it"
        " has a lower income but the following years as forecasted with different parameters (excluding "
        "the marketing cost and one time cost) as an outcome it has a bigger revenue and at the end of "
        "the 3 years forecast we can interpret that the investment fund is not just returned but also "
        "matured and as the business progress we can conclude that the chosen business is feasible and "
        "worth to ventured on\n\n"
        "*Revenue may varies depending on the market factors like inflation",
    PdfStandardFont(PdfFontFamily.helvetica, 20),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    bounds: const Rect.fromLTWH(0, 580, 850, 2000),
    format: PdfStringFormat(alignment: PdfTextAlignment.justify),
  );
  final List<int> bits = document.saveSync();
  document.dispose();
  //Get external storage directory
  final Directory directory = await getApplicationSupportDirectory();
  //Get directory path
  final String path = directory.path;
  //Create an empty file to write PDF data
  File file = File('$path/Venture_Forecast-PieChart.pdf');
  //Write PDF bytes data
  await file.writeAsBytes(bits, flush: true);
  //Open the PDF document in mobile
  OpenFile.open('$path/Venture_Forecast-PieChart.pdf');

  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //behavior: SnackBarBehavior.floating,
    content: Text('Processing...'),
  ));
}
