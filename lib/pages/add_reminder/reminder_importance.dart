import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_bloc.dart';
import 'package:mytask/bloc/add_reminder/add_reminder_event.dart';

class ReminderImportance extends StatefulWidget {
  final String importance;

  ReminderImportance(this.importance);

  @override
  _ReminderImportanceState createState() => _ReminderImportanceState();
}

class _ReminderImportanceState extends State<ReminderImportance> {
  // String importanceType = 'None';

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Text(widget.importance),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: PopupMenuButton(

              child: Text(widget.importance == null ? 'Select' : 'Edit'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              // offset: Offset(0, 20),
              padding: EdgeInsets.zero,
              // icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  // height: 200,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<AddReminderBloc>(context)
                          .add(AddTaskReminderImportance('High'));
                      Navigator.of(context).pop();
                      // setState(() {
                      //   importanceType = 'High';
                      //   Navigator.of(context).pop();
                      // });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text('High'),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              'You will be reminded every 15 minute until you mark as seen and continuous notification appears'),
                        ],
                      ),
                    ),
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  // height: 200,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<AddReminderBloc>(context)
                          .add(AddTaskReminderImportance('Medium'));
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text('Medium'),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'You will be reminded once but continuous notification appear',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  // height: 200,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<AddReminderBloc>(context)
                          .add(AddTaskReminderImportance('Low'));
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      // width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          Text('Low'),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'You will be reminded once and no continuous notification appear',
                          ),
                        ],
                      ),
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
