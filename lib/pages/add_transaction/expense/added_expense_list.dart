import 'package:flutter/material.dart';
import 'package:mytask/models/expense.dart';
import 'package:mytask/pages/add_transaction/expense/added_expense.dart';

class AddedExpenseList extends StatefulWidget {
  final List<List<Expense>> addedExpense;

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
                AddedExpense(widget.addedExpense[index]),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
            itemCount: widget.addedExpense.length)
        : Container();
  }
}
