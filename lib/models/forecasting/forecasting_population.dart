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

class BarchartPop extends StatelessWidget {
  final String markerid;
  BarchartPop({super.key, required this.markerid});
  //const BarchartPop({super.key});
  //const BarchartPop({super.key});

  late GlobalKey<SfCartesianChartState> _cartesianChartKey;

  @override
  void initState() {
    _cartesianChartKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    //   String docuid = markerid;
    initState();
    CollectionReference population =
        FirebaseFirestore.instance.collection("markers");

    return FutureBuilder<DocumentSnapshot>(
      future: population.doc(markerid).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          //  debugPrint(snapshot.data);

          return const Text("Retry");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> datafirebase =
              snapshot.data!.data() as Map<String, dynamic>;

          double pastPop = double.parse(datafirebase["popu_past"]);
          double presentPop = double.parse(datafirebase["popu_present"]);
          double futurePop = double.parse(datafirebase["popu_future"]);

          final List<BarChartModel> data = [
            BarChartModel(
              year: "2015",
              financial: pastPop,
              color: const Color.fromARGB(255, 32, 175, 246),
            ),
            BarChartModel(
              year: "2020",
              financial: presentPop,
              color: const Color.fromARGB(255, 14, 122, 193),
            ),
            BarChartModel(
              year: "2025",
              financial: futurePop,
              color: const Color.fromARGB(255, 29, 95, 154),
            ),
          ];

          /*  List<charts.Series<BarChartModel, String>> series = [
            charts.Series(
              id: "population",
              data: data,
              domainFn: (BarChartModel series, _) => series.year,
              measureFn: (BarChartModel series, _) => series.financial,
              colorFn: (BarChartModel series, _) => series.color,
              labelAccessorFn: (BarChartModel series, _) =>
                  series.financial.toString(),
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
                              height: 780,
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
                                        const Text("Population Graph",
                                            style: TextStyle(fontSize: 19.0)),
                                        Expanded(
                                            child: SfCartesianChart(
                                                key: _cartesianChartKey,
                                                primaryXAxis: CategoryAxis(),
                                                series: <ChartSeries<
                                                    BarChartModel, String>>[
                                              // Renders column chart

                                              ColumnSeries<BarChartModel,
                                                  String>(
                                                dataSource: data,
                                                xValueMapper:
                                                    (BarChartModel data, _) =>
                                                        data.year,
                                                yValueMapper:
                                                    (BarChartModel data, _) =>
                                                        data.financial
                                                            .toDouble(),
                                                pointColorMapper:
                                                    (BarChartModel data, _) =>
                                                        data.color,
                                                dataLabelSettings:
                                                    const DataLabelSettings(
                                                        isVisible: true),
                                              )
                                            ])
                                            /* charts.BarChart(
                                            series,
                                            animate: true,
                                            barRendererDecorator: charts
                                                .BarLabelDecorator<String>(),
                                            domainAxis:
                                                const charts.OrdinalAxisSpec(),
                                          ), */
                                            ),

                                        const Padding(
                                            padding: EdgeInsets.all(7.0),
                                            child: Text(
                                              "The graph shows the population data from 2015 to 2020 a slight increase (1.049%) in 5 years utilizing its growth percent we can assume the forecasted population by year 2025."
                                              " The data interprets that if the business is establish in this specific place we can take advantage the population increase in the following years in which most of the entrepreneurs considered of before investing."
                                              " The higher the population of a specific place can be a huge aspect in the field of business.",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                // decoration: TextDecoration.underline,
                                                height: 1.5,
                                                color: Color.fromARGB(
                                                    255, 54, 54, 54),
                                                fontSize: 15,
                                              ),
                                            )),
                                        Container(
                                            padding: EdgeInsets.all(2.0),
                                            color: Colors.white,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Center(
                                                    child: Text(
                                                        "The population data comes from the PSA",
                                                        //  " The data interprets that if the business is establish in this specific place we can take advantage the population increase in the following years in which most of the entrepreneurs considered of before investing."
                                                        //" The higher the population of a specific place can be a huge aspect in the field of business.",
                                                        style: TextStyle(
                                                            //height: 1.5,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    54,
                                                                    54,
                                                                    54),
                                                            fontSize:
                                                                15.0)), // <-- Text
                                                  ),
                                                  Center(
                                                    child: Tooltip(
                                                      textStyle: TextStyle(
                                                          color: Colors.white),
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey),
                                                      message:
                                                          " PSA (Philippine Statistic Authority)"
                                                          " The PSA shall primarily be responsible for the implementation of the objectives and provisions of R.A. 10625, R.A. 11055, and R.A. 11315."
                                                          " It shall plan, develop, prescribe, disseminate, and enforce policies, rules and regulations, and coordinate government-wide programs governing the production of official statistics, general purpose statistics, civil registration services and inclusive identification system."
                                                          " It shall primarily be responsible for all national censuses and surveys, sectoral statistics, community-based statistics, consolidation of selected administrative recording systems, and compilation of national accounts.",
                                                      triggerMode:
                                                          TooltipTriggerMode
                                                              .tap, // ensures the label appears when tapped
                                                      preferBelow:
                                                          false, // use this if you want the label above the widget
                                                      child: Icon(
                                                        Icons.info_outline,
                                                        size: 15,
                                                        color: Color.fromARGB(
                                                            255, 65, 99, 200),
                                                      ), // <-- Text
                                                    ),
                                                  )
                                                ])),

                                        // const Padding(
                                        //     padding: EdgeInsets.all(8.0),
                                        //     child: Text(
                                        //       "The graph shows the population data from 2015 to 2020 a slight increase (1.049%) in 5 years utilizing its growth percent we can assume the forecasted population by year 2025."
                                        //       " The data interprets that if the business is establish in this specific place we can take advantage the population increase in the following years in which most of the entrepreneurs considered of before investing."
                                        //       " The higher the population of a specific place can be a huge aspect in the field of business."
                                        //       // naka gray din ito and maliit lanf din then kapag clinick nya yung (1) may info nalang katulad sa demog result then itong mga nasa baba nakalagay
                                        //       " * The population data comes from the PSA (1)"
                                        //
                                        //
                                        //
                                        //       " PSA (Philippine Statistic Authority)"
                                        //       " The PSA shall primarily be responsible for the implementation of the objectives and provisions of R.A. 10625, R.A. 11055, and R.A. 11315."
                                        //       " It shall plan, develop, prescribe, disseminate, and enforce policies, rules and regulations, and coordinate government-wide programs governing the production of official statistics, general purpose statistics, civil registration services and inclusive identification system."
                                        //       " It shall primarily be responsible for all national censuses and surveys, sectoral statistics, community-based statistics, consolidation of selected administrative recording systems, and compilation of national accounts.",
                                        //       textAlign: TextAlign.justify,
                                        //       style: TextStyle(
                                        //         height: 1.5,
                                        //         color: Color.fromARGB(
                                        //             255, 54, 54, 54),
                                        //         fontSize: 15,
                                        //       ),
                                        //     )),
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
  page.graphics.drawString(
    "Population Graph",
    PdfStandardFont(PdfFontFamily.helvetica, 40, style: PdfFontStyle.bold),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    bounds: const Rect.fromLTWH(0, 10, 950, 2000),
    format: PdfStringFormat(alignment: PdfTextAlignment.center),
  );
  page.graphics.drawImage(bitmap, Rect.fromLTWH(-12, 60, 930, 490));
  page.graphics.drawString(
    "The graph shows the population data from 2015 to 2020 a slight increase (1.049%) in 5 years "
    "utilizing its growth percent we can assume the forecasted population by year 2025 The "
    "data interprets that if the business is establish in this specific place we can take "
    "advantage the population increase in the following years in which most of the entrepreneurs "
    "considered of before investing. The higher the population of a specific place can be a "
    "huge aspect in the field of business.\n\n"
    "*The population data comes from the PSA \n\n"
    "PSA (Philippine Statistic Authoristy)\n"
    "The PSA shall primarily be responsible for the implementation of the objectives and provisions of "
    "R.A. 10625, R.A. 11055, and R.A. 11315.\n\n"
    "It shall plan, develop, prescribe, disseminate, and enforce policies, rules and regulations, "
    "and coordinate government-wide programs governing the production of official statistics, general "
    "purpose statistics, civil registration services and inclusive identification system.\n\n"
    "It shall primarily be responsible for all national censuses and surveys, sectoral "
    "statistics, community-based statistics, consolidation of selected administrative recording systems,"
    "and compilation of national accounts.",
    PdfStandardFont(PdfFontFamily.helvetica, 20),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    bounds: const Rect.fromLTWH(0, 550, 850, 2000),
    format: PdfStringFormat(alignment: PdfTextAlignment.justify),
  );
  final List<int> bits = document.saveSync();
  document.dispose();
  //Get external storage directory
  final Directory directory = await getApplicationSupportDirectory();
  //Get directory path
  final String path = directory.path;
  //Create an empty file to write PDF data
  File file = File('$path/Venture_Forecast-BarChart.pdf');
  //Write PDF bytes data
  await file.writeAsBytes(bits, flush: true);
  //Open the PDF document in mobile
  OpenFile.open('$path/Venture_Forecast-BarChart.pdf');

  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text('Processing...'),
  ));
}
