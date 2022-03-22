import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';

class SingleReason extends StatelessWidget {
  final String name;
  final double amount;

  final int reasonID;
  final int categoryID;
  final int subcategoryID;
  final int subSubcategoryID;
  final int index;

  SingleReason(
      {this.amount,
      this.name,
      this.subcategoryID,
      this.categoryID,
      this.subSubcategoryID,
      this.index,
      this.reasonID});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        name,
        style: TextStyle(fontSize: 18, color: Colors.grey),
        textAlign: TextAlign.start,
      ),
      trailing: Text(
        amount.toString(),
        style: TextStyle(fontSize: 18, color: Colors.grey),
        textAlign: TextAlign.start,
      ),
      onTap: () {
        print('single reason id $reasonID');
        BlocProvider.of<ExpenseBloc>(context).add(AddExpenseReasonFromList(
            reasonID: reasonID,
            index: index,
            reason: name,
            subcategoryID: subSubcategoryID,
            subSubcategoryID: subSubcategoryID,
            categoryID: categoryID,
            amount: amount.toString()));
        Navigator.pop(context);
      },
    );
  }
}
