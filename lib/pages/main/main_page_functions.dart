import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense.dart';
import 'package:remindme/repository/expense_repository.dart';

import '../../test.dart';
import '../../test3.dart';

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
                  // List<IncomeAndExpenseCategoryModel> categories =
                  //     await fetchExpenseCategories();
                  List<IncomeAndExpenseCategoryModel> categories = [
                    IncomeAndExpenseCategoryModel(
                        categoryType: 'Expense',
                        id: 1,
                        categoryName: 'Transport',
                        iconType: 'material',
                        iconName: 'account_balance'),
                    IncomeAndExpenseCategoryModel(
                        categoryType: 'Expense',
                        id: 2,
                        categoryName: 'Food',
                        iconType: 'material',
                        iconName: 'account_balance'),
                    IncomeAndExpenseCategoryModel(
                        categoryType: 'Expense',
                        id: 3,
                        categoryName: 'Other',
                        iconType: 'material',
                        iconName: 'account_balance'),
                  ];
                  Get.to(() => ExpenseAndIncomePage(
                        type: 'Expense',
                        categories: categories,
                      ));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ExpenseAndIncomePage(
                  //       type: 'Income',
                  //       categories: categories,
                  //     ),
                  //   ),
                  // );
                },
                child: const Text(
                  'Expense',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                )),
            TextButton(
                onPressed: () async {
                  List<IncomeAndExpenseCategoryModel> categories =
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

  Future<List<IncomeAndExpenseCategoryModel>> fetchExpenseCategories() async {
    return await expenseRepository.getAllExpenseCategory();
  }

  Future<List<IncomeAndExpenseCategoryModel>> fetchIncomeCategories() async {
    return await expenseRepository.getAllIncomeCategory();
  }
}
