import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../component/loading.dart';

class DemogResult extends StatefulWidget {
  const DemogResult({super.key, required this.marker, required this.budget});
  final String marker;
  final String budget;
  @override
  State<DemogResult> createState() => _DemogResultState();
}

class _DemogResultState extends State<DemogResult> {
  String ace = '5000'; // ito yung kunwari sample na budget na nilagay ni user
  // String baa = '';
  String baaa = '';

  var businessname, businessbudget;

  void initState() {
    super.initState();
    getBusinessData();
  }

  // ito yung kunwari sample na budget na nilagay ni user

  getBusinessData() async {
    CollectionReference business =
        FirebaseFirestore.instance.collection("business");
    var bud = widget.budget.trim();
    final docRef = business.doc(bud); //name of document
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        businessname = data['name'];
        businessbudget = data['budget'];
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

//////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    CollectionReference mark = FirebaseFirestore.instance.collection("markers");
    final String con = widget.marker.trim(); //this still has problem

    return FutureBuilder<DocumentSnapshot>(
      future: mark.doc("$con").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong"); //error in getting the data
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Retry loading the application"); //put here
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          snapshot.data!.data() as Map<String, dynamic>;
          String a = data['population'].toString();
          //double pops = double.parse(a); //DATA FOR POPULATION

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 241, 242, 242),
            appBar: AppBar(
              backgroundColor: Colors.transparent,

              //title: Text("Demographical Result"),
              title: Text(widget.budget),
              foregroundColor: const Color.fromARGB(255, 44, 45, 48),
              elevation: 0.0,
              leading: const BackButton(
                color: Color.fromARGB(255, 44, 45, 48),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.fromLTRB(35, 20, 35, 7),
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Text(data['place'], //DATA FOR PLACE
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 44, 45, 48),
                                      fontSize: 20.0)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: Center(
                          child: Text(a, //POPULATION
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Revenue per year", //REVENUE PER YEAR
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Land per sq", //LAND PER SQ
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Budget required for the area",
                              //BUDGET REQUIRED FOR THE AREA
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Your business is",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("67%",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 35.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: Center(
                          child: Text('$businessname' '\n' '$businessbudget',
                              // ito dito ko sana sya ilalabas kaso ayaw nya
                              //baa,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 65, 99, 200),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Business Type",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 2, 35, 7),
                        child: const Center(
                          child: Text("Suggested business for you",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 45, 48),
                                  fontSize: 16.0)), // <-- Text
                        ),
                      ),
                      Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color.fromARGB(
                                              255, 0, 110, 195), // background
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          minimumSize:
                                              Size(150, 50), //////// HERE
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Download",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                //Spacer(),

                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      //getMarkerData();
                                      getBusinessData();
                                    },
                                    style: TextButton.styleFrom(
                                      minimumSize:
                                          const Size(150, 50), //<-- SEE HERE
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 0, 110, 195),
                                        width: 3,
                                      ),
                                    ),
                                    child: Text('Done'),
                                  ),
                                ),
                              ]))
                    ],
                  ),
                )),
          );
        }

        return Loading(); //while loading the data
      },
    );
  }
}
