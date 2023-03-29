import 'package:flutter/material.dart';

import 'package:main_venture/models/forecasting/forecasting_linechart.dart';
import 'package:main_venture/models/forecasting/forecasting_population.dart';

import 'data_threeyears.dart';
import 'forecasting_piechart.dart';

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
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add_chart_rounded,
                color: Color.fromARGB(255, 35, 111, 197),
              ),
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BarThreeYears()));

                /*    Navigator.push(
            MaterialPageRoute(
              builder: (context) =>  BarThreeYears(),
            ),
          ); */
                // do something
              },
            )
          ]),
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
    SyncLineChart(
        markerid: widget.markerid, suggestedbusiness: widget.businessname),
    BarchartPop(markerid: widget.markerid),
    PieChartForecasting(
      markerid: widget.markerid,
      suggestedbusiness: widget.businessname,
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
        backgroundColor: Colors.blue[900],
        iconSize: 22,
        selectedFontSize: 18,
        unselectedFontSize: 18,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                ImageIcon(AssetImage("assets/images/icons/lineChartIcon.png")),
            label: 'Line Chart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icons/barChartIcon.png")),
            label: 'Bar Chart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icons/pieChartIcon.png")),
            label: 'Pie Chart',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue[200],
        onTap: _onItemTapped,
      ),
    );
  }
}
