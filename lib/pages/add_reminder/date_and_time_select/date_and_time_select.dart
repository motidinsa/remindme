import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/add_reminder/add_reminder_bloc.dart';
import 'package:remindme/bloc/add_reminder/add_reminder_event.dart';
import 'package:remindme/bloc/add_reminder/add_reminder_state.dart';
import 'package:remindme/pages/add_reminder/date_and_time_select/date_select_calender.dart';
import 'package:remindme/pages/add_reminder/date_and_time_select/time_select.dart';

class DateAndTimeSelect extends StatelessWidget {
  List<String> days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];
  List<int> daysSelectedInNumber = [];
  Map<String, String> daysWithTime = {};

  @override
  Widget build(BuildContext context) {
    Map<String, String> datesWithTime = {};
    return Container(
      padding: EdgeInsets.only(top: 10),
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
                    child: BlocBuilder<AddReminderBloc, AddReminderState>(
                      builder: (_, state) {
                        if (state is AddTaskDateSuccess) {
                          datesWithTime['date'] = state.date;
                        }
                        if (state is AddTaskTimeSuccess) {
                          datesWithTime['time'] = state.time;
                        }
                        if (state is AddCustomDayTimeSuccess) {
                          daysWithTime = state.dayWithTime;
                        }
                        return Text(
                          'OK',
                          style: TextStyle(color: Colors.green),
                        );
                      },
                    ),
                    onPressed: () {
                      BlocProvider.of<AddReminderBloc>(context)
                          .add(AddTimeOnly(datesWithTime['time']));
                      BlocProvider.of<AddReminderBloc>(context)
                          .add(AddTaskDateAndTime(datesWithTime));
                      daysWithTime.forEach((key, value) {
                        daysWithTime[key] = datesWithTime['time'];
                      });
                      // BlocProvider.of<AddReminderBloc>(context)
                      //     .add(AddCustomDayTime(daysWithTime));

                      Navigator.pop(context);
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
