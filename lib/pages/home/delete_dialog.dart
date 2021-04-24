import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/task/task_bloc.dart';
import 'package:mytask/bloc/task/task_event.dart';

class DeleteDialog extends StatelessWidget {
  final GlobalKey<ScaffoldState> sc;
  final int id;

  DeleteDialog({
    this.sc,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
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
            final TaskEvent event = TaskDelete(id);
            BlocProvider.of<TaskBloc>(context).add(event);
            sc.currentState.showSnackBar(
              SnackBar(
                content: Text('Task deleted successfully'),
              ),
            );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
