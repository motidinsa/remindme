import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';

import '../../database_models/category/category_model.dart';
import '../../database_models/reason/reason_model.dart';
import '../../database_models/setting/setting_model.dart';
import '../../helper/icons_helper.dart';
import '../../models/expense_and_income_category.dart';
import '../../models/expense_and_income_subcategory.dart';
import '../../models/expense_and_income_subsubcategory.dart';
import 'package:flutter/material.dart';

import '../../models/reason/multiple_reason_model.dart';
import '../../pages/add_transaction/income_and_expense/income_and_expense_category.dart';

class ReasonController extends GetxController {
  final List<IncomeAndExpenseCategoryModel> categories = [
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 1,
        categoryName: 'Transport',
        iconType: 'material',
        iconName: 'account_balance',
        subcategoryCount: 3),
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
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 4,
        categoryName: 'Other',
        iconType: 'material',
        iconName: 'account_balance'),
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 5,
        categoryName: 'Otherrsx ssc',
        iconType: 'material',
        iconName: 'account_balance'),
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 6,
        categoryName: 'Otherrsx ssc',
        iconType: 'material',
        iconName: 'account_balance'),
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 7,
        categoryName: 'Othehh gfd rrsx ssc',
        iconType: 'material',
        iconName: 'account_balance'),
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 8,
        categoryName: 'Otherrsx ssc',
        iconType: 'material',
        iconName: 'account_balance'),
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 9,
        categoryName: 'Otherrjbjhbj bsx ssc',
        iconType: 'material',
        iconName: 'account_balance'),
  ];
  List<IncomeAndExpenseSubCategoryModel> subcategories = [
    IncomeAndExpenseSubCategoryModel(
      subcategoryType: 'Expense',
      id: 1,
      categoryID: 1,
      subcategoryName: 'Bus',
      iconType: 'material',
      iconName: 'account_balance',
      subSubcategoryCount: 3,
      isSelected: false,
    ),
    IncomeAndExpenseSubCategoryModel(
      subcategoryType: 'Expense',
      id: 2,
      categoryID: 1,
      subcategoryName: 'Taxi',
      iconType: 'material',
      iconName: 'account_balance',
      subSubcategoryCount: 3,
      isSelected: false,
    ),
    IncomeAndExpenseSubCategoryModel(
      subcategoryType: 'Expense',
      id: 3,
      categoryID: 1,
      subcategoryName: 'Bajaj',
      iconType: 'material',
      iconName: 'account_balance',
      subSubcategoryCount: 0,
      isSelected: false,
    ),
  ];
  final List<IncomeAndExpenseSubSubCategoryModel> subSubcategories = [
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 1,
      categoryID: 1,
      subcategoryID: 1,
      subSubcategoryName: 'Anbessa',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 2,
      categoryID: 1,
      subcategoryID: 1,
      subSubcategoryName: 'Sheger',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 3,
      categoryID: 1,
      subcategoryID: 1,
      subSubcategoryName: 'public',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 4,
      categoryID: 1,
      subcategoryID: 2,
      subSubcategoryName: 'sc',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 5,
      categoryID: 1,
      subcategoryID: 2,
      subSubcategoryName: 'qw',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 6,
      categoryID: 1,
      subcategoryID: 3,
      subSubcategoryName: 'ewwww',
    ),
  ];
  ScrollController parentScrollController = ScrollController();
  List<IncomeAndExpenseCategorySelect> categoryList = [];
  bool isInitialized = false;
  String categoryType;
  List<CategoryModel> category = [];
  double categoryListHeight;
  List<MultipleReasonModel> multipleReasonModels = [];
  int reasonModelId = 0;

  @override
  void onInit() {
    super.onInit();
    for (var element in categories) {
      categoryList.add(
        IncomeAndExpenseCategorySelect(
          categoryName: element.categoryName,
          icon: Icon(
            IconsHelper.getIconGuessFavorFA(name: element.iconName),
            // color: Colors.black54,
            size: 20,
          ),
          isSelected: false,
          categoryID: element.id,
          finishedCategory: false,
          isAddReasonCategory: true,
          // key: UniqueKey(),
        ),
      );
    }
  }

  void addReasonCategory(int categoryId) {
    bool categoryExists = false;
    for (MultipleReasonModel element in multipleReasonModels) {
      if (element.categoryId == categoryId) {
        categoryExists = true;
        break;
      }
    }
    if (!categoryExists) {
      multipleReasonModels.add(
        MultipleReasonModel(categoryId: categoryId, reasonModels: []),
      );
    }

    update();
  }

  void addReason(int categoryId) {
    multipleReasonModels
        .firstWhere((element) => element.categoryId == categoryId)
        .reasonModels
        .add(ReasonModel(categoryId: categoryId, id: reasonModelId++));
    update();
  }

  int getCategoryReasonLength(int categoryId) {
    return multipleReasonModels
        .firstWhere((element) => element.categoryId == categoryId)
        .reasonModels
        .length;
  }
}
