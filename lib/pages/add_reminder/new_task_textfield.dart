import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/add_reminder/add_reminder_bloc.dart';
import 'package:remindme/bloc/add_reminder/add_reminder_event.dart';

class TaskTextField extends StatefulWidget {
  final String type;
  final TextEditingController textFieldController;

  TaskTextField({this.type, this.textFieldController});

  @override
  _TaskTextFieldState createState() => _TaskTextFieldState();
}

class _TaskTextFieldState extends State<TaskTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.type == 'Name'
          ? EdgeInsets.fromLTRB(50, 40, 50, 20)
          : EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: TextField(
        cursorHeight: 30,
        // controller: widget.textFieldController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.type,
          labelStyle: TextStyle(
            fontSize: 20,
            color: Colors.green,
          ),
          contentPadding: EdgeInsets.all(20),
        ),
        onChanged: (text) => {
          widget.type == 'Name'
              ? BlocProvider.of<AddReminderBloc>(context).add(AddTaskName(text))
              : BlocProvider.of<AddReminderBloc>(context)
                  .add(AddTaskDescription(text))
        },
      ),
    );
  }
}
