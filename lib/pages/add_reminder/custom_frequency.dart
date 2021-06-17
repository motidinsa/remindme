import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'custom_time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_event.dart';

class CustomFrequency extends StatefulWidget {
  @override
  _CustomFrequencyState createState() => _CustomFrequencyState();
}

class _CustomFrequencyState extends State<CustomFrequency> {
  bool hasCustomTime = false;
  Widget setTime;
  List<Widget> customDayAndTimeWidget = [];
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);
  TextEditingController _timeController = TextEditingController();

  // String time;
  // String timeIn12HrFormat;
  List<int> daysSelectedInNumFinal = [];
  List<String> daysSelectedInName = [];
  Map<String, String> daysWithTime = {};
  List<String> days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];

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
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              child: Text(
                'Add days',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                daysSelectedInName = [];
                List<int> daysSelectedInNum = [...daysSelectedInNumFinal];
                // for(int i in daysSelectedInNum){
                //
                // }
                daysSelectedInNumFinal.forEach((index) {
                  daysSelectedInName.add(days[index]);
                });
                print(daysSelectedInName);
                print(daysSelectedInNum);
                print(daysSelectedInNumFinal.toString() + ' final');
                return showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select days for the task'),
                      contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                      content: Container(
                        // width: 100,
                        child: GroupButton(
                            spacing: 15,
                            isRadio: false,
                            direction: Axis.horizontal,
                            unselectedColor: Colors.grey[200],
                            onSelected: (index, isSelected) => isSelected
                                ? daysSelectedInNum.add(index)
                                : daysSelectedInNum.remove(index),
                            buttons: days,
                            selectedButtons: daysSelectedInName),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Ok',
                            style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () {
                            // setState(() {
                            //
                            // });

                            daysSelectedInNumFinal = daysSelectedInNum;
                            // sortDays(daysSelectedInNumFinal);
                            print(daysSelectedInNumFinal.toString() + ' f2');
                            // daysSelectedInNumFinal.forEach((index) {
                            //   daysSelectedInName.add(days[index]);
                            // });

                            customDayAndTimeWidget = [];
                            daysWithTime = {};
                            // daysSelectedInNumFinal
                            //     .sort((a, b) => a.compareTo(b));
                            print(daysSelectedInNumFinal);
                            for (int i = 0;
                                i < daysSelectedInNumFinal.length;
                                i++) {
                              if (i == daysSelectedInNumFinal.length - 1) {
                                customDayAndTimeWidget.add(
                                  CustomTime(
                                    hasCustomTime: hasCustomTime,
                                    day: days[daysSelectedInNumFinal[i]],
                                  ),
                                );
                              } else {
                                customDayAndTimeWidget.add(
                                  CustomTime(
                                    hasCustomTime: hasCustomTime,
                                    day: days[daysSelectedInNumFinal[i]],
                                  ),
                                );
                                customDayAndTimeWidget.add(
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                );
                              }
                              context.read<AddReminderBloc>().add(AddDays(
                                  {days[daysSelectedInNumFinal[i]]: '17:00'}));
                            }

                            // daysSelectedInNumFinal
                            //     .sort((a, b) => a.compareTo(b));
                            // print(daysSelectedInNumFinal);
                            // context
                            //     .read<AddReminderBloc>()
                            //     .add(AddDays(daysSelectedInNumFinal));
                            // print();
                            setState(
                              () {
                                // daysSelectedInNumFinal.forEach((element) {
                                //   customDayAndTimeWidgets
                                //       .add(Text(days[element]));
                                // });
                                // customDayAndTimeWidget = CustomDayAndTime(
                                //     daysSelectedInNum, hasCustomTime);
                              },
                            );

                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Custom time'),
                      SizedBox(
                        width: 10,
                      ),
                      Switch(
                        value: hasCustomTime,
                        onChanged: (value) {
                          setState(
                            () {
                              hasCustomTime = value;
                              setState(
                                () {
                                  customDayAndTimeWidget = [];

                                  for (int i = 0;
                                      i < daysSelectedInNumFinal.length;
                                      i++) {
                                    if (i == daysSelectedInNumFinal.length - 1)
                                      customDayAndTimeWidget.add(
                                        CustomTime(
                                          hasCustomTime: hasCustomTime,
                                          day: days[daysSelectedInNumFinal[i]],
                                        ),
                                      );
                                    else {
                                      customDayAndTimeWidget.add(
                                        CustomTime(
                                          hasCustomTime: hasCustomTime,
                                          day: days[daysSelectedInNumFinal[i]],
                                        ),
                                      );
                                      customDayAndTimeWidget.add(
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                      );
                                    }
                                  }
                                },
                              );
                              // customDayAndTimeWidget = CustomDayAndTime(
                              //     daysSelectedInNumFinal, hasCustomTime);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'With custom time disabled, days use the default time set above')
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        // Container(child:Column(children:dayWidgets ,) ,),
        Container(
          child: customDayAndTimeWidget.length == 0
              ? null
              : Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: customDayAndTimeWidget),
                  ),
                ),
        ),
      ],
    );
  }
}
