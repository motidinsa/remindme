import 'package:flutter/material.dart';
import 'package:remindme/pages/add_reminder/date_and_time_select/date_and_time_select.dart';

class SetTimeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(60, 10, 0, 10),
        child: TextButton(
          // textTheme: ButtonTextTheme.accent,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(5.0),
          // ),
          child: Text(
            'Set time and date',
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) => DateAndTimeSelect(),
            );
          },
        ),
      ),
    );
  }
}
