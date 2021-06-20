import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_event.dart';

class CustomTime extends StatefulWidget {
  final Map<String, String> daysWithTime;
  final bool hasCustomTime;

  CustomTime({this.daysWithTime, this.hasCustomTime});

  @override
  _CustomTimeState createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  TimeOfDay _time = TimeOfDay.now();
  String time;
  String timeIn12HrFormat;

  // List<String>

  // TextEditingController _timeController = TextEditingController();

  void onTimeChanged(TimeOfDay dateTime) {
    // setState(
    //   () {
    //     timeIn12HrFormat =
    //     '${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? 'PM' : 'AM'}';
    //     time =
    //     '${dateTime.hour}:${dateTime.minute} ($timeIn12HrFormat)';
    //
    //
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    // widget.daysWithTime.forEach((key, value) {return Container(child: Text('hi'),);});
    print(widget.daysWithTime.isEmpty.toString() + "   sssssss");
    return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: widget.daysWithTime.entries.map((entry) {
          return Padding(
            padding: widget.hasCustomTime == true
                ? const EdgeInsets.symmetric(horizontal: 30)
                : const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.centerLeft, child: Text(entry.key)),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(entry.value),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: widget.hasCustomTime == true
                            ? OutlinedButton(
                                child: Text(
                                  'Set time',
                                  style: TextStyle(color: Colors.green),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    showPicker(
                                      context: context,
                                      is24HrFormat: true,
                                      value: _time,
                                      onChange: onTimeChanged,
                                      disableHour: false,
                                      disableMinute: false,
                                      onChangeDateTime: (DateTime dateTime) {
                                        Map<String, String> tempDaysWithTime =
                                            widget.daysWithTime;
                                        setState(
                                          () {
                                            timeIn12HrFormat =
                                                '${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? 'PM' : 'AM'}';
                                            time =
                                                '${dateTime.hour}:${dateTime.minute}';
                                            tempDaysWithTime[entry.key] = time;
                                            // _timeController.text = time;
                                          },
                                        );
                                        BlocProvider.of<AddReminderBloc>(
                                                context)
                                            .add(AddCustomDayTime(
                                                tempDaysWithTime));
                                        // BlocProvider.of(context).add(AddDays({widget.day: time}));
                                        // context
                                        //     .read<AddReminderBloc>()
                                        //     .add(UpdateDateTime({widget.day: time}));

                                        print(tempDaysWithTime);
                                      },
                                    ),
                                  );
                                },
                              )
                            : null,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {},
                        child: Ink(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.minimize_rounded,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          ;
        }).toList());
    // return Padding(
    //   padding: widget.hasCustomTime
    //       ? const EdgeInsets.symmetric(horizontal: 30)
    //       : const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Expanded(
    //         flex: 2,
    //         child:
    //             Align(alignment: Alignment.centerLeft, child: Text(widget.day)),
    //       ),
    //       // SizedBox(
    //       //   width: 10,
    //       // ),
    //       Expanded(
    //         flex: 5,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //             Text(widget.customTime ?? 'None'),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             Container(
    //               child: widget.hasCustomTime
    //                   ? OutlinedButton(
    //                       child: Text(
    //                         'Set time',
    //                         style: TextStyle(color: Colors.green),
    //                       ),
    //                       onPressed: () {
    //                         Navigator.of(context).push(
    //                           showPicker(
    //                             context: context,
    //                             is24HrFormat: true,
    //                             value: _time,
    //                             onChange: onTimeChanged,
    //                             disableHour: false,
    //                             disableMinute: false,
    //                             onChangeDateTime: (DateTime dateTime) {
    //                               setState(
    //                                 () {
    //                                   timeIn12HrFormat =
    //                                       '${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? 'PM' : 'AM'}';
    //                                   time =
    //                                       '${dateTime.hour}:${dateTime.minute}';
    //                                   // _timeController.text = time;
    //                                 },
    //                               );
    //                               // BlocProvider.of(context).add(AddDays({widget.day: time}));
    //                               context
    //                                   .read<AddReminderBloc>()
    //                                   .add(UpdateDateTime({widget.day: time}));
    //
    //                               print(time);
    //                             },
    //                           ),
    //                         );
    //                       },
    //                     )
    //                   : null,
    //             ),
    //             SizedBox(
    //               width: 5,
    //             ),
    //             InkWell(
    //               borderRadius: BorderRadius.circular(100),
    //               onTap: () {},
    //               child: Ink(
    //                 padding: EdgeInsets.all(5),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(100),
    //                 ),
    //                 child: Icon(
    //                   Icons.minimize_rounded,
    //                   color: Colors.red,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
