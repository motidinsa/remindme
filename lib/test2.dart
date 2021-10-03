import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'helper/widget_size.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  double categoryHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          WidgetSize(
            onChange: (Size size) {
              setState(() {
                categoryHeight = size.height;
              });
            },
            child: SizedBox(
              height: categoryHeight,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Select Category for your reason',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: categoryHeight != null
                ? MediaQuery.of(context).size.height / 2 - categoryHeight
                : categoryHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Card(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                            // color: Colors.green.shade100,
                            child: InkWell(
                              onTap: () {},
                              // color: Colors.green,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    const Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Text(
                                          'aees',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                      children: const [
                                        Expanded(
                                          flex: 2,
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.green.shade100,
                            height: 10,
                          ),
                          itemCount: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Card(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                            // color: Colors.green.shade100,
                            child: InkWell(
                              onTap: () {},
                              // color: Colors.green,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    const Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Text(
                                          'aees',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                      children: const [
                                        Expanded(
                                          flex: 2,
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.green.shade100,
                            height: 10,
                          ),
                          itemCount: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
