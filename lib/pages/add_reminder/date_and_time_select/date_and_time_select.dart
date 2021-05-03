import 'package:flutter/material.dart';
import 'package:mytask/pages/add_reminder/date_and_time_select/date_select_calender.dart';
import 'package:mytask/pages/add_reminder/date_and_time_select/time_select.dart';

class DateAndTimeSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          DateSelect(),
          SelectTime(),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: OutlinedButton(
                    // textTheme: ButtonTextTheme.accent,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(8.0),
                    // ),
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () =>
                    {
                      // setState(
                      //       () {
                      //     _dateController.text = date;
                      //     Navigator.pop(context);
                      //   },
                      // )
                      // DateTime date = Datetime
                    },
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
