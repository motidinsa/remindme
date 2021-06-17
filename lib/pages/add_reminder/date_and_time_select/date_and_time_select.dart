import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_event.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_state.dart';
import 'package:mytask/pages/add_reminder/date_and_time_select/date_select_calender.dart';
import 'package:mytask/pages/add_reminder/date_and_time_select/time_select.dart';

class DateAndTimeSelect extends StatelessWidget {
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
                          Text(
                            'OK',
                            style: TextStyle(color: Colors.green),
                          );
                        }
                        if (state is AddTaskTimeSuccess) {
                          datesWithTime['time'] = state.time;
                          Text(
                            'OK',
                            style: TextStyle(color: Colors.green),
                          );
                        }
                        return Text(
                          'OK',
                          style: TextStyle(color: Colors.green),
                        );
                      },
                    ),
                    onPressed: (){
                    BlocProvider.of<AddReminderBloc>(context)
                        .add(AddTaskDateAndTime(datesWithTime));
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
