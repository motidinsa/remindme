import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:mytask/models/task.dart';
import 'package:mytask/pages/add_reminder/new_task_name_and_description.dart';
import 'package:mytask/pages/add_reminder/recur_period.dart';
import 'package:mytask/pages/add_reminder/recur_period_select.dart';
import 'package:mytask/pages/add_reminder/reminder_importance.dart';
import 'package:mytask/pages/add_reminder/selected_date_and_time.dart';
import 'package:mytask/pages/add_reminder/set_time_button.dart';
import 'package:mytask/route/task_route.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../bloc/add_reminder/add_reminder_bloc.dart';
import '../../bloc/add_reminder/add_reminder_event.dart';
import '../../bloc/add_reminder/add_reminder_state.dart';
import '../../bloc/task/task_bloc.dart';
import '../../bloc/task/task_event.dart';
import 'custom_frequency.dart';

class AddReminder extends StatefulWidget {
  static const routeName = 'taskAddUpdate';
  final TaskArgument args;

  AddReminder({this.args});

  @override
  _AddReminderState createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  String name = '';
  String description = '';
  String notificationType;
  String time;
  String timeIn12HrFormat;
  String date;
  bool dateSelected = false;
  String currentDate;
  String currentTime;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  String _selectedDate;
  String _dateCount;
  String _range;
  String _rangeCount;
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);
  bool iosStyle = true;

  // SqliteDB database = SqliteDB.instance;

  bool hasCustomTime = false;
  bool hasRecurringPeriod = false;
  bool hasFrequency = false;
  Widget recurSelect;
  Widget frequencySwitch;
  Widget customFrequencySelect;
  Widget customTimeSelect;

  Map<String, String> dayTime = {};
  Map<String, String> values;

  @override
  void initState() {
    super.initState();
    if (widget.args.edit) {
      _nameController.text = widget.args.task.name;
      _descriptionController.text = widget.args.task.description;
      _dateController.text = widget.args.task.date;
      _timeController.text = widget.args.task.time;
      notificationType = widget.args.task.importance;
    }
  }

  void setCurrentTimeAndDate() {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat("dd-MM-yy");
    DateFormat timeFormat = DateFormat("HH:mm:ss");
    currentDate = dateFormat.format(now);
    currentTime = timeFormat.format(now);
  }

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

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
        date =
            '${DateTime.parse(_selectedDate).day > 9 ? DateTime.parse(_selectedDate).day : '0${DateTime.parse(_selectedDate).day}'}-${DateTime.parse(_selectedDate).month > 9 ? DateTime.parse(_selectedDate).month : '0${DateTime.parse(_selectedDate).month}'}-${DateTime.parse(_selectedDate).year}';

        print(date);
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  Future<void> _showDeleteDialog() async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete task?'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                    'The task can not be recovered so be sure when you remove a task'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                final TaskEvent event = TaskDelete(widget.args.task.id);
                BlocProvider.of<TaskBloc>(context).add(event);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Task deleted successfully'),
                  ),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<AddReminderBloc>(context).add(Clear());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.args.edit ? 'Edit' : 'Add'} task'),
          actions: widget.args.edit
              ? <Widget>[
                  PopupMenuButton(
                    offset: Offset(0, 20),
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('Remove'),
                          onTap: () {
                            Navigator.of(context).pop();
                            _showDeleteDialog();
                          },
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ]
              : <Widget>[
                  PopupMenuButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    offset: Offset(0, 20),
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        // height: 200,
                        child: Container(
                          // width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              Text('High'),
                              Text(
                                  'You will be reminded every 15 minute until you mark as seen and continuous notification appears'),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        // height: 200,
                        child: Container(
                          // width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              Text('Medium'),
                              Text(
                                'You will be reminded once but continuous notification appear',
                              ),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        // height: 200,
                        child: Container(
                          // width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              Text('Low'),
                              Text(
                                'You will be reminded once and no continuous notification appear',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            // shrinkWrap: true,
            children: [
              NewTaskNameAndDescription(),
              SetTimeButton(),

              // Container(
              //   margin: EdgeInsets.fromLTRB(50, 40, 50, 20),
              //   child: TextField(
              //     cursorHeight: 30,
              //     controller: _nameController,
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'Name',
              //         labelStyle: TextStyle(
              //           fontSize: 20,
              //           color: Colors.green,
              //         ),
              //         contentPadding: EdgeInsets.all(20)),
              //     onChanged: (text) => {name = text},
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              //   child: TextField(
              //     cursorHeight: 30,
              //     controller: _descriptionController,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: 'Description (Optional)',
              //       labelStyle: TextStyle(
              //         fontSize: 20,
              //         color: Colors.green,
              //       ),
              //       contentPadding: EdgeInsets.all(20),
              //     ),
              //     onChanged: (text) => {description = text},
              //   ),
              // ),

              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(35, 10, 0, 10),
              //     child: FlatButton(
              //       textTheme: ButtonTextTheme.accent,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //       ),
              //       child: Text(
              //         'Set time and date',
              //         style: TextStyle(fontSize: 20, color: Colors.green),
              //       ),
              //       onPressed: () {
              //         showModalBottomSheet(
              //           isScrollControlled: true,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //           ),
              //           context: context,
              //           builder: (context) => StatefulBuilder(
              //             builder: (context, setState) {
              //               return Container(
              //                 padding: EdgeInsets.only(top: 20),
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     SfDateRangePicker(
              //                       onSelectionChanged: _onSelectionChanged,
              //                       showNavigationArrow: true,
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(left: 10),
              //                       child: Row(
              //                         children: [
              //                           Icon(
              //                             Icons.alarm,
              //                             color: Colors.brown,
              //                           ),
              //                           FlatButton(
              //                             textTheme: ButtonTextTheme.accent,
              //                             shape: RoundedRectangleBorder(
              //                               borderRadius:
              //                                   BorderRadius.circular(8.0),
              //                             ),
              //                             onPressed: () => {
              //                               Navigator.of(context).push(
              //                                 showPicker(
              //                                   context: context,
              //                                   is24HrFormat: true,
              //                                   value: _time,
              //                                   onChange: onTimeChanged,
              //                                   disableHour: false,
              //                                   disableMinute: false,
              //                                   onChangeDateTime:
              //                                       (DateTime dateTime) {
              //                                     setState(
              //                                           () {
              //                                         timeIn12HrFormat =
              //                                         '${dateTime.hour > 12
              //                                             ? dateTime.hour - 12
              //                                             : dateTime
              //                                             .hour}:${dateTime
              //                                             .minute} ${dateTime
              //                                             .hour > 12
              //                                             ? 'PM'
              //                                             : 'AM'}';
              //                                         time =
              //                                         '${dateTime
              //                                             .hour}:${dateTime
              //                                             .minute} ($timeIn12HrFormat)';
              //                                         _timeController.text =
              //                                             time;
              //                                       },
              //                                     );
              //
              //                                     print(dateTime);
              //                                   },
              //                                 ),
              //                               )
              //                             },
              //                             child: time == null
              //                                 ? Text('Set time')
              //                                 : Text(
              //                                     time,
              //                                     style: TextStyle(
              //                                         color: Colors.green),
              //                                   ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.end,
              //                       children: [
              //                         Container(
              //                           margin: EdgeInsets.only(right: 20),
              //                           child: OutlineButton(
              //                             textTheme: ButtonTextTheme.accent,
              //                             shape: RoundedRectangleBorder(
              //                               borderRadius:
              //                                   BorderRadius.circular(8.0),
              //                             ),
              //                             onPressed: () => {
              //                               setState(
              //                                     () {
              //                                   _dateController.text = date;
              //                                   Navigator.pop(context);
              //                                 },
              //                               )
              //                               // DateTime date = Datetime
              //                             },
              //                             child: Text(
              //                               'OK',
              //                               style:
              //                                   TextStyle(color: Colors.green),
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               );
              //             },
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),

              BlocBuilder<AddReminderBloc, AddReminderState>(
                builder: (_, state) {
                  if (state is AddTaskTimeAndDateSuccess) {
                    values = state.dateAndtime;

                    return SelectedDateAndTime(values: [
                      state.dateAndtime['date'],
                      state.dateAndtime['time']
                    ]);
                  }
                  return values == null
                      ? Container()
                      : SelectedDateAndTime(
                          values: [values['date'], values['time']]);
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
              //         child: TextField(
              //           readOnly: true,
              //           enabled: false,
              //           cursorHeight: 30,
              //           controller: _dateController,
              //           decoration: InputDecoration(
              //               border: OutlineInputBorder(),
              //               labelText: 'Date',
              //               labelStyle: TextStyle(
              //                 fontSize: 18,
              //                 color: Colors.green,
              //               ),
              //               contentPadding: EdgeInsets.only(left: 20)),
              //           onChanged: (text) => {name = text},
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
              //         // width: 100,
              //         child: TextField(
              //           readOnly: true,
              //           enabled: false,
              //           cursorHeight: 30,
              //           controller: _timeController,
              //           decoration: InputDecoration(
              //               border: OutlineInputBorder(),
              //               labelText: 'Time',
              //               labelStyle: TextStyle(
              //                 fontSize: 18,
              //                 color: Colors.green,
              //               ),
              //               contentPadding: EdgeInsets.only(left: 20)),
              //           // onChanged: (text) => {name = text},
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              ReminderImportance(),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 30),
              //   // margin: EdgeInsets.only(top: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Reminder importance',
              //         style:
              //         TextStyle(fontSize: 18, color: Colors.orangeAccent),
              //       ),
              //       Container(
              //         padding: EdgeInsets.all(20),
              //         child: DropdownButton(
              //           value: notificationType,
              //           hint: Text('Select'),
              //           items: [
              //             DropdownMenuItem(
              //               child: Text('High'),
              //               value: 'High',
              //             ),
              //             DropdownMenuItem(
              //               child: Text('Medium'),
              //               value: 'Medium',
              //             ),
              //             DropdownMenuItem(
              //               child: Text('Low'),
              //               value: 'Low',
              //             )
              //           ],
              //           onChanged: (value) {
              //             setState(
              //               () {
              //                 notificationType = value;
              //               },
              //             );
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // RecurPeriodSelect(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Recurring period',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            child: Switch(
                              value: hasRecurringPeriod,
                              onChanged: (value) {
                                setState(
                                  () {
                                    hasRecurringPeriod = value;
                                  },
                                );
                                if (!value) {
                                  hasFrequency = false;
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(flex: 2, child: Container()),
                        Expanded(
                          flex: 3,
                          child: Text(
                              'With recurring period disabled, tasks appear every week with the days set'),
                        )
                      ],
                    ),
                    if (hasRecurringPeriod) RecurPeriod(),
                    if (hasRecurringPeriod)
                      Row(
                        children: [
                          Text(
                            'Custom Frequency',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                          Expanded(
                            child: Align(
                              child: Switch(
                                value: hasFrequency,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      hasFrequency = value;
                                    },
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    if (hasFrequency) CustomFrequency(),
                    // Container(child: recurSelect),
                    // Container(child: frequencySwitch),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 50, bottom: 10),
                padding: EdgeInsets.all(10),
                child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<AddReminderBloc, AddReminderState>(
                      builder: (_, state) {
                        if (state is AddDaysSuccess) {
                          dayTime.containsKey(state.days.keys.first)
                              ? dayTime.update(state.days.keys.first,
                                  (value) => state.days.values.first)
                              : dayTime.addAll(state.days);
                          context.read<AddReminderBloc>().add(Clear());
                          print(dayTime);
                        }
                        return ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Map<String, String> dayMap = {};
                            List<String> days = [
                              "monday",
                              "tuesday",
                              "wednesday",
                              "thursday",
                              "friday",
                              "saturday",
                              "sunday"
                            ];
                            for (int i = 0; i < days.length; i++) {
                              if (dayTime.containsKey(days[i])) {
                                dayMap[days[i]] = dayTime[days[i]];
                              } else {
                                dayMap[days[i]] = null;
                              }
                            }
                            setCurrentTimeAndDate();
                            if (widget.args.edit)
                              BlocProvider.of<TaskBloc>(context).add(
                                TaskUpdate(
                                  Task(
                                      id: widget.args.task.id,
                                      name: 'update ${widget.args.task.id}',
                                      description: 'cnjd',
                                      date: 'urgfyc',
                                      time: 'asknx',
                                      importance: 'Medium',
                                      dateAdded: currentDate,
                                      timeAdded: currentTime),
                                ),
                              );
                            else {
                              context.read<TaskBloc>().add(
                                    TaskCreate(
                                      Task(
                                          name: 'Task name',
                                          description:
                                              'This is a short description for the task',
                                          date: values==null?'some day':values['date'],
                                          time: values==null?'some day':values['time'],
                                          importance: 'Medium',
                                          dateAdded: currentDate,
                                          timeAdded: currentTime,
                                          customFrequency: 1,
                                          recurTime: '3 day',
                                          daysWithTime: dayMap),
                                    ),
                                  );
                            }
                            Navigator.of(context).pop();
                            BlocProvider.of<AddReminderBloc>(context).add(Clear());
                            // Navigator.of(context).pushReplacementNamed('/');
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class RecurPeriod extends StatefulWidget {
//   @override
//   _RecurPeriodState createState() => _RecurPeriodState();
// }
//
// class _RecurPeriodState extends State<RecurPeriod> {
//   String timeRange;
//   String name;
//   bool hasFrequency = false;
//   TextEditingController _durationController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Every'),
//           SizedBox(
//             width: 10,
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 10),
//             width: MediaQuery.of(context).size.width / 8,
//             child: TextField(
//               cursorHeight: 20,
//               controller: _durationController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelStyle: TextStyle(
//                   fontSize: 20,
//                   color: Colors.green,
//                 ),
//                 isDense: true,
//                 contentPadding: EdgeInsets.all(10),
//               ),
//               onChanged: (text) => {name = text},
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(20),
//             child: DropdownButton(
//               value: timeRange,
//               hint: Text('Select duration'),
//               items: [
//                 DropdownMenuItem(
//                   child: Text('Day'),
//                   value: 'Day',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('Week'),
//                   value: 'Week',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('Month'),
//                   value: 'Month',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('Year'),
//                   value: 'Year',
//                 )
//               ],
//               onChanged: (value) {
//                 setState(
//                   () {
//                     timeRange = value;
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomFrequency extends StatefulWidget {
//   @override
//   _CustomFrequencyState createState() => _CustomFrequencyState();
// }
//
// class _CustomFrequencyState extends State<CustomFrequency> {
//   bool hasCustomTime = false;
//   Widget setTime;
//   List<Widget> customDayAndTimeWidget = [];
//   TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);
//   TextEditingController _timeController = TextEditingController();
//
//   // String time;
//   // String timeIn12HrFormat;
//   List<int> daysSelectedInNumFinal = [];
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
//             OutlinedButton(
//               onPressed: () {
//                 daysSelectedInName = [];
//                 List<int> daysSelectedInNum = [...daysSelectedInNumFinal];
//                 // for(int i in daysSelectedInNum){
//                 //
//                 // }
//                 daysSelectedInNumFinal.forEach((index) {
//                   daysSelectedInName.add(days[index]);
//                 });
//                 print(daysSelectedInName);
//                 print(daysSelectedInNum);
//                 print(daysSelectedInNumFinal.toString() + ' final');
//                 return showDialog<void>(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Select days for the task'),
//                       contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 0),
//                       content: Container(
//                         // width: 100,
//                         child: GroupButton(
//                             spacing: 15,
//                             isRadio: false,
//                             direction: Axis.horizontal,
//                             unselectedColor: Colors.grey[200],
//                             onSelected: (index, isSelected) => isSelected
//                                 ? daysSelectedInNum.add(index)
//                                 : daysSelectedInNum.remove(index),
//                             buttons: days,
//                             selectedButtons: daysSelectedInName),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           child: Text(
//                             'Ok',
//                             style: TextStyle(color: Colors.green),
//                           ),
//                           onPressed: () {
//                             // setState(() {
//                             //
//                             // });
//
//                             daysSelectedInNumFinal = daysSelectedInNum;
//                             // sortDays(daysSelectedInNumFinal);
//                             print(daysSelectedInNumFinal.toString() + ' f2');
//                             // daysSelectedInNumFinal.forEach((index) {
//                             //   daysSelectedInName.add(days[index]);
//                             // });
//
//                             customDayAndTimeWidget = [];
//                             daysWithTime = {};
//                             // daysSelectedInNumFinal
//                             //     .sort((a, b) => a.compareTo(b));
//                             print(daysSelectedInNumFinal);
//                             for (int i = 0;
//                                 i < daysSelectedInNumFinal.length;
//                                 i++) {
//                               if (i == daysSelectedInNumFinal.length - 1) {
//                                 customDayAndTimeWidget.add(
//                                   CustomTime(
//                                     hasCustomTime: hasCustomTime,
//                                     day: days[daysSelectedInNumFinal[i]],
//                                   ),
//                                 );
//                               } else {
//                                 customDayAndTimeWidget.add(
//                                   CustomTime(
//                                     hasCustomTime: hasCustomTime,
//                                     day: days[daysSelectedInNumFinal[i]],
//                                   ),
//                                 );
//                                 customDayAndTimeWidget.add(
//                                   Divider(
//                                     color: Colors.grey,
//                                   ),
//                                 );
//                               }
//                               context.read<AddReminderBloc>().add(AddDays(
//                                   {days[daysSelectedInNumFinal[i]]: '17:00'}));
//                             }
//
//                             // daysSelectedInNumFinal
//                             //     .sort((a, b) => a.compareTo(b));
//                             // print(daysSelectedInNumFinal);
//                             // context
//                             //     .read<AddReminderBloc>()
//                             //     .add(AddDays(daysSelectedInNumFinal));
//                             // print();
//                             setState(
//                               () {
//                                 // daysSelectedInNumFinal.forEach((element) {
//                                 //   customDayAndTimeWidgets
//                                 //       .add(Text(days[element]));
//                                 // });
//                                 // customDayAndTimeWidget = CustomDayAndTime(
//                                 //     daysSelectedInNum, hasCustomTime);
//                               },
//                             );
//
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Text(
//                 'Add days',
//                 style: TextStyle(color: Colors.green),
//               ),
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
//                                       i < daysSelectedInNumFinal.length;
//                                       i++) {
//                                     if (i == daysSelectedInNumFinal.length - 1)
//                                       customDayAndTimeWidget.add(
//                                         CustomTime(
//                                           hasCustomTime: hasCustomTime,
//                                           day: days[daysSelectedInNumFinal[i]],
//                                         ),
//                                       );
//                                     else {
//                                       customDayAndTimeWidget.add(
//                                         CustomTime(
//                                           hasCustomTime: hasCustomTime,
//                                           day: days[daysSelectedInNumFinal[i]],
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

class CustomTime extends StatefulWidget {
  final bool hasCustomTime;
  final String day;

  final String timeSelected;

  CustomTime({this.hasCustomTime, this.day, this.timeSelected});

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
    return Padding(
      padding: widget.hasCustomTime
          ? const EdgeInsets.symmetric(horizontal: 30)
          : const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child:
                Align(alignment: Alignment.centerLeft, child: Text(widget.day)),
          ),
          // SizedBox(
          //   width: 10,
          // ),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(time ?? '17:00'),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: widget.hasCustomTime
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
                                  setState(
                                    () {
                                      timeIn12HrFormat =
                                          '${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? 'PM' : 'AM'}';
                                      time =
                                          '${dateTime.hour}:${dateTime.minute}';
                                      // _timeController.text = time;
                                    },
                                  );
                                  context
                                      .read<AddReminderBloc>()
                                      .add(AddDays({widget.day: time}));

                                  print(time);
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
  }
}
