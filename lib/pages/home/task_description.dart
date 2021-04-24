import 'package:flutter/material.dart';

class TaskDescription extends StatelessWidget {
  final String description;

  TaskDescription({this.description});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        description,
        style: TextStyle(
            fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey[700]),
      ),
    );
  }
}
