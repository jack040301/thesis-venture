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
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: const Text('Revenue Forecast'),
                  foregroundColor: const Color.fromARGB(255, 44, 45, 48),
                  elevation: 0.0,
                  leading: const BackButton(
                    color: Color.fromARGB(255, 44, 45, 48),
                  )),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Center(
                          child: Container(
                              height: 700,
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
                                        const Text("Revenue Forecast",
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
                                              'The graph shows the revenue forecast for 3 years',
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
  page.graphics
      .drawImage(bitmap, Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
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
    content: Text('Processing...'),
  ));
}
