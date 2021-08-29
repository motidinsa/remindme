import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/expense/expense_bloc.dart';
import 'package:mytask/bloc/expense/expense_event.dart';
import 'package:mytask/bloc/expense/expense_state.dart';
import 'package:mytask/models/expense_and_income.dart';
import 'package:mytask/pages/add_transaction/expense/single_expense_detail.dart';

class ExpenseList extends StatefulWidget {
  static const routeName = 'ExpenseList';

  ExpenseList();

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  List<ExpenseAndIncome> expense = [
    ExpenseAndIncome(
      categoryName: 'Transport',
      date: '11/09/2021',
      reason: 'Alembank - Mexico',
      netAmount: 4,
      subcategoryName: 'Anbessa',
    ),
    ExpenseAndIncome(
      categoryName: 'Transport',
      date: '11/09/2021',
      reason: 'dhgcjhdgchgdjgcj - hvkdfhvkdhkv',
      netAmount: 5,
      subcategoryName: 'Sheger',
    ),
    ExpenseAndIncome(
      categoryName: 'Transport',
      date: '11/09/2021',
      reason: 'asssddas - hvkdfhvkdhkv',
      netAmount: 5,
      subcategoryName: 'Sheger',
    ),
    ExpenseAndIncome(
      categoryName: 'Transport',
      date: '11/09/2021',
      reason: 'dhgcjhdgchgdjgcj - hvkdfhvkdhkv',
      netAmount: 3,
      subcategoryName: 'Anbessa',
    )
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExpenseBloc>(context).add(LoadAllExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense List'),
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (_, state) {
          if (state is ExpenseLoadingFailed) {
            return Text('Some error happened');
          }
          if (state is AllExpenseLoaded) {
            final List<ExpenseAndIncome> expenses = state.allExpenses;
            // print(tasks.length.toString() + ' b');
            return ListView.builder(
              itemBuilder: (context, index) => SingleExpenseDetail(
                expense: expenses[index],
              ),
              itemCount: expenses.length,
            );
          }
          return Center(child: Text('Loading'));
        },
      ),
    );
  }
}
