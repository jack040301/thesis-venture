import 'package:flutter/material.dart';

class DemogResult extends StatefulWidget {
  const DemogResult({super.key});

  @override
  State<DemogResult> createState() => _DemogResultState();
}

class _DemogResultState extends State<DemogResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Demographical Result'),
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
                    children: const <Widget>[
                      
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('Bisig Kabataan West',
                        textAlign: TextAlign.center,
                            style: TextStyle(
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
                  child: const Center(
                    child: Text(
                        "Population",
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
                    child: Text(
                        "Revenue per year",
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
                    child: Text(
                        "Land per sq",
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
                    child: Text(
                        "Budget required for the area",
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
                    child: Text(
                        "Your business is",
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
                    child: Text(
                        "67%",
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
                  child: const Center(
                    child: Text(
                        "ideal",
                        style: TextStyle(
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
                    child: Text(
                        "Business Type",
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
                    child: Text(
                        "Suggested business for you",
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
                    children : <Widget>[
                    Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 110, 195), // background
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                        minimumSize: Size(150, 50), //////// HERE
                          ),
                          
                           onPressed: () {},
                           child: Text("Download", style: TextStyle(color: Colors.white),)
                            )
                            ),
                            //Spacer(),
                            
                    Expanded(
                        child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size(150, 50), //<-- SEE HERE
                         side: BorderSide(color: Color.fromARGB(255, 0, 110, 195), width: 3,),
                        ),
                        child: Text('Done'),
                        ),
                            ),
                    ])
                )

                ],
             ),
            )),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        Align(alignment: Alignment.topRight, child: Icon(Icons.close)),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "Your request has been sent to the administrator!",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    actions: [
      Container(
        width: 350,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(35, 2, 35, 15),
        child: RawMaterialButton(
          fillColor: const Color.fromARGB(255, 0, 110, 195),
          onPressed: () {},
          elevation: 0.0,
          padding: const EdgeInsets.fromLTRB(27, 10, 27, 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: const Text("Okay",
              style: TextStyle(color: Colors.white, fontSize: 15.0)),
        ),
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
