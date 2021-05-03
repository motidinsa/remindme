import 'package:flutter/material.dart';
import 'package:mytask/pages/add_reminder/new_task_textfield.dart';

class NewTaskNameAndDescription extends StatefulWidget {
  @override
  _NewTaskNameAndDescriptionState createState() =>
      _NewTaskNameAndDescriptionState();
}

class _NewTaskNameAndDescriptionState extends State<NewTaskNameAndDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskTextField(type: 'Name'),
        TaskTextField(type: 'Description (Optional)'),
      ],
    );
  }
}
