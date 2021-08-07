import 'package:flutter/material.dart';
import 'package:mytask/models/expense.dart';
import 'package:mytask/models/finished_category.dart';
import 'package:mytask/pages/add_transaction/expense/added_expense.dart';
import 'package:mytask/pages/add_transaction/expense/expense_detail.dart';

class AddedExpenseList extends StatefulWidget {
  final List<FinishedCategory> addedExpense;

  AddedExpenseList(this.addedExpense);

  @override
  _AddedExpenseListState createState() => _AddedExpenseListState();
}

class _AddedExpenseListState extends State<AddedExpenseList> {
  @override
  Widget build(BuildContext context) {
    return widget.addedExpense.length > 0
        ? ListView.separated(
        shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                AddedExpense(widget.addedExpense[index].expenseDetail),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
            itemCount: widget.addedExpense.length)
        : Container();
  }
}
