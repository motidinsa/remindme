import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';

class SelectTime extends StatefulWidget {
  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  String time;
  String timeIn12HrFormat;

  void onTimeChanged(TimeOfDay dateTime) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(
            Icons.alarm,
            color: Colors.brown,
          ),
          TextButton(
            // textTheme: ButtonTextTheme.accent,
            // shape: RoundedRectangleBorder(
            //   borderRadius:
            //   BorderRadius.circular(8.0),
            // ),
            child: time == null
                ? Text('Set time')
                : Text(
              time,
              style: TextStyle(color: Colors.green),
            ),
            onPressed: () =>
            {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  is24HrFormat: true,
                  value: TimeOfDay.now(),
                  onChange: onTimeChanged,
                  disableHour: false,
                  disableMinute: false,
                  onChangeDateTime: (DateTime dateTime) {
                    setState(
                          () {
                        timeIn12HrFormat =
                        '${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime
                            .hour}:${dateTime.minute} ${dateTime.hour > 12
                            ? 'PM'
                            : 'AM'}';
                        time =
                        '${dateTime.hour}:${dateTime
                            .minute} ($timeIn12HrFormat)';
                        // _timeController.text = time;
                      },
                    );
                    print(dateTime);
                  },
                ),
              )
            },
          ),
        ],
      ),
    );
  }
}
