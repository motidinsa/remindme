import 'package:flutter/material.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense.dart';
import 'package:remindme/repository/expense_repository.dart';

import '../../test.dart';

class MainPageFunctions {
  final ExpenseRepository expenseRepository;

  MainPageFunctions({this.expenseRepository});

  Future showModal(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () async {
                  List<ExpenseAndIncomeCategoryModel> categories =
                      await fetchExpenseCategories();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestExpenseDetail(),
                    ),
                  );
                },
                child: const Text(
                  'Expense',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                )),
            TextButton(
                onPressed: () async {
                  List<ExpenseAndIncomeCategoryModel> categories =
                      await fetchIncomeCategories();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExpenseAndIncomePage(
                        type: 'Income',
                        categories: categories,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Income',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }

  Future<List<ExpenseAndIncomeCategoryModel>> fetchExpenseCategories() async {
    return await expenseRepository.getAllExpenseCategory();
  }

  Future<List<ExpenseAndIncomeCategoryModel>> fetchIncomeCategories() async {
    return await expenseRepository.getAllIncomeCategory();
  }
}
