//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_venture/models/demog_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:main_venture/userInfo.dart';

class DialogQuestion {
//////////////////////////////////////////////////////////////////////////////
  final String markerid;
//use this string to get the clicked marker id
  DialogQuestion(this.markerid, this.dropdownDatas); //do not remove this
  CollectionReference mark = FirebaseFirestore.instance.collection("business");
  List<DropdownData> dropdownDatas = [];
  var selectdropval = "";

  var Questionall = const SnackBar(
    content: Text(
        'No Empty answers Allowed! Please fill all the questions correctly'),
  );
  var Questionall1 = const SnackBar(
    content:
        Text('No zero values Allowed! Please fill all the questions correctly'),
  );

  var Questionall2 = const SnackBar(
    content: Text(
        'No business budget match! Please fill all the questions correctly'),
  );

  final TextEditingController areaBudgetController = TextEditingController();
  final areaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  static const colortext = Color.fromARGB(255, 74, 74, 74);

  Future demogResult(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DemogResult(
                marker: markerid,
                budget: areaBudgetController.text,
                ideal: selectdropval)));
  }

  /* List<DropdownMenuItem> get dropdownItems {
    List<DropdownMenuItem> businessItems = [];
    FirebaseFirestore.instance
        .collection("business")
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((documents) async {
                //var data = documents.data() as Map;
                var data = documents.data() as Map;

                businessItems.add(
                  DropdownMenuItem(
                    value: documents.id,
                    child: Text(
                      documents.id,
                      style: const TextStyle(color: Color(0xff11b719)),
                    ),
                  ),
                );
              })
            });

    return businessItems;
  } */

  /*  List<DropdownMenuItem> businessItems = [];

  Future getBusiness() async {
    await FirebaseFirestore.instance
        .collection("business")
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((documents) async {
                //var data = documents.data() as Map;
                var data = documents.data() as Map;

                businessItems.add(
                  DropdownMenuItem(
                    value: documents.id,
                    child: Text(
                      documents.id,
                      style: const TextStyle(color: Color(0xff11b719)),
                    ),
                  ),
                );
              })
            });
  }
 */
  Future showMyDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
//bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
//key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(context).pop())
                        // child: Icon(Icons.close),
                        // ontap: () async {
                        //     // ito yun sana kapag initinallize dapat

                        //     //  getMarkerData();
                        //     //  getMarkerData();
                        //     await demogResult(context);
                        //   } ///////////////////////////////
                        ),
                    const SizeBoxTwenty(),

                    const Text("What kind of business do you prefer?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontSize: 16.0,
                        )),

                    const SizeBoxTen(),

//DROPDOWN
                    DropdownButtonFormField<DropdownData>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      isExpanded: true,
                      validator: (value) {
                        return selectdropval!.isNotEmpty
                            ? null
                            : 'Invalid Input';
                      },
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
                      items: dropdownDatas.map<DropdownMenuItem<DropdownData>>(
                          (DropdownData data) {
                        return DropdownMenuItem<DropdownData>(
                          value: data,
                          child: Text(data.nameofbusiness),
                        );
                      }).toList(),
                      /*  dropitems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 74, 74),
                                  fontSize: 14.0,
                                )));
                      }).toList(), */
                      onChanged: (value) {
                        setState(() {
// selectedbusinesstype = selecteditem;
                          selectdropval = value!.nameofbusiness;
                        });
                      },
//value: selectedbusinesstype,
                      hint: const Text('Choose your Business'),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 74, 74, 74),
                        fontSize: 15.0,
                      ),
                    ),

//TEXT BOX 2
                    const SizeBoxTwenty(),

                    const Text("Enter budget for the area (per square meter)",
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontSize: 16.0,
                        )),
                    const SizeBoxTen(),
                    TextFormField(
                        controller: areaBudgetController,
                        validator: (areaBudgetController) {
                          return areaBudgetController!.isNotEmpty
                              ? null
                              : 'Invalid Input';
                        },
                        enableInteractiveSelection: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: " Please enter 200328",
                          filled: true,
                          fillColor: Color.fromARGB(255, 230, 230, 230),
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

                    const SizeBoxTwenty(),
                    const Text("Enter value of area (per square meter)",
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontSize: 16.0,
                        )),
                    const SizeBoxTen(),
                    TextFormField(
                        controller: areaController,
                        enableInteractiveSelection: false,
                        validator: (areaController) {
                          return areaController!.isNotEmpty
                              ? null
                              : 'Invalid Input';
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
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
                    const SizeBoxTwenty(),
                    SizedBox(
                      width: 200.0,
                      child: RawMaterialButton(
                        fillColor: const Color.fromARGB(255, 0, 110, 195),
//onPressed: null,
//SAVE USERS' ANSWERS TO THE FIREBASE

                        onPressed: () async {
                          // ito yun sana kapag initinallize dapat
                          if (selectdropval.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(Questionall);
                          } else if (areaBudgetController.text.isEmpty ||
                              areaController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(Questionall);
                          } else if (areaBudgetController.text ==
                                  0.toString() ||
                              areaController.text == 0.toString()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(Questionall1);
                          } else if (areaBudgetController.text ==
                              200328.toString()) {
                            await demogResult(context);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(Questionall2);
                          }
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
              ),
            );
          });
        });
  }
}

class SizeBoxTen extends StatelessWidget {
  const SizeBoxTen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10.0,
    );
  }
}

class SizeBoxTwenty extends StatelessWidget {
  const SizeBoxTwenty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20.0,
    );
  }
}
