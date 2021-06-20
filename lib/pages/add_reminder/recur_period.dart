import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_event.dart';

class RecurPeriod extends StatefulWidget {
  final String duration;

  RecurPeriod(this.duration);

  @override
  _RecurPeriodState createState() => _RecurPeriodState();
}

class _RecurPeriodState extends State<RecurPeriod> {
  String timeRange;

  // String name;
  // bool hasFrequency = false;
  TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Every'),
          SizedBox(
            width: 10,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery
                .of(context)
                .size
                .width / 8,
            child: TextField(
              cursorHeight: 20,
              controller: _durationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(10),
              ),
              onChanged: (text) => {
                BlocProvider.of<AddReminderBloc>(context)
                    .add(AddTaskRecurNumber(text))
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: DropdownButton(
              value: widget.duration,
              hint: Text('Select duration'),
              items: [
                DropdownMenuItem(
                  child: Text('Day'),
                  value: 'Day',
                ),
                DropdownMenuItem(
                  child: Text('Week'),
                  value: 'Week',
                ),
                DropdownMenuItem(
                  child: Text('Month'),
                  value: 'Month',
                ),
                DropdownMenuItem(
                  child: Text('Year'),
                  value: 'Year',
                )
              ],
              onChanged: (value) {
                BlocProvider.of<AddReminderBloc>(context)
                    .add(AddTaskRecurDuration(value));
                // setState(
                //       () {
                //     timeRange = value;
                //   },
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
