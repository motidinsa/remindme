import 'package:flutter/material.dart';

class Todos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Todo1',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                '17:02',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('6 hrs left',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => {},
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('some description',
                      style:
                          TextStyle(fontSize: 18, fontStyle: FontStyle.italic))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
