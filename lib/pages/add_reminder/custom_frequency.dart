import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:remindme/bloc/add_reminder/add_reminder_state.dart';
import 'custom_time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/add_reminder/add_reminder_bloc.dart';
import 'package:remindme/bloc/add_reminder/add_reminder_event.dart';

// class CustomFrequency extends StatefulWidget {
//   final String customTime;
//   CustomFrequency({this.customTime});
//   @override
//   _CustomFrequencyState createState() => _CustomFrequencyState();
// }
//
// class _CustomFrequencyState extends State<CustomFrequency> {
//   bool hasCustomTime = false;
//   Widget setTime;
//   List<Widget> customDayAndTimeWidget = [];
//
//   String customTime;
//
//   // String timeIn12HrFormat;
//   List<int> daysSelectedInNumFinal = [];
//   List<int> daysSelectedInNumber = [];
//   List<String> daysSelectedInName = [];
//   Map<String, String> daysWithTime = {};
//   List<String> days = [
//     "monday",
//     "tuesday",
//     "wednesday",
//     "thursday",
//     "friday",
//     "saturday",
//     "sunday"
//   ];
//
//   void onTimeChanged(TimeOfDay dateTime) {
//     // setState(
//     //   () {
//     //     timeIn12HrFormat =
//     //     '${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? 'PM' : 'AM'}';
//     //     time =
//     //     '${dateTime.hour}:${dateTime.minute} ($timeIn12HrFormat)';
//     //
//     //
//     //   },
//     // );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             BlocBuilder<AddReminderBloc, AddReminderState>(
//               builder: (_, state) {
//                 if (state is AddTaskTimeAndDateSuccess) {
//                   customTime = state.dateAndtime['time'];
//                   print('inside');
//                   print(customTime);
//                 }
//                 return OutlinedButton(
//                   child: Text(
//                     'Add days',
//                     style: TextStyle(color: Colors.green),
//                   ),
//                   onPressed: () {
//                     // List<int> tempDaysSelectedInNumber = [];
//                     daysSelectedInName = [];
//                     List<int> tempDaysSelectedInNumber = [
//                       ...daysSelectedInNumber
//                     ];
//                     // for(int i in daysSelectedInNum){
//                     //
//                     // }
//                     // daysSelectedInNumFinal.forEach((index) {
//                     //   daysSelectedInName.add(days[index]);
//                     // });
//
//                     daysSelectedInNumber.forEach((index) {
//                       daysSelectedInName.add(days[index]);
//                     });
//                     // print(daysSelectedInName);
//                     // print(daysSelectedInNum);
//                     // print(daysSelectedInNumFinal.toString() + ' final');
//                     return showDialog<void>(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text('Select days for the task'),
//                           contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 0),
//                           content: Container(
//                             // width: 100,
//                             child: GroupButton(
//                                 spacing: 15,
//                                 isRadio: false,
//                                 direction: Axis.horizontal,
//                                 unselectedColor: Colors.grey[200],
//                                 onSelected: (index, isSelected) => isSelected
//                                     ? {
//                                         tempDaysSelectedInNumber.add(index),
//                                         print(tempDaysSelectedInNumber
//                                                 .toString() +
//                                             " days in number")
//                                       }
//                                     : {
//                                         tempDaysSelectedInNumber.remove(index),
//                                         print(tempDaysSelectedInNumber
//                                                 .toString() +
//                                             " days in number")
//                                       },
//                                 // onSelected: (index, isSelected) => isSelected
//                                 //     ? daysSelectedInNum.add(index)
//                                 //     : daysSelectedInNum.remove(index),
//                                 buttons: days,
//                                 selectedButtons: daysSelectedInName),
//                           ),
//                           actions: <Widget>[
//                             TextButton(
//                               child: Text(
//                                 'Ok',
//                                 style: TextStyle(color: Colors.green),
//                               ),
//                               onPressed: () {
//                                 tempDaysSelectedInNumber.sort();
//                                 daysSelectedInNumber = tempDaysSelectedInNumber;
//                                 Map<String, String> daysWithTime = {};
//                                 print(
//                                     daysSelectedInNumber.toString() + ' main');
//                                 // daysSelectedInNumFinal.forEach((index) {
//                                 //   daysSelectedInName.add(days[index]);
//                                 // });
//                                 for (int i = 0;
//                                     i < daysSelectedInNumber.length;
//                                     i++) {
//                                   daysWithTime[days[daysSelectedInNumber[i]]] =
//                                       customTime;
//                                 }
//                                 // daysSelectedInNumber.forEach((index) {
//                                 //
//                                 // });
//                                 debugPrint(daysWithTime.toString());
//                                 customDayAndTimeWidget = [];
//                                 // daysWithTime = {};
//                                 // daysSelectedInNumFinal
//                                 //     .sort((a, b) => a.compareTo(b));
//                                 // print(daysSelectedInNumFinal);
//                                 for (int i = 0;
//                                     i < daysSelectedInNumber.length;
//                                     i++) {
//                                   if (i == daysSelectedInNumber.length - 1) {
//                                     customDayAndTimeWidget.add(
//                                       CustomTime(
//                                         hasCustomTime: hasCustomTime,
//                                         day: days[daysSelectedInNumber[i]],
//                                         customTime: customTime,
//                                       ),
//                                     );
//                                   } else {
//                                     customDayAndTimeWidget.add(
//                                       CustomTime(
//                                         hasCustomTime: hasCustomTime,
//                                         day: days[daysSelectedInNumber[i]],
//                                         customTime: customTime,
//                                       ),
//                                     );
//                                     customDayAndTimeWidget.add(
//                                       Divider(
//                                         color: Colors.grey,
//                                       ),
//                                     );
//                                   }
//                                   print(daysWithTime.toString()+' dwt');
//                                   context
//                                       .read<AddReminderBloc>()
//                                       .add(AddDays(daysWithTime));
//                                 }
//
//                                 // daysSelectedInNumFinal
//                                 //     .sort((a, b) => a.compareTo(b));
//                                 // print(daysSelectedInNumFinal);
//                                 // context
//                                 //     .read<AddReminderBloc>()
//                                 //     .add(AddDays(daysSelectedInNumFinal));
//                                 // print();
//                                 setState(
//                                   () {
//                                     // daysSelectedInNumFinal.forEach((element) {
//                                     //   customDayAndTimeWidgets
//                                     //       .add(Text(days[element]));
//                                     // });
//                                     // customDayAndTimeWidget = CustomDayAndTime(
//                                     //     daysSelectedInNum, hasCustomTime);
//                                   },
//                                 );
//
//                                 Navigator.of(context).pop();
//                               },
//                             )
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//             Expanded(
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('Custom time'),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Switch(
//                         value: hasCustomTime,
//                         onChanged: (value) {
//                           setState(
//                             () {
//                               hasCustomTime = value;
//                               setState(
//                                 () {
//                                   customDayAndTimeWidget = [];
//
//                                   for (int i = 0;
//                                       i < daysSelectedInNumber.length;
//                                       i++) {
//                                     if (i == daysSelectedInNumber.length - 1)
//                                       customDayAndTimeWidget.add(
//                                         CustomTime(
//                                           hasCustomTime: hasCustomTime,
//                                           day: days[daysSelectedInNumber[i]],
//                                           customTime: customTime,
//                                         ),
//                                       );
//                                     else {
//                                       customDayAndTimeWidget.add(
//                                         CustomTime(
//                                           hasCustomTime: hasCustomTime,
//                                           day: days[daysSelectedInNumber[i]],
//                                           customTime: customTime,
//                                         ),
//                                       );
//                                       customDayAndTimeWidget.add(
//                                         Divider(
//                                           color: Colors.grey,
//                                         ),
//                                       );
//                                     }
//                                   }
//                                 },
//                               );
//                               // customDayAndTimeWidget = CustomDayAndTime(
//                               //     daysSelectedInNumFinal, hasCustomTime);
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                       'With custom time disabled, days use the default time set above')
//                 ],
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         // Container(child:Column(children:dayWidgets ,) ,),
//         Container(
//           child: customDayAndTimeWidget.length == 0
//               ? null
//               : Card(
//                   elevation: 5,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: Column(children: customDayAndTimeWidget),
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }
// }

class CustomFrequency extends StatefulWidget {
  final String defaultTime;

  const CustomFrequency({this.defaultTime});

  @override
  _CustomFrequencyState createState() => _CustomFrequencyState();
}

class _CustomFrequencyState extends State<CustomFrequency> {
  bool hasCustomTime = false;
  Widget setTime;
  List<Widget> customDayAndTimeWidget = [];

  String customTime;

  List<int> daysSelectedInNumFinal = [];
  List<int> daysSelectedInNumber = [];
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
                List<int> tempDaysSelectedInNumber = [...daysSelectedInNumber];
                daysSelectedInNumber.forEach((index) {
                  daysSelectedInName.add(days[index]);
                });
                return showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select days for the task'),
                      contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                      content: Container(
                          // width: 100,
                          // child: GroupButton(
                          //     spacing: 15,
                          //     isRadio: false,
                          //     direction: Axis.horizontal,
                          //     unselectedColor: Colors.grey[200],
                          //     onSelected: (index, isSelected) => isSelected
                          //         ? {
                          //             tempDaysSelectedInNumber.add(index),
                          //             print(tempDaysSelectedInNumber.toString() +
                          //                 " days in number")
                          //           }
                          //         : {
                          //             tempDaysSelectedInNumber.remove(index),
                          //             print(tempDaysSelectedInNumber.toString() +
                          //                 " days in number")
                          //           },
                          //     buttons: days,
                          //     selectedButtons: daysSelectedInName),
                          ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Ok',
                            style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () {
                            tempDaysSelectedInNumber.sort();
                            daysSelectedInNumber = tempDaysSelectedInNumber;
                            Map<String, String> daysWithTime = {};
                            for (int i = 0;
                                i < daysSelectedInNumber.length;
                                i++) {
                              daysWithTime[days[daysSelectedInNumber[i]]] =
                                  widget.defaultTime != null
                                      ? widget.defaultTime
                                      : 'None';
                            }
                            debugPrint(daysWithTime.toString() + " test");
                            BlocProvider.of<AddReminderBloc>(context)
                                .add(AddCustomDayTime(daysWithTime));
                            // customDayAndTimeWidget = [];
                            // // daysWithTime = {};
                            // // daysSelectedInNumFinal
                            // //     .sort((a, b) => a.compareTo(b));
                            // // print(daysSelectedInNumFinal);
                            // for (int i = 0;
                            // i < daysSelectedInNumber.length;
                            // i++) {
                            //   if (i == daysSelectedInNumber.length - 1) {
                            //     customDayAndTimeWidget.add(
                            //       CustomTime(
                            //         hasCustomTime: hasCustomTime,
                            //         day: days[daysSelectedInNumber[i]],
                            //         customTime: customTime,
                            //       ),
                            //     );
                            //   } else {
                            //     customDayAndTimeWidget.add(
                            //       CustomTime(
                            //         hasCustomTime: hasCustomTime,
                            //         day: days[daysSelectedInNumber[i]],
                            //         customTime: customTime,
                            //       ),
                            //     );
                            //     customDayAndTimeWidget.add(
                            //       Divider(
                            //         color: Colors.grey,
                            //       ),
                            //     );
                            //   }
                            //   print(daysWithTime.toString()+' dwt');
                            //   context
                            //       .read<AddReminderBloc>()
                            //       .add(AddDays(daysWithTime));
                            // }
                            //
                            // // daysSelectedInNumFinal
                            // //     .sort((a, b) => a.compareTo(b));
                            // // print(daysSelectedInNumFinal);
                            // // context
                            // //     .read<AddReminderBloc>()
                            // //     .add(AddDays(daysSelectedInNumFinal));
                            // // print();
                            // setState(
                            //       () {
                            //     // daysSelectedInNumFinal.forEach((element) {
                            //     //   customDayAndTimeWidgets
                            //     //       .add(Text(days[element]));
                            //     // });
                            //     // customDayAndTimeWidget = CustomDayAndTime(
                            //     //     daysSelectedInNum, hasCustomTime);
                            //   },
                            // );

                            Navigator.of(context).pop();
                          },
                        )
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
                          setState(() {
                            hasCustomTime = value;
                            if (!hasCustomTime)
                              BlocProvider.of<AddReminderBloc>(context)
                                  .add(Clear());
                          });
                          // setState(
                          //   () {
                          //     hasCustomTime = value;
                          //     setState(
                          //       () {
                          //         customDayAndTimeWidget = [];
                          //
                          //         for (int i = 0;
                          //             i < daysSelectedInNumber.length;
                          //             i++) {
                          //           if (i == daysSelectedInNumber.length - 1)
                          //             customDayAndTimeWidget.add(
                          //               CustomTime(
                          //                 hasCustomTime: hasCustomTime,
                          //                 day: days[daysSelectedInNumber[i]],
                          //                 customTime: customTime,
                          //               ),
                          //             );
                          //           else {
                          //             customDayAndTimeWidget.add(
                          //               CustomTime(
                          //                 hasCustomTime: hasCustomTime,
                          //                 day: days[daysSelectedInNumber[i]],
                          //                 customTime: customTime,
                          //               ),
                          //             );
                          //             customDayAndTimeWidget.add(
                          //               Divider(
                          //                 color: Colors.grey,
                          //               ),
                          //             );
                          //           }
                          //         }
                          //       },
                          //     );
                          //     // customDayAndTimeWidget = CustomDayAndTime(
                          //     //     daysSelectedInNumFinal, hasCustomTime);
                          //   },
                          // );
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
        BlocBuilder<AddReminderBloc, AddReminderState>(
          builder: (_, state) {
            if (state is AddCustomDayTimeSuccess) {
              daysWithTime = state.dayWithTime;
              print(daysWithTime.toString() + " here it is");
              // reminderImportance = state.taskReminderImportance;

            }
            return daysWithTime.isEmpty
                ? Container()
                : Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomTime(
                        daysWithTime: daysWithTime,
                        hasCustomTime: hasCustomTime,
                      ),
                    ),
                  );
          },
        ),
        // Container(
        //   child: customDayAndTimeWidget.length == 0
        //       ? null
        //       : Card(
        //           elevation: 5,
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(vertical: 10),
        //             child: Column(children: customDayAndTimeWidget),
        //           ),
        //         ),
        // ),
      ],
    );
  }
}
