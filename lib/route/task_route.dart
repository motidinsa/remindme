import 'package:flutter/material.dart';
import 'package:mytask/models/task.dart';
import 'package:mytask/pages/add_reminder/add_reminder.dart';
import 'package:mytask/pages/add_transaction/expense/expense.dart';

import '../main.dart';

class TaskRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => MyHomePage());
    }

    if (settings.name == AddReminder.routeName) {
      TaskArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddReminder(
                args: args,
              ));
    }
    if (settings.name == ExpensePage.routeName) {
      // TaskArgument args = settings.arguments;
      return MaterialPageRoute(builder: (context) => ExpensePage());
    }
    // if (settings.name == CourseDetail.routeName) {
    //   Course course = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => CourseDetail(
    //         course: course,
    //       ));
    // }

    return MaterialPageRoute(builder: (context) => MyHomePage());
  }
}

class TaskArgument {
  final Task task;
  final bool edit;

  TaskArgument({this.task, this.edit});
}
