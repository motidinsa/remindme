import 'package:flutter/material.dart';

class TaskDatetime extends StatelessWidget {
  final String dateAdded;
  final String timeAdded;

  TaskDatetime({this.dateAdded, this.timeAdded});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Date added:   $dateAdded'),
        SizedBox(height: 5),
        Text('Time added:   $timeAdded'),
      ],
    );
  }
}
