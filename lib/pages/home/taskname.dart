import 'package:flutter/material.dart';

class TaskName extends StatelessWidget {
  final String name;

  TaskName({this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
