import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/bloc/expense/expense_state.dart';
import 'package:remindme/models/income_and_expense.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/single_expense_detail.dart';

class ExpenseList extends StatefulWidget {
  static const routeName = 'ExpenseList';
  final List<IncomeAndExpenseModel> allIncomeAndExpense;
  final List<IncomeAndExpenseSubCategoryModel> allSubcategories;

  final List<IncomeAndExpenseSubSubCategoryModel> allSubSubcategories;

  ExpenseList(
      {this.allIncomeAndExpense,
      this.allSubcategories,
      this.allSubSubcategories});

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => SingleExpenseDetail(
        expense: widget.allIncomeAndExpense[index],
        subcategorymodel: widget.allIncomeAndExpense[index].subcategoryID !=
                null
            ? widget.allSubcategories.firstWhere((element) =>
                element.id == widget.allIncomeAndExpense[index].subcategoryID)
            : null,
        subSubcategorymodel:
        widget.allIncomeAndExpense[index].subSubCategoryId != null
                ? widget.allSubSubcategories.firstWhere((element) =>
                    element.id ==
                    widget.allIncomeAndExpense[index].subSubCategoryId)
                : null,
      ),
      itemCount: widget.allIncomeAndExpense.length,
    );
  }
}
