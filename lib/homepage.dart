import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/task_bloc.dart';
import 'package:mytask/bloc/task_state.dart';
import 'package:mytask/empty_todo.dart';
import 'package:mytask/report.dart';
import 'package:mytask/task.dart';
import 'package:mytask/tasks.dart';

class HomePage extends StatelessWidget {
  final TabController tabController;
  final GlobalKey<ScaffoldState> sc;

  // final List<Task> tasks;
  final List<Widget> tabBarTaskBody = [
    Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        'Tasks',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    ),
  ];

  HomePage({this.tabController, this.sc});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        BlocBuilder<TaskBloc, TaskState>(builder: (_, state) {
          if (state is TaskOperationFailure) {
            return Text('Could not do course operation');
          }
          if (state is TaskLoadSuccess) {
            final tasks = state.tasks;
            print(tasks.length.toString() + ' b');
            return Tasks(tasks: tasks, sc: sc);
          }
          return Center(child: Text('Loading'));
        }),
        ListView(
          children: [
            Report('day', 200, 120),
            Report('week', 200, 120),
            Report('month', 200, 120),
            Report('all', 200, 120),
          ],
        ),
      ],
    );
  }
}
