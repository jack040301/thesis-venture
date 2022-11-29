import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

 class dialogQuestion {

   Future showMyDialog(BuildContext context) {
     return showDialog(
         context: context,
         builder: (context) {
           // final TextEditingController _textEditingController =
           //     TextEditingController();
           //bool isChecked = false;
           return StatefulBuilder(builder: (context, setState) {
             return AlertDialog(
               content: Form(
                 //key: _formKey,
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
                       const SizedBox(
                         height: 20.0,
                       ),

                       const Text("What kind of business do you prefer?",
                           style: TextStyle(
                             color: Color.fromARGB(255, 74, 74, 74),
                             fontSize: 18.0,
                           )),
                       const SizedBox(
                         height: 10.0,
                       ),

                       //DROPDOWN
                       DropdownButtonFormField(
                         icon:  Icon(Icons.keyboard_arrow_down_rounded),
                         isExpanded: true,
                         decoration: InputDecoration(
                           contentPadding: const EdgeInsets.all((15.0)),
                           enabledBorder: OutlineInputBorder(
                             borderRadius:
                             const BorderRadius.all(Radius.circular(5.0)),
                             borderSide: BorderSide(
                                 color:
                                 const Color.fromARGB(255, 230, 230, 230)
                                     .withOpacity(0.5),
                                 width: 2),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderRadius:
                             const BorderRadius.all(Radius.circular(5.0)),
                             borderSide: BorderSide(
                                 color:
                                 const Color.fromARGB(255, 230, 230, 230)
                                     .withOpacity(0.5),
                                 width: 2),
                           ),
                           errorBorder: OutlineInputBorder(
                             borderRadius:
                             const BorderRadius.all(Radius.circular(5.0)),
                             borderSide: BorderSide(
                                 color:
                                 const Color.fromARGB(255, 230, 230, 230)
                                     .withOpacity(0.5),
                                 width: 2),
                           ),
                           filled: true,
                           fillColor: const Color.fromARGB(255, 230, 230, 230),
                         ),
                         dropdownColor:
                         const Color.fromARGB(255, 230, 230, 230),
                         //value: dropdownValue,
                         /*items: _businesstype
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 74, 74),
                                  fontSize: 14.0,
                                )));
                      }).toList(),*/
                         onChanged: (selecteditem) {
                           setState(() {
                             // selectedbusinesstype = selecteditem;
                           });
                         },
                         //value: selectedbusinesstype,
                         hint: Text('Choose your Business'),
                         style: const TextStyle(
                           color: Color.fromARGB(255, 74, 74, 74),
                           fontSize: 14.0,
                         ),
                         items: [],),

                       //TEXT BOX 2
                       const SizedBox(
                         height: 20.0,
                       ),

                       const Text(
                           "Enter budget for the area (per square meter)?",
                           style: TextStyle(
                             color: Color.fromARGB(255, 74, 74, 74),
                             fontSize: 15.0,
                           )),
                       const SizedBox(
                         height: 10.0,
                       ),
                       TextFormField(
                         //controller: areaBudgetController,
                           keyboardType: TextInputType.number,
                           validator: (areaBudgetController) {
                             return areaBudgetController!.isNotEmpty
                                 ? null
                                 : 'Invalid Input';
                           },
                           decoration: InputDecoration(
                             hintText: '500,000',
                             filled: true,
                             fillColor: const Color.fromARGB(255, 230, 230,
                                 230),
                             enabledBorder: OutlineInputBorder(
                               borderRadius:
                               const BorderRadius.all(Radius.circular(5.0)),
                               borderSide: BorderSide(
                                   color:
                                   const Color.fromARGB(255, 230, 230, 230)
                                       .withOpacity(0.5),
                                   width: 2),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius:
                               const BorderRadius.all(Radius.circular(5.0)),
                               borderSide: BorderSide(
                                   color:
                                   const Color.fromARGB(255, 230, 230, 230)
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

                       const SizedBox(
                         height: 20.0,
                       ),
                       const Text("Enter value of area (per square meter)?",
                           style: TextStyle(
                             color: Color.fromARGB(255, 74, 74, 74),
                             fontSize: 18.0,
                           )),
                       const SizedBox(
                         height: 10.0,
                       ),
                       TextFormField(
                         // controller: areaController,
                           keyboardType: TextInputType.number,
                           validator: (areaController) {
                             return areaController!.isNotEmpty
                                 ? null
                                 : 'Invalid Input';
                           },
                           decoration: InputDecoration(
                             hintText: '40',
                             filled: true,
                             fillColor: const Color.fromARGB(255, 230, 230,
                                 230),
                             enabledBorder: OutlineInputBorder(
                               borderRadius:
                               const BorderRadius.all(Radius.circular(5.0)),
                               borderSide: BorderSide(
                                   color:
                                   const Color.fromARGB(255, 230, 230, 230)
                                       .withOpacity(0.5),
                                   width: 2),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius:
                               const BorderRadius.all(Radius.circular(5.0)),
                               borderSide: BorderSide(
                                   color:
                                   const Color.fromARGB(255, 230, 230, 230)
                                       .withOpacity(0.5)),
                             ),
                             errorBorder: OutlineInputBorder(
                               borderRadius:
                               const BorderRadius.all(Radius.circular(5.0)),
                               borderSide: BorderSide(
                                   color: Colors.redAccent.withOpacity(0.5)),
                             ),
                           )),
                       const SizedBox(
                         height: 20.0,
                       ),
                       SizedBox(
                         width: 200.0,
                         child: RawMaterialButton(
                           fillColor: const Color.fromARGB(255, 0, 110, 195),
                           //onPressed: null,
                           //SAVE USERS' ANSWERS TO THE FIREBASE
                           onPressed: () {
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
                               style: TextStyle(
                                   color: Colors.white, fontSize: 15.0)),
                         ),
                       ),
                     ],
                   )),
             );
           });
         });
   }
 }