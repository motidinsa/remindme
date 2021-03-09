import 'package:flutter/material.dart';

class Reason extends StatefulWidget {
  @override
  _ReasonState createState() => _ReasonState();
}

class _ReasonState extends State<Reason> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 20, top: 20, right: 20,bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Food',
            style: TextStyle(
                fontSize: 20,
                color: Colors.brown,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 4,
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        left: 20, top: 15, bottom: 15, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'reason 1 cdbjhb',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '15 records',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  color: Colors.black54,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding:
                    EdgeInsets.only(
                        left: 20, top: 15, bottom: 15, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'reason 2 cdbjhb',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '13 records',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  color: Colors.black54,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding:
                    EdgeInsets.only(
                        left: 20, top: 15, bottom: 15, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'reason 3 cdbjhb',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '16 records',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  color: Colors.black54,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding:
                    EdgeInsets.only(
                        left: 20, top: 15, bottom: 15, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'reason 4 cdbjhb',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '12 records',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }
}
