import 'package:flutter/material.dart';
import 'package:remindme/pages/home/single_custom_day_and_time.dart';

class CustomDayAndTime extends StatelessWidget {
  final Map<String, dynamic> daysWithTime;

  CustomDayAndTime({this.daysWithTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width * .5,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: daysWithTime.entries
            .map(
              (item) => SingleCustomDayAndTime(
                day: item.key,
                time: item.value.toString(),
              ),
            )
            .toList(),
      ),
    );
  }
}
