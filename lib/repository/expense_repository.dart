import 'package:meta/meta.dart';
import 'package:remindme/data_provider/task_data.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/expense_tobe_added.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/models/setting_configuration.dart';
import 'package:remindme/models/task.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';
import 'package:remindme/pages/setting/add_reason/sub_subcategory_reason_page.dart';
import 'package:remindme/pages/setting/add_reason/subcategory_reason_page.dart';

class ExpenseRepository {
  final TaskDataProvider dataProvider;

  ExpenseRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<void> insertExpense(ExpenseTobeAdded expense) async {
    return await dataProvider.insertExpense(expense);
  }

  Future<void> insertExpenses(List<FinishedCategory> finishedCategories,
      List<List<ExpenseDetail>> expenseDetails, String type) async {
    return await dataProvider.insertExpenses(
        finishedCategories, expenseDetails, type);
  }

  Future<List<ExpenseAndIncome>> allExpenses() async {
    return await dataProvider.allExpenses();
  }

  Future<List<ExpenseAndIncome>> getAllIncomeAndExpense() async {
    return await dataProvider.getAllIncomeAndExpense();
  }

  Future<void> initializeCategoryAndSubcategory() async {
    return await dataProvider.initializeCategoryAndSubcategory();
  }

  Future<List<SettingConfiguration>> getInitializedParameters() async {
    return await dataProvider.getInitializedParameters();
  }

  Future<List<IncomeAndExpenseCategoryModel>> getAllCategories() async {
    return await dataProvider.getAllCategories();
  }

  Future<List<IncomeAndExpenseCategoryModel>> getAllExpenseCategory() async {
    return await dataProvider.getAllExpenseCategory();
  }

  Future<List<IncomeAndExpenseCategoryModel>> getAllIncomeCategory() async {
    return await dataProvider.getAllIncomeCategory();
  }

  Future<List<IncomeAndExpenseSubCategoryModel>> getAllSubCategories() async {
    return await dataProvider.getAllSubCategories();
  }

  Future<List<IncomeAndExpenseSubCategoryModel>>
      getAllSubCategoriesWithCategoryID(int categoryID) async {
    return await dataProvider.getAllSubCategoriesWithCategoryID(categoryID);
  }

  Future<List<IncomeAndExpenseSubCategoryModel>>
      getSubcategoryWithSubcategoryID(int subcategoryID) async {
    return await dataProvider.getSubcategoryWithSubcategoryID(subcategoryID);
  }

  Future<List<IncomeAndExpenseSubSubCategoryModel>>
      getAllSubSubCategoriesWithSubCategoryID(int subcategoryID) async {
    return await dataProvider
        .getAllSubSubCategoriesWithSubCategoryID(subcategoryID);
  }

  Future<List<IncomeAndExpenseSubSubCategoryModel>>
      getAllSubSubCategories() async {
    return await dataProvider.getAllSubSubCategories();
  }

  Future<int> insertCategory(IncomeAndExpenseCategoryModel category) async {
    return await dataProvider.insertCategory(category);
  }

  Future<int> insertSubCategory(
      IncomeAndExpenseSubCategoryModel subcategory, int categoryID) async {
    return await dataProvider.insertSubCategory(subcategory, categoryID);
  }

  Future<void> updateSubCategory(
      List<IncomeAndExpenseSubCategoryModel> subcategory) async {
    return await dataProvider.updateSubCategory(subcategory);
  }

  Future<void> insertSubSubCategory(
      List<IncomeAndExpenseSubSubCategoryModel> subSubcategory,
      int categoryID,
      int subcategoryID) async {
    return await dataProvider.insertSubSubCategory(
        subSubcategory, categoryID, subcategoryID);
  }

  Future<void> updateSubSubCategory(
    List<IncomeAndExpenseSubSubCategoryModel> subSubcategory,
  ) async {
    return await dataProvider.updateSubSubCategory(subSubcategory);
  }

  Future<void> insertCategoryReason(
    List<Reason> categoryReason,
  ) async {
    return await dataProvider.insertCategoryReason(categoryReason);
  }

  Future<void> insertSubCategoryReason(
    List<SubCategoryReasonPage> subcategoryReason,
  ) async {
    return await dataProvider.insertSubCategoryReason(subcategoryReason);
  }

  Future<void> insertSubSubCategoryReason(
    List<List<Reason>> subsubcategoryReason,
  ) async {
    return await dataProvider.insertSubSubCategoryReason(subsubcategoryReason);
  }

  Future<List<Reason>> getCategoryReasons(int categoryID) async {
    return await dataProvider.getCategoryReasons(categoryID);
  }

  Future<List<Reason>> getSubCategoryReasons(int subcategoryID) async {
    return await dataProvider.getSubCategoryReasons(subcategoryID);
  }

  Future<List<Reason>> getSubSubCategoryReasons(int subsubcategoryID) async {
    return await dataProvider.getSubSubCategoryReasons(subsubcategoryID);
  }
}
