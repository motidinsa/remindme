import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'MeasureSizeRenderObject.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  double height;
  int _current;

  Map<String, List> operationalHours = {
    'Mon': ['', '', ''],
    'Tue': ['', ''],
    'Wed': ['', '', ''],
    'Thu': [''],
    'Fri': ['', '', ''],
    'Sat': ['', ''],
    'Sun': ['', '', '']
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CarouselSlider.builder(
          itemCount: days.length,
          itemBuilder: (BuildContext context, int index, int realIdx) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Color(0xff3b3b3b),
              child: Container(
                // width: displayWidth(context),
                padding: EdgeInsets.all(15.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      days[index],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        MeasureSize(
                          onChange: (size) {
                            height = size.height;
                            print("log" + height.toString());
                            setState(() {});
                          },
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: operationalHours[days[index]].length,
                              itemBuilder: (context, i) {
                                return Text(operationalHours[days[index]][i]);
                              }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          options: new CarouselOptions(
              autoPlay: false,
              viewportFraction: 1.0,
              height: height,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
    );
  }
}
