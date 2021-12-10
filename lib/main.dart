import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/completed_task/completed_task_bloc.dart';
import 'package:remindme/bloc/completed_task/completed_task_event.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/repository/expense_repository.dart';
import 'package:remindme/repository/task_repository.dart';
import 'app.dart';
import 'bloc/add_reminder/add_reminder_bloc.dart';
import 'bloc/category/category_event.dart';
import 'bloc/expense_and_income/expense_and_income_bloc.dart';
import 'bloc/expense_and_income/expense_and_income_event.dart';
import 'bloc/reason/reason_bloc.dart';
import 'bloc/reason/reason_event.dart';
import 'bloc/task/task_bloc.dart';
import 'bloc/task/task_event.dart';
import 'data_provider/task_data.dart';
import 'database_models/category/category_model.dart';
import 'database_models/income_and_expense/income_and_expense_model.dart';
import 'database_models/setting/setting_model.dart';
import 'getx_controller/income_and_expense/transaction_controller.dart';

void main() async {
  final TaskRepository taskRepository = TaskRepository(
    dataProvider: TaskDataProvider.instance,
  );
  final ExpenseRepository expenseRepository = ExpenseRepository(
    dataProvider: TaskDataProvider.instance,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(SettingModelAdapter());
  Hive.registerAdapter(IncomeAndExpenseModelAdapter());
  await Hive.openBox<IncomeAndExpenseModel>('income_and_expense');
  Get.put(TransactionController());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
            create: (context) => TaskBloc(taskRepository: taskRepository)
              ..add(const TaskLoad())),
        BlocProvider<AddReminderBloc>(
          create: (context) => AddReminderBloc(),
        ),
        BlocProvider<CompletedTaskBloc>(
          create: (context) => CompletedTaskBloc(taskRepository: taskRepository)
            ..add(const CompletedTaskLoad()),
        ),
        BlocProvider<ExpenseBloc>(
          create: (context) =>
              ExpenseBloc(expenseRepository: expenseRepository),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) =>
              CategoryBloc(expenseRepository: expenseRepository)
                ..add(CheckInitialization()),
        ),
        BlocProvider<ReasonBloc>(
          create: (context) => ReasonBloc(expenseRepository: expenseRepository)
            ..add(const GetAllCategories()),
        ),
        BlocProvider<ExpenseAndIncomeBloc>(
          create: (context) =>
              ExpenseAndIncomeBloc(expenseRepository: expenseRepository)
                ..add(const GetAllIncomeAndExpense()),
        )
      ],
      child: MyApp(
        taskRepository: taskRepository,
      ),
    ),
  );
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  // ));
}
