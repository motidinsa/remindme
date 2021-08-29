import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/category/category_bloc.dart';
import 'package:mytask/bloc/category/category_state.dart';
import 'package:mytask/pages/add_transaction/expense/expense_and_income.dart';
import 'package:mytask/pages/home/tasks.dart';
import '../../bloc/task/task_bloc.dart';
import '../../bloc/task/task_state.dart';

class HomePage extends StatelessWidget {
  final TabController tabController;
  final GlobalKey<ScaffoldState> sc;

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
        BlocBuilder<TaskBloc, TaskState>(
          builder: (_, state) {
            if (state is TaskOperationFailure) {
              return Text('Some error happened');
            }
            if (state is TaskLoadSuccess) {
              final tasks = state.tasks;
              print(tasks.length.toString() + ' b');
              return Tasks(tasks: tasks, sc: sc);
            }
            return Center(child: Text('Loading'));
          },
        ),
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (_, state) {
            if (state is CategoryInsertErrorOccurred) {
              return Text('Some error happened');
            }
            if (state is CategoryInitialized) {
              return ExpenseAndIncomePage(
                categories: state.categories,
                subcategories: state.subcategories,
                subSubcategories: state.subSubcategories,
              );
            }

            print(state.toString() + 'stateeeeeeeeee');
            return Center(child: Text('Initializing categories'));
          },
        ),
        // ListView(
        //   children: [
        //     Report('day', 200, 120),
        //     Report('week', 200, 120),
        //     Report('month', 200, 120),
        //     Report('all', 200, 120),
        //   ],
        // ),
      ],
    );
  }
}
