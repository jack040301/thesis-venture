//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/models/demog_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DialogQuestion {
//////////////////////////////////////////////////////////////////////////////
  final String markerid; //use this string to get the clicked marker id
  DialogQuestion(this.markerid); //do not remove this
  CollectionReference mark = FirebaseFirestore.instance.collection("business");

  var selectdropval = "";
  void initState() {
    // getBusinessData();
  }
  final TextEditingController areaBudgetController = TextEditingController();

  var dropitems = [
    //pa lagay dito sa array yung maquery na items
    'Item 1',
    'Item 2',
  ];

  static const colortext = Color.fromARGB(255, 74, 74, 74);

  Future<void> demogResult(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DemogResult(
                marker: markerid,
                budget: areaBudgetController.text,
                ideal: selectdropval)));
  }

  Future<void> showMyDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
//
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
//key: _formKey,E
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.close),
                  ),
                  const dialogSizedBox(),

                  const Text("Enter budget for the area (per square meter)?",
                      style: TextStyle(
                        color: colortext,
                        fontSize: 18.0,
                      )),

                  const dialogsizeBoxTen(),

//DROPDOWN
                  DropdownButtonFormField(
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all((15.0)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 230, 230, 230)
                                .withOpacity(0.5),
                            width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 230, 230, 230)
                                .withOpacity(0.5),
                            width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 230, 230, 230)
                                .withOpacity(0.5),
                            width: 2),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 230, 230, 230),
                    ),
                    dropdownColor: const Color.fromARGB(255, 230, 230, 230),

//value: dropdownValue,
                    items:
                        dropitems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: const TextStyle(
                                color: colortext,
                                fontSize: 14.0,
                              )));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
// selectedbusinesstype = selecteditem;
                        selectdropval = newValue!;
                      });
                    },
//value: selectedbusinesstype,
                    hint: const Text('Choose your Business'),
                    style: const TextStyle(
                      color: colortext,
                      fontSize: 14.0,
                    ),
                  ),

//TEXT BOX 2
                  const dialogSizedBox(),

                  const Text("Enter budget for the area (per square meter)?",
                      style: TextStyle(
                        color: colortext,
                        fontSize: 15.0,
                      )),
                  const dialogsizeBoxTen(),
                  TextFormField(
                      controller: areaBudgetController,
                      keyboardType: TextInputType.number,
                      validator: (areaBudgetController) {
                        return areaBudgetController!.isNotEmpty
                            ? null
                            : 'Invalid Input';
                      },
                      decoration: InputDecoration(
                        hintText: "",
                        filled: true,
                        fillColor: const Color.fromARGB(255, 230, 230, 230),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 230, 230, 230)
                                  .withOpacity(0.5),
                              width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 230, 230, 230)
                                  .withOpacity(0.5)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: Colors.redAccent.withOpacity(0.5)),
                        ),
                      )),

// TEXT BOX 3

                  const dialogSizedBox(),
                  const Text("Enter value of area (per square meter)?",
                      style: TextStyle(
                        color: colortext,
                        fontSize: 18.0,
                      )),
                  const dialogsizeBoxTen(),
                  const DialogArea(),
                  const dialogSizedBox(),
                  SizedBox(
                    width: 200.0,
                    child: RawMaterialButton(
                      fillColor: const Color.fromARGB(255, 0, 110, 195),
//onPressed: null,
//SAVE USERS' ANSWERS TO THE FIREBASE

                      onPressed: () async {
                        // ito yun sana kapag initinallize dapat

                        //  getMarkerData();
                        //  getMarkerData();
                        await demogResult(context);
/*  if (selectedbusinesstype == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                  Text('Choose Prefered Business')));
                        } else {
                          //preferBusinessController.text =selectedbusinesstype;
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //         content: Text(selectedbusinesstype)));
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')));
                            userAnswers();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Fill out the required field')));
                          }
                        }*/
                      },
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: const Text("Proceed",
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    ),
                  ),
                ],
              )),
            );
          });
        });
  }
}

// ignore: camel_case_types
class dialogsizeBoxTen extends StatelessWidget {
  const dialogsizeBoxTen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10.0,
    );
  }
}

// ignore: camel_case_types
class dialogSizedBox extends StatelessWidget {
  const dialogSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20.0,
    );
  }
}

class DialogArea extends StatelessWidget {
  const DialogArea({
    super.key,
    // required this.areaController,
  });

  // final TextEditingController areaController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        //controller: areaController,
        keyboardType: TextInputType.number,
        validator: (areaController) {
          return areaController!.isNotEmpty ? null : 'Invalid Input';
        },
        decoration: InputDecoration(
          hintText: '40',
          filled: true,
          fillColor: const Color.fromARGB(255, 230, 230, 230),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color:
                    const Color.fromARGB(255, 230, 230, 230).withOpacity(0.5),
                width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color:
                    const Color.fromARGB(255, 230, 230, 230).withOpacity(0.5)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.redAccent.withOpacity(0.5)),
          ),
        ));
  }
}
