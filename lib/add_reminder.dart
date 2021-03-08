import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddReminder extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(50, 40, 50, 20),
            child: TextField(
              cursorHeight: 30,
              controller: _nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                  contentPadding: EdgeInsets.all(20)),
              onChanged: (text) => {name = text},
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: TextField(
              cursorHeight: 30,
              controller: _descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description (Optional)',
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
                contentPadding: EdgeInsets.all(20),
              ),
              onChanged: (text) => {description = text},
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(35, 10, 0, 10),
              child: FlatButton(
                textTheme: ButtonTextTheme.accent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  'Set time and date',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SfDateRangePicker(
                                onSelectionChanged: _onSelectionChanged,
                                showNavigationArrow: true,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.brown,
                                    ),
                                    FlatButton(
                                      textTheme: ButtonTextTheme.accent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      onPressed: () => {
                                        Navigator.of(context).push(
                                          showPicker(
                                            context: context,
                                            is24HrFormat: true,
                                            value: _time,
                                            onChange: onTimeChanged,
                                            disableHour: false,
                                            disableMinute: false,
                                            onChangeDateTime:
                                                (DateTime dateTime) {
                                              setState(
                                                () {
                                                  timeIn12HrFormat =
                                                      '${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? 'PM' : 'AM'}';
                                                  time =
                                                      '${dateTime.hour}:${dateTime.minute} ($timeIn12HrFormat)';
                                                  _timeController.text = time;
                                                },
                                              );

                                              print(dateTime);
                                            },
                                          ),
                                        )
                                      },
                                      child: time == null
                                          ? Text('Set time')
                                          : Text(
                                              time,
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: OutlineButton(
                                      textTheme: ButtonTextTheme.accent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      onPressed: () => {
                                        setState(
                                          () {
                                            _dateController.text = date;
                                            Navigator.pop(context);
                                          },
                                        )
                                        // DateTime date = Datetime
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: TextField(
                    readOnly: true,
                    enabled: false,
                    cursorHeight: 30,
                    controller: _dateController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                        contentPadding: EdgeInsets.only(left: 20)),
                    onChanged: (text) => {name = text},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  // width: 100,
                  child: TextField(
                    readOnly: true,
                    enabled: false,
                    cursorHeight: 30,
                    controller: _timeController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Time',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                        contentPadding: EdgeInsets.only(left: 20)),
                    // onChanged: (text) => {name = text},
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            // margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reminder importance',
                  style: TextStyle(fontSize: 18, color: Colors.orangeAccent),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: DropdownButton(
                    value: notificationType,
                    hint: Text('Select'),
                    items: [
                      DropdownMenuItem(
                        child: Text('High'),
                        value: 'High',
                      ),
                      DropdownMenuItem(
                        child: Text('Medium'),
                        value: 'Medium',
                      ),
                      DropdownMenuItem(
                        child: Text('Low'),
                        value: 'Low',
                      )
                    ],
                    onChanged: (value) {
                      setState(
                        () {
                          notificationType = value;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 50),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () => {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
