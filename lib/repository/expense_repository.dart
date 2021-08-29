import 'package:meta/meta.dart';
import 'package:mytask/data_provider/task_data.dart';
import 'package:mytask/models/expense_and_income.dart';
import 'package:mytask/models/expense_and_income_category.dart';
import 'package:mytask/models/expense_and_income_subcategory.dart';
import 'package:mytask/models/expense_and_income_subsubcategory.dart';
import 'package:mytask/models/expense_tobe_added.dart';
import 'package:mytask/models/finished_category.dart';
import 'package:mytask/models/setting_configuration.dart';
import 'package:mytask/models/task.dart';
import 'package:mytask/pages/add_transaction/expense/expense_detail.dart';

class ExpenseRepository {
  final TaskDataProvider dataProvider;

  ExpenseRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<void> insertExpense(ExpenseTobeAdded expense) async {
    return await dataProvider.insertExpense(expense);
  }

  Future<void> insertExpenses(List<FinishedCategory> finishedCategories,
      List<List<ExpenseDetail>> expenseDetails) async {
    return await dataProvider.insertExpenses(
        finishedCategories, expenseDetails);
  }

  Future<List<ExpenseAndIncome>> allExpenses() async {
    return await dataProvider.allExpenses();
  }

  Future<void> initializeCategoryAndSubcategory() async {
    return await dataProvider.initializeCategoryAndSubcategory();
  }

  Future<List<SettingConfiguration>> getInitializedParameters() async {
    return await dataProvider.getInitializedParameters();
  }

  Future<List<ExpenseAndIncomeCategoryModel>> getAllCategories() async {
    return await dataProvider.getAllCategories();
  }

  Future<List<ExpenseAndIncomeSubCategoryModel>> getAllSubCategories() async {
    return await dataProvider.getAllSubCategories();
  }

  Future<List<ExpenseAndIncomeSubSubCategoryModel>>
      getAllSubSubCategories() async {
    return await dataProvider.getAllSubSubCategories();
  }

  Future<int> insertCategory(ExpenseAndIncomeCategoryModel category) async {
    return await dataProvider.insertCategory(category);
  }

  Future<int> insertSubCategory(
      ExpenseAndIncomeSubCategoryModel subcategory, int categoryID) async {
    return await dataProvider.insertSubCategory(subcategory, categoryID);
  }

  Future<void> insertSubSubCategory(
      List<ExpenseAndIncomeSubSubCategoryModel> subSubcategory,
      int categoryID,
      int subcategoryID) async {
    return await dataProvider.insertSubSubCategory(
        subSubcategory, categoryID, subcategoryID);
  }
}
