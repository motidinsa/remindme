import 'package:flutter/material.dart';
import 'package:remindme/pages/add_reminder/selected_datetime_textfield.dart';

class SelectedDateAndTime extends StatelessWidget {
  final List<String> values;

  SelectedDateAndTime({this.values});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SelectedDateTime(
            type: 'Date',
            value: values[0],
          ),
        ),
        Expanded(
          child: SelectedDateTime(
            type: 'Time',
            value: values[1],
          ),
        ),
      ],
    );
  }
}
