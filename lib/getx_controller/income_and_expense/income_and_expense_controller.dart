import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:remindme/helper/icons_helper.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/category_card_model.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/income_and_expense_category_select_model.dart';
import 'package:remindme/models/multiple_category_card_model.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/multiple_category_card.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class IncomeAndExpenseController extends GetxController {
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
  ];
  List<IncomeAndExpenseSubCategoryModel> subcategories;
  List<IncomeAndExpenseSubSubCategoryModel> subSubcategories;

  int categoryModelId = 0;
  int currentCarouselPosition = 0;
  List<MultipleCategoryCardModel> categoryModels = [];
  List<IncomeAndExpenseCategorySelect> categoryList = [];

  double categoryListHeight;
  double categoryHeight;
  double subcategorySelectPageHeight;
  bool isCategoryHeightSet = false;
  bool makeCategoryListScrollable = false;

  @override
  void onInit() {
    super.onInit();
    for (var element in categories) {
      categoryList.add(IncomeAndExpenseCategorySelect(
          categoryName: element.categoryName,
          icon: Icon(
            IconsHelper.getIconGuessFavorFA(name: element.iconName),
            color: Colors.black54,
            size: 25,
          ),
          isSelected: false,
          categoryID: element.id,
          finishedCategory: false,
          key: UniqueKey()));
    }
  }

  void addIncomeAndExpense(
      IncomeAndExpenseCategorySelectModel incomeAndExpenseCategory) {
    categoryList
        .firstWhere((element) =>
            element.categoryID == incomeAndExpenseCategory.categoryID)
        .isSelected = true;

    int categoryId = incomeAndExpenseCategory.categoryID;
    categoryModels.add(
      MultipleCategoryCardModel(
        categoryId: categoryId,
        categoryCardModels: [
          CategoryCardModel(
              id: categoryModelId++,
              categoryId: categoryId,
              categoryName: incomeAndExpenseCategory.categoryName,
              isLastItem: true,
              frequency: 1)
        ],
      ),
    );

    update();
  }

  void setCurrentPosition(int index) {
    currentCarouselPosition = index;
    update();
  }

  void removeCategory(int categoryId) {
    categoryList
        .firstWhere((element) => element.categoryID == categoryId)
        .isSelected = false;
    categoryModels.removeWhere((element) => element.categoryId == categoryId);
    update();
  }

  void updateCategoryCardHeight(double givenHeight) {
    categoryHeight = givenHeight;
    isCategoryHeightSet = true;
    print('cat height $categoryHeight');
    update();
  }

  void updateSubcategoryHeight(double givenHeight) {
    subcategorySelectPageHeight = givenHeight;
    if (subcategorySelectPageHeight > Get.height / 2) {
      subcategorySelectPageHeight = Get.height / 2;
    }
    // isCategoryHeightSet = true;
    print('subcat height $subcategorySelectPageHeight');
    update();
  }

  void updateCategoryListHeight(double givenHeight) {
    categoryListHeight = givenHeight;
    if (categoryListHeight > Get.height / 4) {
      categoryListHeight = Get.height / 4;
    }
    // isCategoryHeightSet = true;
    // print('subcat height $subcategorySelectPageHeight');
    update();
  }

  void addAnotherItem(int categoryId, int id) {
    List<CategoryCardModel> categoryModel = categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels;

    categoryModel.last.isLastItem = false;
    categoryModel.add(
      CategoryCardModel(
          id: categoryModels.length,
          isLastItem: true,
          categoryName: categoryModel.last.categoryName,
          categoryId: categoryModel.last.categoryId,
          frequency: 1),
    );
    update();
  }

  void changeAmountValue(int id, int categoryId, String givenAmount) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .netAmount = givenAmount;
    update();
  }

  void changeFrequency(int id, int categoryId, String givenFrequency) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .frequency = int.parse(givenFrequency);

    update();
  }

  void increaseFrequencyValue(int id, int categoryId) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .frequency++;
    update();
  }

  void decreaseFrequencyValue(int id, int categoryId) {
    if (categoryModels
            .firstWhere((element) => element.categoryId == categoryId)
            .categoryCardModels
            .firstWhere((element) => element.id == id)
            .frequency >
        1) {
      categoryModels
          .firstWhere((element) => element.categoryId == categoryId)
          .categoryCardModels
          .firstWhere((element) => element.id == id)
          .frequency--;
    }
    update();
  }

  void changeReason(int id, int categoryId, String reason) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .reason = reason;
    update();
  }

  void changeLocation(int id, int categoryId, String location) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .location = location;
    update();
  }
}
