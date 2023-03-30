import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'forecasting/forecast_bottomnav.dart';
import 'forecasting/forecasting_linechart.dart';
import 'package:main_venture/models/forecasting/forecasting_linechart.dart';
import 'forecasting/forecasting_population.dart';
import 'package:main_venture/userInfo.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:syncfusion_flutter_pdf/pdf.dart';
/* uncomment this to use the pdf package 
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart'; */

class DemogResult extends StatefulWidget {
  const DemogResult(
      {super.key,
      required this.marker,
      required this.budget,
      required this.ideal});
  final String marker, ideal, budget;
  @override
  State<DemogResult> createState() => _DemogResultState();
}

class _DemogResultState extends State<DemogResult> {
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  String popstrA = '';
  String landbudgetstrA = '';
  String revstrA = '';
  //final GlobalKey _globalKey = GlobalKey();

  // ignore: prefer_typing_uninitialized_variables
  var businessname, businessbudget, landbudget, landrevenue, landpop;
  @override
  final _globalKey = GlobalKey();

  void initState() {
    getBusinessData();
    super.initState();
  }

  late Uint8List _imageFile;

  Future<void> _captureScreenshot(_globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var png = byteData?.buffer.asUint8List();

      /*   Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => new PreviewScreenshot(photo: png),
        ),
      ); */
    } catch (e) {
      print(e);
    }
  }

  Future<void> _createPDF(bitmapimage) async {
    //Create a new PDF document
    PdfDocument document = PdfDocument();

//Draw the image
    document.pages.add().graphics.drawImage(
        PdfBitmap(File(bitmapimage).readAsBytesSync()),
        Rect.fromLTWH(0, 0, 100, 100));

//Saves the document
    File('Output.pdf').writeAsBytes(await document.save());

//Dispose the document
    document.dispose();
  }

  // ignore: non_constant_identifier_names
  Future<void> StatisForecastingNavBar(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForecastingNavBar(
          markerid: widget.marker,
          businessname: businessname,
        ),
      ),
    );
  }

  Future saveDatePinned(pinnedData) async {
    var db = FirebaseFirestore.instance;
    db
        .collection("pinnedlocation")
        .add(pinnedData)
        .then((documentSnapshot) => {
              debugPrint("savedData")
              //showing if data is saved
            })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(error);
    });
  }

  Future<void> ChartForecasting(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SyncLineChart(
                  markerid: widget.marker,
                  suggestedbusiness: businessname,
                  //         markerid: widget.budget,
                )));
  }

  Future getBusinessData() async {
    CollectionReference business =
        FirebaseFirestore.instance.collection("business");
    // var bud = widget.budget.trim();
    String budgetf = widget.budget.toString();
    final docRef = business.where("budgetassump", isEqualTo: budgetf);
    await docRef.get().then(
      (QuerySnapshot doc) {
        doc.docs.forEach((documents) async {
          var data = documents.data() as Map;
          //  debugPrint(data);
          businessname = data['name'];
          businessbudget = data['budget'];
          landbudget = data['land value'];
          landrevenue = data['revenue'];
          landpop = data['population'];
          //landbudget = data['land value'];
          //    landrevenue = data['revenue'];
          //landpop = data['population'];
// for coversion of var to String
          // landbudgetstrA = data['land value'].toString();
          revstrA = data['revenue_standard'].toString();
          popstrA = data['population'].toString();
        });
      },
      onError: (e) => ("Error getting document: $e"),
    );
  }

  Future<String> savingImage(Uint8List bytes) async {
    PopSnackbar popSnackbar = PopSnackbar();
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final filename = 'screenshot_$time';

    _createPDF(bytes);
    final result = await ImageGallerySaver.saveImage(bytes, name: filename);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(popSnackbar.popsnackbar("Sucessfully Downloaded Result"));
    return result['filepath'];
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference mark =
        FirebaseFirestore.instance.collection("markers");
    final String con = widget.marker.trim(); //this still has problem
    return FutureBuilder<DocumentSnapshot>(
      future: mark.doc(con).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong"); //error in getting the data
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Retry loading the application"); //put here
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          String placename = data['place'];
          //for land size
          String landstr = data['land_size'].toString();
          //  String landstrfinal = '${landstr}sqm';
          // for population
          String popstrB = data['population'].toString();
          double popdblB = double.parse(popstrB);
          double popdblA = double.parse(popstrA);
          double popdblfinal = (popdblB / popdblA) * 10;
          if (popdblfinal > 100) {
            popdblfinal = 100.0;
          }
          // for revenue
          String revstrB = data['revenue'].toString();
          double revdblB = double.parse(revstrB);
          double revdblA = double.parse(revstrA);
          double revdblfinal = (revdblB / revdblA) * 100;
          if (revdblfinal > 100) {
            revdblfinal = 100.0;
          }
          // for budget
          String landbudgetstrB = data['land'].toString();
          double landbudgetdblB = double.parse(landbudgetstrB);
          double landbudgetdblA = double.parse(landbudget);
          /*  double landbudgetdblfinalA = landbudgetdblB - landbudgetdblB;
          double landbudgetdblfinalB = landbudgetdblB - landbudgetdblfinalA;
          double landbudgetdblfinalC =
              (landbudgetdblfinalB / landbudgetdblB) * 100; */
          double landbudgetdblfinalA = landbudgetdblB - landbudgetdblA; //2600
          double landbudgetdblfinalB =
              landbudgetdblA - landbudgetdblfinalA; // 2800
          double landbudgetdblfinalC =
              (landbudgetdblfinalB / landbudgetdblA) * 100;
          if (landbudgetdblfinalC > 100) {
            landbudgetdblfinalC = 100.0;
          }
          double result = (popdblfinal + revdblfinal + landbudgetdblfinalC) / 3;
          String resultA = result.toStringAsFixed(2);
          String resultfinal = '${resultA}%';
          final pinnedData = {
            "place_name": placename,
            "percentage": resultfinal,
            "ideal_shop": businessname,
            "population": popstrB,
            "revenue": revstrB,
            "land_area": landstr,
            "budget_required": landbudgetstrB,
            "user_id": GoogleUserStaticInfo().uid,
            "marker_id": widget.marker,
          };
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 241, 242, 242),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text("Demographical Result"),
                //  title: Text(widget.ideal),
                foregroundColor: const Color.fromARGB(255, 44, 45, 48),
                elevation: 0.0,
                leading: const BackButton(
                  color: Color.fromARGB(255, 44, 45, 48),
                ),
              ),
              body: RepaintBoundary(
                  key: _globalKey,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            DemogPlace(data: data),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 15, 35, 5),
                                color: Colors.white,
                                child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                            "Population\t\t", //POPULATION
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 45, 48),
                                                fontSize: 15.0)),
                                      ),
                                      Center(
                                        child: Tooltip(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          decoration:
                                              BoxDecoration(color: Colors.grey),
                                          message:
                                              'Population of the pinned zone',
                                          triggerMode: TooltipTriggerMode
                                              .tap, // ensures the label appears when tapped
                                          preferBelow:
                                              false, // use this if you want the label above the widget
                                          child: Icon(
                                            Icons.info_outline,
                                            size: 15,
                                            color: Color.fromARGB(
                                                255, 65, 99, 200),
                                          ),
                                        ), // <-- Text
                                      ),
                                    ])),
                            DemogPopulation(
                                popstrB: popstrB
                                    .replaceAllMapped(reg, mathFunc)
                                    .toString()),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 10, 35, 5),
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                            "Revenue per year\t\t", //REVENUE PER YEAR
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 45, 48),
                                                fontSize: 15.0)), // <-- Text
                                      ),
                                      Center(
                                        child: Tooltip(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          decoration:
                                              BoxDecoration(color: Colors.grey),
                                          message:
                                              'Revenue per year of the pinned zone',
                                          triggerMode: TooltipTriggerMode
                                              .tap, // ensures the label appears when tapped
                                          preferBelow:
                                              false, // use this if you want the label above the widget
                                          child: Icon(
                                            Icons.info_outline,
                                            size: 15,
                                            color: Color.fromARGB(
                                                255, 65, 99, 200),
                                          ),
                                        ), // <-- Text
                                      ),
                                    ])),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                    '₱' +
                                        revstrB
                                            .replaceAllMapped(reg, mathFunc)
                                            .toString(), //REVENUE PER YEAR
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 20.0)), // <-- Text
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 10, 35, 5),
                                color: Colors.white,
                                child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                            "Land per SqM\t\t", //LAND PER SQ
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 45, 48),
                                                fontSize: 15.0)), // <-- Text
                                      ),
                                      Center(
                                        child: Tooltip(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          decoration:
                                              BoxDecoration(color: Colors.grey),
                                          message:
                                              'Land value per square meter in peso',
                                          triggerMode: TooltipTriggerMode
                                              .tap, // ensures the label appears when tapped
                                          preferBelow:
                                              false, // use this if you want the label above the widget
                                          child: Icon(
                                            Icons.info_outline,
                                            size: 15,
                                            color: Color.fromARGB(
                                                255, 65, 99, 200),
                                          ),
                                        ), // <-- Text
                                      ),
                                    ])),
                            LandPerSQM(landstr: landstr),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 10, 35, 5),
                                color: Colors.white,
                                child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                            "Budget required for the area\t\t",
                                            //BUDGET REQUIRED FOR THE AREA
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 45, 48),
                                                fontSize: 15.0)), // <-- Text
                                      ),
                                      Center(
                                        child: Tooltip(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          decoration:
                                              BoxDecoration(color: Colors.grey),
                                          message:
                                              'Budget required for the area (per sqm) in peso',
                                          triggerMode: TooltipTriggerMode
                                              .tap, // ensures the label appears when tapped
                                          preferBelow:
                                              false, // use this if you want the label above the widget
                                          child: Icon(
                                            Icons.info_outline,
                                            size: 15,
                                            color: Color.fromARGB(
                                                255, 65, 99, 200),
                                          ),
                                        ), // <-- Text
                                      ),
                                    ])),
                            BudgetRequiredArea(
                                landbudgetstrB: '₱' +
                                    landbudgetstrB
                                        .replaceAllMapped(reg, mathFunc)
                                        .toString()),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 10, 35, 5),
                                color: Colors.white,
                                child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                            textAlign: TextAlign.justify,
                                            "The Feasibilty (%) of your ideal \n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tbusiness is\t\t",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 65, 99, 200),
                                                fontSize: 16.0)), // <-- Text
                                      ),
                                      Center(
                                        child: Tooltip(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          decoration:
                                              BoxDecoration(color: Colors.grey),
                                          message:
                                              'Percentage of how feasible your business is',
                                          triggerMode: TooltipTriggerMode
                                              .tap, // ensures the label appears when tapped
                                          preferBelow:
                                              false, // use this if you want the label above the widget
                                          child: Icon(
                                            Icons.info_outline,
                                            size: 15,
                                            color: Color.fromARGB(
                                                255, 65, 99, 200),
                                          ),
                                        ), // <-- Text
                                      ),
                                    ])),
                            IdealBusinessResult(resultfinal: resultfinal),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 5, 35, 10),
                              color: Colors.white,
                              child: const Center(
                                child: Text("ideal",
                                    // ideal ni user
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 65, 99, 200),
                                        fontSize: 21.0)), // <-- Text
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 2, 35, 5),
                                color: Colors.white,
                                child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                            "Business Type Selected\t\t",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 45, 48),
                                                fontSize: 15.0)), // <-- Text
                                      ),
                                      Center(
                                        child: Tooltip(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          decoration:
                                              BoxDecoration(color: Colors.grey),
                                          message: 'Business type you selected',
                                          triggerMode: TooltipTriggerMode
                                              .tap, // ensures the label appears when tapped
                                          preferBelow:
                                              false, // use this if you want the label above the widget
                                          child: Icon(
                                            Icons.info_outline,
                                            size: 15,
                                            color: Color.fromARGB(
                                                255, 65, 99, 200),
                                          ),
                                        ), // <-- Text
                                      ),
                                    ])),
                            Container(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                              color: Colors.white,
                              child: Center(
                                child: Text(widget.ideal,
                                    //BUDGET REQUIRED FOR THE AREA
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 44, 45, 48),
                                        fontSize: 20.0)), // <-- Text
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 2, 35, 5),
                                color: Colors.white,
                                child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                            "Suggested business for you\t\t",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 45, 48),
                                                fontSize: 15.0)), // <-- Text
                                      ),
                                      Center(
                                        child: Tooltip(
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          decoration:
                                              BoxDecoration(color: Colors.grey),
                                          message:
                                              'Business type suggested for you',
                                          triggerMode: TooltipTriggerMode
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
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 0, 35, 10),
                                color: Colors.white,
                                child: TextButton(
                                  onPressed: () async {
                                    StatisForecastingNavBar(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(businessname,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 65, 99, 200),
                                              fontSize: 20.0)),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 20.0,
                                        color: Color.fromARGB(255, 65, 99, 200),
                                      ),
                                    ],
                                  ),
                                )),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 20),
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                          child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0.0,
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                primary: const Color.fromARGB(
                                                    255,
                                                    0,
                                                    110,
                                                    195), // background
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                minimumSize: const Size(
                                                    70, 40), //////// HERE
                                              ),
                                              onPressed: () async {
                                                _demogResult(
                                                    context, _globalKey);
                                                /* uncomment this to use the pdf generator   
                                                 Printing.layoutPdf(
                                                  onLayout:
                                                      (PdfPageFormat format) {
                                                    // Any valid Pdf document can be returned here as a list of int
                                                    return buildPdf(
                                                        format,
                                                        businessbudget,
                                                        businessname,
                                                        popstrB,
                                                        revstrB,
                                                        landstr,
                                                        landbudgetstrB,
                                                        resultfinal,
                                                        widget.ideal,
                                                        placename);
                                                  },
                                                ); */
                                              },
                                              icon: const Icon(
                                                Icons.file_download_outlined,
                                                size: 18.0,
                                              ),
                                              label: const Text(
                                                "Download",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))),
                                      //Spacer(),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                          child: TextButton(
                                        onPressed: () async {
                                          /*  await StatisForecastingNavBar(
                                              context); */

                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForecastingNavBar(
                                                        markerid: widget.marker,
                                                        businessname:
                                                            businessname,
                                                        //         markerid: widget.budget,
                                                      )));

                                          await saveDatePinned(pinnedData);
                                          /*     Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SyncLineChart(
                                                                markerid: widget.marker,
                                                              ))); */
                                          //getMarkerData();
                                          //   getBusinessData();
                                        },
                                        style: TextButton.styleFrom(
                                          minimumSize:
                                              const Size(70, 40), //<-- SEE HERE
                                          side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 0, 110, 195),
                                            width: 3,
                                          ),
                                        ),
                                        child: const Text('Done'),
                                      ))
                                    ]))
                          ])))));
/*
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 241, 242, 242),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text("Demographical Result"),
                //  title: Text(widget.ideal),
                foregroundColor: const Color.fromARGB(255, 44, 45, 48),
                elevation: 0.0,
                leading: const BackButton(
                  color: Color.fromARGB(255, 44, 45, 48),
                ),
              ),
              body: Screenshot(
                  controller: screenshotController,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                DemogPlace(data: data),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                                  color: Colors.white,
                                  child: const Center(
                                    child: Text("Population", //POPULATION
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 44, 45, 48),
                                            fontSize: 15.0)), // <-- Text
                                  ),
                                ),
                                DemogPopulation(popstrB: popstrB),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                                  color: Colors.white,
                                  child: const Center(
                                   child: Text(
                                        "Revenue per year", //REVENUE PER YEAR
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 44, 45, 48),
                                            fontSize: 15.0)), // <-- Text
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(revstrB, //REVENUE PER YEAR
                                        style: const TextStyle(
                                            color: Color.fromARGB(255, 44, 45, 48),
                                            fontSize: 20.0)), // <-- Text
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                                  color: Colors.white,
                                  child: const Center(
                                    child: Text("Land per SqM", //LAND PER SQ
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 44, 45, 48),
                                            fontSize: 15.0)), // <-- Text
                                  ),
                                ),
                                LandPerSQM(landstr: landstr),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                                  color: Colors.white,
                                  child: const Center(
                                    child: Text("Budget required for the area",
                                        //BUDGET REQUIRED FOR THE AREA
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 44, 45, 48),
                                            fontSize: 15.0)), // <-- Text
                                  ),
                                ),
                                BudgetRequiredArea(landbudgetstrB: landbudgetstrB),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
                                  color: Colors.white,
                                  child: const Center(
                                    child: Text(
                                        textAlign: TextAlign.justify,
                                        "The Feasibilty (%) of your ideal \n business is",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 65, 99, 200),
                                            fontSize: 16.0)), // <-- Text
                                  ),
                                ),
                                IdealBusinessResult(resultfinal: resultfinal),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 5, 35, 10),
                                  color: Colors.white,
                                  child: const Center(
                                    child: Text("ideal",
                                        // ideal ni user
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 65, 99, 200),
                                            fontSize: 21.0)), // <-- Text
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 2, 35, 5),
                                  color: Colors.white,
                                  child: const Center(
                                    child: Text("Business Type",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 44, 45, 48),
                                            fontSize: 15.0)), // <-- Text
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(widget.ideal,
                                        //BUDGET REQUIRED FOR THE AREA
                                        style: const TextStyle(
                                            color: Color.fromARGB(255, 44, 45, 48),
                                            fontSize: 20.0)), // <-- Text
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 2, 35, 5),
                                  color: Colors.white,
                                  child: const Center(
                                    child: Text("Suggested business for you",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 44, 45, 48),
                                            fontSize: 15.0)), // <-- Text
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                                  color: Colors.white,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        // StatisForecasting(context);
                                        ChartForecasting(context);
                                      },
                                      child: Text(businessname,
                                          style: const TextStyle(
                                              color:
                                              Color.fromARGB(255, 65, 99, 200),
                                              fontSize: 20.0)),
                                    ), // <-- Text
                                  ),
                                ),
                                Container(
                                    padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 20),
                                    color: Colors.white,
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Expanded(
                                              child: ElevatedButton.icon(
                                                  style: ElevatedButton.styleFrom(
                                                    elevation: 0.0,
                                                    padding:
                                                    const EdgeInsets.all(10.0),
                                                    primary: const Color.fromARGB(
                                                        255,
                                                        0,
                                                        110,
                                                        195), // background
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                    minimumSize: const Size(
                                                        70, 40), //////// HERE
                                                  ),
                                                  onPressed: () async {
                                                    final image =
                                                    await screenshotController
                                                        .capture(
                                                        delay:
                                                        const Duration(
                                                            milliseconds:
                                                            10),
                                                        pixelRatio: 1.5);
                                                    if (image == null) return;
                                                    await savingImage(image);
                                                    int count = 0;
                                                    Navigator.of(context).popUntil(
                                                            (_) => count++ >= 2);
                                                  },
                                                  icon: const Icon(
                                                    Icons.file_download_outlined,
                                                    size: 18.0,
                                                  ),
                                                  label: const Text(
                                                    "Download",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))),
                                          //Spacer(),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SyncLineChart(
                                                                markerid: widget.marker,
                                                              )));
                                                  //getMarkerData();
                                                  //   getBusinessData();
                                                },
                                                style: TextButton.styleFrom(
                                                  minimumSize:
                                                  const Size(70, 40), //<-- SEE HERE
                                                  side: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 0, 110, 195),
                                                    width: 3,
                                                  ),
                                                ),
                                                child: const Text('Done'),
                                              ))
                                        ]))
                              ])))));
      */
        }
        return const Center(
            child:
                CircularProgressIndicator.adaptive()); //while loading the data
      },
    );
  }
}

/* uncomment this to use the pdf generator

 Future<Uint8List> buildPdf(
    PdfPageFormat format,
    String businessbudget,
    businessname,
    popstrB,
    revstrB,
    landstr,
    landbudgetstrB,
    resultfinal,
    ideal,
    placename) async {
  // Create the Pdf document
  const baseColor = PdfColors.blue;
  // Create a PDF document.
  final document = pw.Document();
  final theme = pw.ThemeData.withFont(
    base: await PdfGoogleFonts.openSansRegular(),
    bold: await PdfGoogleFonts.openSansBold(),
  );
  const tableHeaders = ['Label', 'Results'];
  var dataTable = [
    ['Place', placename],
    ['Population', popstrB],
    ['Revenue Per Year', revstrB],
    ['Land per Sqm', landstr],
    ['Budget Required for the Area', landbudgetstrB],
    ['Feasibility Percent', resultfinal],
    ['User Preferred Business', ideal],
    ['Venture Suggested Business', businessname],
  ];
  final table = pw.Table.fromTextArray(
    border: null,
    headers: tableHeaders,
    data: dataTable,
    headerStyle: pw.TextStyle(
      color: PdfColors.white,
      fontWeight: pw.FontWeight.bold,
    ),
    headerDecoration: const pw.BoxDecoration(
      color: baseColor,
    ),
    rowDecoration: const pw.BoxDecoration(
      border: pw.Border(
        bottom: pw.BorderSide(
          color: baseColor,
          width: .5,
        ),
      ),
    ),
    cellAlignment: pw.Alignment.centerRight,
    cellAlignments: {0: pw.Alignment.centerLeft},
  );
  // Add one page with centered text "Hello World"
  document.addPage(
    pw.Page(
      pageFormat: format,
      theme: theme,
      build: (context) {
        return pw.Column(
          children: [
            pw.Text('Demographical Report',
                style: const pw.TextStyle(
                  color: baseColor,
                  fontSize: 35,
                )),
            pw.Divider(thickness: 0.5),
            table,
          ],
        );
      },
    ),
  );
  // Build and return the final Pdf file data
  return await document.save();
} */

class IdealBusinessResult extends StatelessWidget {
  const IdealBusinessResult({
    super.key,
    required this.resultfinal,
  });
  final String resultfinal;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 5),
      color: Colors.white,
      child: Center(
        child: Text(resultfinal,
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 23.0)), // <-- Text
      ),
    );
  }
}

class BudgetRequiredArea extends StatelessWidget {
  const BudgetRequiredArea({
    super.key,
    required this.landbudgetstrB,
  });
  final String landbudgetstrB;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
      color: Colors.white,
      child: Center(
        child: Text(landbudgetstrB,
            //BUDGET REQUIRED FOR THE AREA
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 20.0)), // <-- Text
      ),
    );
  }
}

class LandPerSQM extends StatelessWidget {
  const LandPerSQM({
    super.key,
    required this.landstr,
  });
  final String landstr;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
      color: Colors.white,
      child: Center(
        child: Text('$landstr' 'sqm', //LAND PER SQ
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 20.0)), // <-- Text
      ),
    );
  }
}

class DemogPopulation extends StatelessWidget {
  const DemogPopulation({
    super.key,
    required this.popstrB,
  });
  final String popstrB;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 2, 35, 10),
      color: Colors.white,
      child: Center(
        child: Text(popstrB, //POPULATION
            style: const TextStyle(
                color: Color.fromARGB(255, 44, 45, 48),
                fontSize: 20.0)), // <-- Text
      ),
    );
  }
}

class DemogPlace extends StatelessWidget {
  const DemogPlace({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(35, 10, 35, 15),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(data['place'], //DATA FOR PLACE
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 44, 45, 48), fontSize: 18.0)),
          )
        ],
      ),
    );
  }
}

Future<void> _demogResult(context, _cartesianChartKey) async {
  ui.Image image =
      await _cartesianChartKey.currentContext!.findRenderObject()!.toImage();
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List imageBytes = byteData!.buffer.asUint8List();

  final PdfBitmap bitmap = PdfBitmap(imageBytes);

  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Processing...'),
  ));

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
  File file = File('$path/Venture_Forecast-Demographical.pdf');
  //Write PDF bytes data
  await file.writeAsBytes(bits, flush: true);
  //Open the PDF document in mobile
  OpenFile.open('$path/Venture_Forecast-Demographical.pdf');
}
