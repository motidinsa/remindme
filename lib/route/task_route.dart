import 'package:flutter/material.dart';
import 'package:remindme/data_provider/task_data.dart';
import 'package:remindme/models/task.dart';
import 'package:remindme/pages/add_reminder/add_reminder.dart';
import 'package:remindme/pages/add_transaction/expense/expense_and_income.dart';
import 'package:remindme/pages/add_transaction/expense/expense_list.dart';
import 'package:remindme/pages/setting/add_category/expense_and_income_category_insert.dart';
import 'package:remindme/repository/expense_repository.dart';

import '../main.dart';

class TaskRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) => MyHomePage(
          expenseRepository: ExpenseRepository(
            dataProvider: TaskDataProvider.instance,
          ),
        ),
      );
    }

    if (settings.name == AddReminder.routeName) {
      TaskArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddReminder(
                args: args,
              ));
    }
    if (settings.name == ExpenseAndIncomePage.routeName) {
      // TaskArgument args = settings.arguments;
      return MaterialPageRoute(builder: (context) => ExpenseAndIncomePage());
    }
    // if (settings.name == ExpenseList.routeName) {
    //   return MaterialPageRoute(builder: (context) => ExpenseList());
    // }
    if (settings.name == ExpenseAndIncomeCategoryInsert.routeName) {
      return MaterialPageRoute(
          builder: (context) => ExpenseAndIncomeCategoryInsert());
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
