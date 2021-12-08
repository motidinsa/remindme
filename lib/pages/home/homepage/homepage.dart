import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_event.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_bloc.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_event.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_state.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_list.dart';
import 'package:remindme/pages/home/homepage/transaction_list.dart';
import 'package:remindme/pages/home/tasks.dart';
import '../../../bloc/task/task_bloc.dart';
import '../../../bloc/task/task_state.dart';

class HomePage extends StatefulWidget {
  final TabController tabController;

  final GlobalKey<ScaffoldState> sc;

  HomePage({this.tabController, this.sc});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(CheckInitialization());
    BlocProvider.of<ExpenseAndIncomeBloc>(context)
        .add(GetAllIncomeAndExpense());
  }
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: [
        TransactionList(),
        // BlocBuilder<ExpenseAndIncomeBloc, ExpenseAndIncomeState>(
        //   builder: (_, state) {
        //     if (state is AllIncomeAndExpenseFailed) {
        //       return Text('Some error happened');
        //     }
        //     if (state is AllIncomeAndExpenseFetched) {
        //       print('state isssss $state');
        //       state.allIncomeAndExpense.forEach((element) {
        //         print(
        //             'check cat ${element.categoryID} subcat ${element.subcategoryID} date ${element.date}');
        //       });
        //        ExpenseList(
        //         allIncomeAndExpense: state.allIncomeAndExpense,
        //         allSubcategories: state.allSubcategories,
        //         allSubSubcategories: state.allSubSubcategories,
        //       )
        // }
        //     print('state is $state');
        //
        //     print(state.toString() + 'stateeeeeeeeee');
        //     return Center(child: Text('Loading'));
        //   },
        // ),
        BlocBuilder<TaskBloc, TaskState>(
          builder: (_, state) {
            if (state is TaskOperationFailure) {
              return Text('Some error happened');
            }
            if (state is TaskLoadSuccess) {
              final tasks = state.tasks;
              print(tasks.length.toString() + ' b');
              return Tasks(
                tasks: tasks,
                sc: widget.sc,
              );
            }
            return Center(child: Text('Loading'));
          },
        ),
      ],
    );
  }
}
