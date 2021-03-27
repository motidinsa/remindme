import 'package:flutter/material.dart';
import 'package:mytodo/empty_todo.dart';
import 'package:mytodo/report.dart';
import 'package:mytodo/task.dart';
import 'package:mytodo/tasks.dart';

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
        Tasks(sc: sc),
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
