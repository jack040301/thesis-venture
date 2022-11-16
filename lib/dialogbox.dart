import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';

class DialogVenture extends StatefulWidget {
  const DialogVenture({Key? key}) : super(key: key);

  @override
  _DialogVentureState createState() => _DialogVentureState();

}

class _DialogVentureState extends State<DialogVenture> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context) {
          final TextEditingController _textEditingController = TextEditingController();
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Align(
                          alignment: Alignment.topRight, child: Icon(Icons.close)),

                      //DROPDOWN
                      DropdownButton<String>(
                        items: <String>['Coffee Shop', 'Commercial Space', 'Boutique', 'Nikki Ganda'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),


                      // TEXT BOX 1

                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text("What kind of business do you prefer?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 74, 74, 74),
                            fontSize: 19.0,
                          )),
                      const SizedBox(
                        height: 4.0,
                      ),
                      TextFormField(

                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : 'Invalid Input';
                        },
                        decoration: InputDecoration(hintText: 'Choose your business',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 230, 230, 230),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 230, 230, 230)
                                    .withOpacity(0.5),
                                width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 230, 230, 230)
                                    .withOpacity(0.5)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                            BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                          ),

                        ),
                      ),



                      //TEXT BOX 2
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text("Enter budget for the area (per square meter)?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 74, 74, 74),
                            fontSize: 19.0,
                          )),
                      const SizedBox(
                        height: 4.0,
                      ),
                      TextFormField(
                          controller: _textEditingController,
                          validator: (value) {
                            return value!.isNotEmpty ? null : 'Invalid Input';
                          },
                          decoration: InputDecoration(hintText: '500,000',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 230, 230, 230),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 230, 230, 230)
                                      .withOpacity(0.5),
                                  width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 230, 230, 230)
                                      .withOpacity(0.5)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                              borderSide:
                              BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                            ),
                          )
                      ),




                      // TEXT BOX 3

                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text("Enter value of area (square meter)?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 74, 74, 74),
                            fontSize: 19.0,
                          )),
                      const SizedBox(
                        height: 4.0,
                      ),
                      TextFormField(
                          controller: _textEditingController,
                          validator: (value) {
                            return value!.isNotEmpty ? null : 'Invalid Input';
                          },
                          decoration: InputDecoration(hintText: '40',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 230, 230, 230),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 230, 230, 230)
                                      .withOpacity(0.5),
                                  width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 230, 230, 230)
                                      .withOpacity(0.5)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                              borderSide:
                              BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 200.0,
                        child: RawMaterialButton(
                          fillColor: const Color.fromARGB(255, 0, 110, 195),
                          onPressed: null,
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text("Proceed",
                              style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                      ),






                    ],
                  )
              ),
            );
          }
          );
        });
  }

  @override
  //Widget build(BuildContext context) {
  // TODO: implement build
  //throw UnimplementedError();
  //}
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  await showInformationDialog(context);
                },
                child: Text(
                  "Click Me",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16),


//END

                ),
              ),
            ),
          ),
        )
    );

  }
}