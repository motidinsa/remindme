import 'package:flutter/material.dart';

class SingleCustomDayAndTime extends StatelessWidget {
  final String day;
  final String time;

  SingleCustomDayAndTime({this.day, this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  day,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                // alignment: Alignment.centerRight,
                child: Text(
                  time,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
