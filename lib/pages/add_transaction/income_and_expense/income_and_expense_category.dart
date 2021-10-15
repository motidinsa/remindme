import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/income_and_expense_category_select_model.dart';

import 'expense_controller.dart';

class IncomeAndExpenseCategorySelect extends StatefulWidget {
  final String categoryName;
  final Icon icon;
  bool isSelected;
  bool finishedCategory;
  final int categoryID;
  Key key;

  IncomeAndExpenseCategorySelect({
    this.categoryName,
    this.icon,
    this.isSelected,
    this.categoryID,
    this.finishedCategory,
    this.key,
  });

  @override
  _IncomeAndExpenseCategorySelectState createState() =>
      _IncomeAndExpenseCategorySelectState();
}

class _IncomeAndExpenseCategorySelectState
    extends State<IncomeAndExpenseCategorySelect> {
  bool isSelected;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
    print(incomeAndExpenseController == null);
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
                          incomeAndExpenseController.addIncomeAndExpense(
                            IncomeAndExpenseCategorySelectModel(
                              categoryName: widget.categoryName,
                              icon: widget.icon,
                              isSelected: widget.isSelected,
                              categoryID: widget.categoryID,
                              finishedCategory: false,
                            ),
                          );
                          // BlocProvider.of<ExpenseBloc>(context).add(
                          //   AddExpenseCategory(
                          //     IncomeAndExpenseCategorySelect(
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
