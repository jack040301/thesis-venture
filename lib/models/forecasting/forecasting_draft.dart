import 'package:flutter/material.dart';
import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/models/forecasting/forecasting_population.dart';
import 'package:main_venture/screens/home_page.dart';
import 'package:main_venture/userInfo.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(const forecasting());

class forecasting extends StatelessWidget {
  const forecasting({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Forecasting Graphs'),
        foregroundColor: const Color.fromARGB(255, 44, 45, 48),
        elevation: 0.0,
        leading: const BackButton(
          color: Color.fromARGB(255, 44, 45, 48),
        ),
      ),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    const Padding(
        padding:
        const EdgeInsets.all(7.0),
        child: Text(
          'The graph shows that the timespan in which is the assumption sales would reach and surpass the one time cost that the owner used in starting the business it includes Stall cost, Business permit and equipment.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            height: 1.5,
            color: Color.fromARGB(
                255, 54, 54, 54),
            fontSize: 15,
          ),
        )),
        
    Text(
      'Bar Chart',
      style: optionStyle,
    ),
    Text(
      'Pie Chart',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[800],
        iconSize: 40, selectedFontSize: 18, unselectedFontSize: 18,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: Icon(Icons.stacked_line_chart),
            label: 'Line Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Bar Chart',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.pie_chart),
            label: 'Pie Chart',

          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
