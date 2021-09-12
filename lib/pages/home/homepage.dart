import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_event.dart';
import 'package:remindme/bloc/category/category_state.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/bloc/expense/expense_state.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_bloc.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_event.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_state.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/pages/add_transaction/expense/expense_and_income.dart';
import 'package:remindme/pages/add_transaction/expense/expense_list.dart';
import 'package:remindme/pages/home/tasks.dart';
import '../../bloc/task/task_bloc.dart';
import '../../bloc/task/task_state.dart';

// class HomePageb extends StatelessWidget {
//   final TabController tabController;
//
//   final GlobalKey<ScaffoldState> sc;
//
//   final List<Widget> tabBarTaskBody = [
//     Container(
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       child: Text(
//         'Tasks',
//         style: TextStyle(
//             fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
//       ),
//     ),
//   ];
//
//   HomePage({this.tabController,this.sc});
//
//   @override
//   Widget build(BuildContext context) {
//     return TabBarView(
//       controller: tabController,
//       children: [
//         BlocBuilder<ExpenseBloc, ExpenseState>(
//           builder: (_, state) {
//             if (state is AllIncomeAndExpenseFailed) {
//               return Text('Some error happened');
//             }
//             if (state is AllIncomeAndExpenseFetched) {
//               return ExpenseList(
//                 state.allIncomeAndExpense
//               );
//             }
//
//             print(state.toString() + 'stateeeeeeeeee');
//             return Center(child: Text('Loading Income and Expense'));
//           },
//         ),
//         BlocBuilder<TaskBloc, TaskState>(
//           builder: (_, state) {
//             if (state is TaskOperationFailure) {
//               return Text('Some error happened');
//             }
//             if (state is TaskLoadSuccess) {
//               final tasks = state.tasks;
//               print(tasks.length.toString() + ' b');
//               return Tasks(
//                 tasks: tasks,
//                 sc: sc,
//               );
//             }
//             return Center(child: Text('Loading'));
//           },
//         ),
//
//         // ListView(
//         //   children: [
//         //     Report('day', 200, 120),
//         //     Report('week', 200, 120),
//         //     Report('month', 200, 120),
//         //     Report('all', 200, 120),
//         //   ],
//         // ),
//       ],
//     );
//   }
// }
class HomePage extends StatefulWidget {
  final TabController tabController;

  final GlobalKey<ScaffoldState> sc;

  // final List<Widget> tabBarTaskBody = [
  //   Container(
  //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  //     child: Text(
  //       'Tasks',
  //       style: TextStyle(
  //           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
  //     ),
  //   ),
  // ];

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

// List<ExpenseAndIncome> allTransactions = [];
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: [
        BlocBuilder<ExpenseAndIncomeBloc, ExpenseAndIncomeState>(
          builder: (_, state) {
            if (state is AllIncomeAndExpenseFailed) {
              return Text('Some error happened');
            }
            if (state is AllIncomeAndExpenseFetched) {
              print('state isssss $state');
              state.allIncomeAndExpense.forEach((element) {
                print(
                    'check cat ${element.categoryID} subcat ${element.subcategoryID} date ${element.date}');
              });
              return ExpenseList(
                allIncomeAndExpense: state.allIncomeAndExpense,
                allSubcategories: state.allSubcategories,
                allSubSubcategories: state.allSubSubcategories,
              );
            }
            print('state is $state');

            print(state.toString() + 'stateeeeeeeeee');
            return Center(child: Text('Loading'));
          },
        ),
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
