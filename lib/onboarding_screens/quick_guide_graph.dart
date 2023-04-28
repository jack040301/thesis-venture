import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderGraphScreen extends StatefulWidget {
  const SliderGraphScreen({super.key});

  @override
  State<SliderGraphScreen> createState() => _SliderGraphScreenState();
}

class _SliderGraphScreenState extends State<SliderGraphScreen> {
  List imageList = [
    {"id": 1, "image_path": "assets/images/icons/ForecastedGrowthRevenue.png"},
    {"id": 2, "image_path": "assets/images/icons/PopulationGrowth.png"},
    {"id": 3, "image_path": "assets/images/icons/ForecastedGrowthRevenue(3Years).png"},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
        // appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // title: const Text('Quick Guide'),
        // foregroundColor: const Color.fromARGB(255, 44, 45, 48),
        // elevation: 0.0,
        // leading: const BackButton(
        // color: Color.fromARGB(255, 44, 45, 48),
        // ),
        //   ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 1.0,
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        print(currentIndex);
                      },
                      child: CarouselSlider(
                        items: imageList
                            .map(
                              (item) => Image.asset(
                            item['image_path'],
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        )
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: 710,
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          //  enlargeCenterPage: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    //Dots
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => carouselController.animateToPage(entry.key),
                            child: Container(
                              width: currentIndex == entry.key ? 17 : 7,
                              height: 7.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == entry.key
                                      ? Colors.blue
                                      : Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }
}
// TODO Implement this library.