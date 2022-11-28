import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlidingPanelScreen extends StatefulWidget {
  const SlidingPanelScreen({super.key});

  @override
  State<SlidingPanelScreen> createState() => _SlidingPanelScreenState();
}

class _SlidingPanelScreenState extends State<SlidingPanelScreen> {
  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.5;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.06;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            heroTag: null,
            mini: true,
            child: Icon(Icons.person),
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            mini: true,
            heroTag: null,
            child: Icon(Icons.house),
            onPressed: () {},
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SlidingUpPanel(
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        color: Colors.transparent,
        panel: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const BarIndicator(),
              CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    aspectRatio: 2.0,
                    disableCenter: true,
                    viewportFraction: 0.80,
                    enlargeCenterPage: false,
                  ),
                  items: [
                    ImagesPinned("assets/images/mplaza1.jpg"),
                    ImagesPinned("assets/images/mplaza2.jpg"),
                  ]),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("Metroplaza",
                        style: TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontSize: 16.0,
                        )),
                    Text("Commercial Building",
                        style: TextStyle(
                          color: Color.fromARGB(255, 189, 187, 187),
                          fontSize: 14.0,
                        )),
                    Text("Ph.2, Langit Rd., Caloocan, Metro Manila",
                        style: TextStyle(
                          color: Color.fromARGB(255, 189, 187, 187),
                          fontSize: 14.0,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(
                            color: Color.fromARGB(255, 64, 146, 210)),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      icon: ImageIcon(
                        AssetImage("assets/images/icons/device.png"),
                        color: Color.fromARGB(255, 64, 146, 210),
                        size: 18.0,
                      ),
                      label: const Text('Contact',
                          style: TextStyle(
                            color: Color.fromARGB(255, 64, 146, 210),
                            fontSize: 17.0,
                          )),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class ImagesPinned extends StatelessWidget {
  String imgPath;
  ImagesPinned(this.imgPath);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(imgPath,
                  fit: BoxFit.cover, height: 150, width: 300),
            ),
          ),
        ],
      ),
    );
  }
}

class BarIndicator extends StatelessWidget {
  const BarIndicator({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: 80,
        height: 6,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 115, 99, 99),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
