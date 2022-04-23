import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:remindme/models/reason/add_reason_model.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
  double subcategorySelectPageHeight;
  List<IncomeAndExpenseSubSubCategoryModel> selectedSubSubcategories = [];

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
  int multipleReasonModelId = 0;
  AutoScrollController controller = AutoScrollController();

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < categories.length; i++) {
      categoryList.add(
        IncomeAndExpenseCategorySelect(
          categoryName: categories[i].categoryName,
          icon: Icon(
            IconsHelper.getIconGuessFavorFA(name: categories[i].iconName),
            // color: Colors.black54,
            size: 20,
          ),
          isSelected: false,
          categoryID: categories[i].id,
          finishedCategory: false,
          isAddReasonCategory: true,
          // index: i,
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
        MultipleReasonModel(
            id: multipleReasonModelId++,
            categoryId: categoryId,
            reasonModels: []),
      );
    }

    update();
  }

  void addReason({int categoryId, int subcategoryId, int subSubcategoryId}) {
    // AddReasonModel currentAddReasonModel =
    // multipleReasonModels.firstWhere((element) => element.id == categoryId).;
    for (var element in multipleReasonModels) {
      for (var element in element.reasonModels) {
        element.requestFocus = false;
      }
    }

    multipleReasonModels
        .firstWhere((element) => element.categoryId == categoryId)
        .reasonModels
        .add(
          AddReasonModel(
              categoryId: categoryId,
              id: reasonModelId++,
              requestFocus: true,
              subcategoryId: subcategoryId,
              subSubcategoryId: subSubcategoryId),
        );
    update();
  }

  int getCategoryReasonLength(int categoryId) {
    return multipleReasonModels
        .firstWhere((element) => element.categoryId == categoryId)
        .reasonModels
        .length;
  }

  void removeFocus() {
    for (var element in multipleReasonModels) {
      for (var element in element.reasonModels) {
        element.requestFocus = false;
      }
    }
    update();
  }

  void updateSubcategoryHeight(double givenHeight) {
    if (givenHeight > Get.height / 2) {
      subcategorySelectPageHeight = Get.height / 2;
    }
    update();
  }

  void fetchSubSubcategories(int categoryId, int subcategoryId) {
    selectedSubSubcategories = subSubcategories
        .where((element) =>
            element.categoryID == categoryId &&
            element.subcategoryID == subcategoryId)
        .toList();
    update();
  }

  void changeSelectedSubcategoryColor(int categoryId, int subcategoryId) {
    for (var item in subcategories) {
      item.isSelected = false;
    }
    subcategories
        .firstWhere((element) =>
            element.id == subcategoryId && element.categoryID == categoryId)
        .isSelected = true;
    update();
  }

  void editCategory({
    int categoryId,
    int subcategoryId,
    int subSubcategoryId,
    int reasonModelId,
  }) {
    removeFocus();
    multipleReasonModels
        .firstWhere((element) => element.categoryId == categoryId)
        .reasonModels
        .firstWhere((element) => element.id == reasonModelId)
      ..subcategoryId = subcategoryId
      ..subSubcategoryId = subSubcategoryId
      ..requestFocus = true;

    update();
  }

  void changeReasonName({String reasonName, int categoryId, int id}) {
    multipleReasonModels
        .firstWhere((element) => element.categoryId == categoryId)
        .reasonModels
        .firstWhere((element) => element.id == id)
        .name = reasonName;
    update();
  }

  void changeAmount({double amount, int categoryId, int id}) {
    multipleReasonModels
        .firstWhere((element) => element.categoryId == categoryId)
        .reasonModels
        .firstWhere((element) => element.id == id)
        .amount = amount;
    update();
  }

  void changeLocationName({String locationName, int categoryId, int id}) {
    multipleReasonModels
        .firstWhere((element) => element.categoryId == categoryId)
        .reasonModels
        .firstWhere((element) => element.id == id)
        .location = locationName;
    update();
  }

  void deleteReason({int categoryId, int id}) {
    print('yyyy $categoryId');
    multipleReasonModels
        .firstWhere((element) => element.categoryId == categoryId)
        .reasonModels
        .removeWhere((element) => element.id == id);

    update();
  }

  void deleteCategoryReason({int categoryId}) {
    multipleReasonModels
        .removeWhere((element) => element.categoryId == categoryId);

    update();
  }
}
