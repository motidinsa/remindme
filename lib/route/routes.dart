import 'package:flutter/material.dart';
import 'package:remindme/data_provider/task_data.dart';
import 'package:remindme/models/task.dart';
import 'package:remindme/pages/add_reminder/add_reminder.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense.dart';
import 'package:remindme/pages/main/main_page.dart';
import 'package:remindme/pages/setting/add_category/expense_and_income_category_insert.dart';
import 'package:remindme/repository/expense_repository.dart';

import '../test.dart';
import '../test3.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) => MainPage(
          expenseRepository: ExpenseRepository(
            dataProvider: TaskDataProvider.instance,
          ),
        ),
      );
      // return MaterialPageRoute(
      //   builder: (context) => CategoryCard(),
      // );
    }

    if (settings.name == AddReminder.routeName) {
      TaskArgument args = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => AddReminder(
          args: args,
        ),
      );
    }
    if (settings.name == ExpenseAndIncomePage.routeName) {
      return MaterialPageRoute(
        builder: (context) => ExpenseAndIncomePage(),
      );
    }
    if (settings.name == ExpenseAndIncomeCategoryInsert.routeName) {
      return MaterialPageRoute(
          builder: (context) => ExpenseAndIncomeCategoryInsert());
    }
    return MaterialPageRoute(builder: (context) => MainPage());
  }
}

class TaskArgument {
  final Task task;
  final bool edit;

  TaskArgument({this.task, this.edit});
}
