import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:remindme/helper/icons_helper.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/models/income_and_expense_category_select_model.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/multiple_category_card.dart';

class IncomeAndExpenseController extends GetxController {
  final List<IncomeAndExpenseCategoryModel> categories = [
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
  List<IncomeAndExpenseCategorySelectModel> selectedCategories = [];
  List<IncomeAndExpenseSubCategoryModel> subcategories;
  List<IncomeAndExpenseSubSubCategoryModel> subSubcategories;

  // RxList<Widget> selectedCategoriess = [].obs;
  int currentCarouselPosition = 0;
  List<Widget> cardItems = [];
  List<MultipleCategoryCard> carouselLists = [];
  List<Widget> singleCategoryList = [];
  List<Widget> addItems = [];
  List<List<CategoryCard>> expenseDetailList = [];
  List<ExpenseDetail> finishedCategory = [];
  List<FinishedCategory> finishedCategoryList = [];
  bool expenseAdded = false;

  List<ExpenseAndIncome> singleCategoryExpenseList = [];
  List<IncomeAndExpenseCategorySelect> categoryList = [];
  int count = 0;
  double categoryHeight;

  // bool isHeightSet = false;
  bool isCategoryHeightSet = false;

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
    selectedCategories.add(incomeAndExpenseCategory);
    if (!isCategoryHeightSet) {
      singleCategoryList.add(
        WidgetSize(
          onChange: (Size size) {
            updateCategoryCardHeight(size.height);
          },
          child: CategoryCard(),
        ),
      );
      // carouselLists.add(
      //   MultipleCategoryCard(
      //     cardList: [CategoryCard()],
      //   ),
      // );
    }
    // categoryList
    //     .firstWhere((element) =>
    //         element.categoryID == incomeAndExpenseCategory.categoryID)
    //     .isSelected = true;

    List<Widget> singleCategoryMultipleItems = [];
    List<ExpenseAndIncome> singleCategoryMultipleExpenses = [];

    // singleCategoryMultipleItems.add(
    //   ExpenseDetail(
    //       categoryID: incomeAndExpenseCategory.categoryID,
    //       expense: ExpenseAndIncome(
    //           numberOfTimes: 1,
    //           date: 'dateAdded',
    //           categoryID: incomeAndExpenseCategory.categoryID,
    //           categoryName: incomeAndExpenseCategory.categoryName,
    //           dateType: 'gr'),
    //       isLastItem: true),
    // );
    if (!isCategoryHeightSet) {
      singleCategoryMultipleItems.add(
        WidgetSize(
          onChange: (Size size) {
            updateCategoryCardHeight(size.height);
          },
          child: CategoryCard(
            categoryName: incomeAndExpenseCategory.categoryName,
          ),
        ),
      );
      // carouselLists.add(
      //   MultipleCategoryCard(
      //     cardList: [CategoryCard()],
      //   ),
      // );
    } else {
      singleCategoryMultipleItems.add(
        CategoryCard(
          categoryName: incomeAndExpenseCategory.categoryName,
        ),
      );
    }

    carouselLists.add(MultipleCategoryCard(
      cardList: singleCategoryMultipleItems,
    ));
    print('the len is ${carouselLists.length}');
    // singleCategoryMultipleExpenses.add(
    //   ExpenseAndIncome(
    //       numberOfTimes: 1,
    //       date: 'dateAdded',
    //       categoryID: incomeAndExpenseCategory.categoryID,
    //       categoryName: incomeAndExpenseCategory.categoryName,
    //       dateType: 'gr'),
    // );
    // update();
    // expenseDetailList.add(singleCategoryMultipleItems);
    // addCategoryCard(selectedCategories, expenseDetailList);
    // print(cardItems.length);
    // cardItems = convertToCategoryCard(selectedCategories, expenseDetailList);
    update();
  }

  void setCurrentPosition(int index) {
    currentCarouselPosition = index;
    update();
  }

  // void addCategoryCard(List<IncomeAndExpenseCategorySelectModel> expenses,
  //     List<List<CategoryCard>> expenseDetail) {
  //   // cardItems.add(Text('added'));
  //
  //   cardItems.add(
  //
  //   );
  //   cardItems
  //   update();
  // }
  void updateCategoryCardHeight(double givenHeight) {
    categoryHeight = givenHeight;
    isCategoryHeightSet = true;
    print('cat height $categoryHeight');
    update();
  }

  void addIt({String text}) {
    text == null
        ? addItems.add(Center(child: Text('sample ${++count}')))
        : addItems.add(Text('special'));
    print('len ${addItems.length}');
    update();
  }

  List<Widget> convertToCategoryCard(
      List<IncomeAndExpenseCategorySelectModel> expenses,
      List<List<ExpenseDetail>> expenseDetail) {
    List<Widget> toBeReturned = [];
    for (int i = 0; i < expenses.length; i++) {
      toBeReturned.add(
        Card(
          child: multipleItems(expenses[i].categoryName, expenseDetail[i]),
        ),
      );
    }
    return toBeReturned;
  }

  Widget multipleItems(
    String categoryName,
    List<ExpenseDetail> multipleExpenses,
  ) {
    return multipleExpenses.isEmpty
        ? Container()
        : ListView.separated(
            itemBuilder: (context, index) =>
                index == multipleExpenses.length - 1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              categoryName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                          ExpenseDetail(
                              key: UniqueKey(),
                              categoryID: multipleExpenses.first.categoryID,
                              index: index,
                              expense: multipleExpenses[index].expense,
                              isLastItem: true),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              categoryName,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown),
                            ),
                          ),
                          ExpenseDetail(
                              key: UniqueKey(),
                              categoryID: multipleExpenses.first.categoryID,
                              index: index,
                              expense: multipleExpenses[index].expense,
                              isLastItem: false),
                        ],
                      ),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
            itemCount: multipleExpenses.length);
  }
}
