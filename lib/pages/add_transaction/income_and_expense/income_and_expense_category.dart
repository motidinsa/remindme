import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';

import 'expense_controller.dart';

class IncomeAndExpenseCategory extends StatefulWidget {
  final String categoryName;
  final Icon icon;
  bool isSelected;
  bool finishedCategory;
  final int categoryID;
  Key key;

  IncomeAndExpenseCategory({
    this.categoryName,
    this.icon,
    this.isSelected,
    this.categoryID,
    this.finishedCategory,
    this.key,
  });

  @override
  _IncomeAndExpenseCategoryState createState() =>
      _IncomeAndExpenseCategoryState();
}

class _IncomeAndExpenseCategoryState extends State<IncomeAndExpenseCategory> {
  bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected != null ? widget.isSelected : null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: widget.categoryID == null
          ? Container()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  child: Container(
                    child: widget.icon,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: isSelected ? Colors.green.shade50 : null,
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(
                      () {
                        isSelected = !isSelected;
                        if (isSelected) {
                          // BlocProvider.of<ExpenseBloc>(context).add(
                          //   AddExpenseCategory(
                          //     IncomeAndExpenseCategory(
                          //         categoryName: widget.categoryName,
                          //         icon: widget.icon,
                          //         isSelected: widget.isSelected,
                          //         categoryID: widget.categoryID,
                          //         finishedCategory: false,
                          //         key: UniqueKey()),
                          //   ),
                          // );
                        } else {
                          // BlocProvider.of<ExpenseBloc>(context).add(
                          //   RemoveExpenseCategory(widget.categoryID),
                          // );
                        }
                      },
                    );
                  },
                ),
                Text(
                  widget.categoryName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
      ),
    );
  }
}
