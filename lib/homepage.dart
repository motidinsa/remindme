import 'package:flutter/material.dart';
import 'package:mytodo/empty_todo.dart';
import 'package:mytodo/report.dart';
import 'package:mytodo/todos.dart';

class HomePage extends StatelessWidget {
  final TabController _tabController;
  final List<Widget> tabBarTaskBody = [
    Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        'Tasks',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    ),
    Todos(),
    Todos(),
    Todos(),
    Todos(),
  ];

  HomePage(this._tabController);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        EmptyTodo(),
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
