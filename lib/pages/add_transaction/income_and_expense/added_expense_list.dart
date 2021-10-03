import 'package:flutter/material.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/added_expense.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';

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
