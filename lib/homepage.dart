import 'package:flutter/material.dart';
import 'package:mytodo/report.dart';
import 'package:mytodo/todos.dart';

class HomePage extends StatelessWidget {
  final TabController _tabController;

  HomePage(this._tabController);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                'ToDo',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            Todos(),
            Todos(),
            Todos(),
            Todos(),
          ],
        ),
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
