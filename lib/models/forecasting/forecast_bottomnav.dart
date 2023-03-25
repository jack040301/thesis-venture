import 'package:flutter/material.dart';

import 'package:main_venture/models/forecasting/forecasting_linechart.dart';
import 'package:main_venture/models/forecasting/forecasting_population.dart';

/* void main() => runApp(const forecasting()); */

class ForecastingNavBar extends StatelessWidget {
  final String markerid, businessname;
  const ForecastingNavBar(
      {super.key, required this.markerid, required this.businessname});

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
      body: BottomNav(markerid: markerid, businessname: businessname),
    );
  }
}

class BottomNav extends StatefulWidget {
  final String markerid, businessname;
  const BottomNav(
      {super.key, required this.markerid, required this.businessname});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late final List<Widget> _widgetOptions = <Widget>[
    SyncLineChart(markerid: widget.markerid, businessname: widget.businessname),
    BarchartPop(markerid: widget.markerid),
    const Text(
      'Pie Chart',
      //   style: optionStyle,
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
        iconSize: 40,
        selectedFontSize: 18,
        unselectedFontSize: 18,
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
