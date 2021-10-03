import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/bloc/expense/expense_state.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_bloc.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_event.dart';
import 'package:remindme/helper/icons_helper.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/selected_category.dart';
import 'income_and_expense_category.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:intl/src/intl/date_format.dart';

class ExpenseAndIncomePage extends StatefulWidget {
  static const routeName = 'AddExpense';
  final String type;
  final List<ExpenseAndIncomeCategoryModel> categories;
  final List<ExpenseAndIncomeSubCategoryModel> subcategories;
  final List<ExpenseAndIncomeSubSubCategoryModel> subSubcategories;

  ExpenseAndIncomePage(
      {this.categories, this.subSubcategories, this.subcategories, this.type});

  @override
  _ExpenseAndIncomePageState createState() => _ExpenseAndIncomePageState();
}

class _ExpenseAndIncomePageState extends State<ExpenseAndIncomePage> {
  String dateSelected =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  List<IncomeAndExpenseCategory> selectedCategories = [];
  List<Widget> cardItems = [];
  List<List<ExpenseDetail>> expenseDetailList = [];
  List<ExpenseDetail> finishedCategory = [];
  List<FinishedCategory> finishedCategoryList = [];
  bool expenseAdded = false;
  String _selectedDate;
  String date;
  String dateAdded = DateFormat("dd-MM-yy").format(DateTime.now());

  List<ExpenseAndIncome> singleCategoryExpenseList = [];
  List<IncomeAndExpenseCategory> categoryList = [];

  void setDate(String date) {
    setState(() {
      dateAdded = date ?? dateAdded;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.categories.forEach((element) {
      categoryList.add(IncomeAndExpenseCategory(
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<ExpenseBloc>(context).add(ClearCategory());
        // Get.reset();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add ${widget.type}'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              // Obx(
              //   () => expenseController.cardItems.length == 1
              //       ? Container()
              //       : SelectedCategoryInsertItem(
              //       expenseController.cardItems[1], expenseController.finishedCategory),
              // ),
              BlocBuilder<ExpenseBloc, ExpenseState>(
                builder: (_, state) {
                  if (state is AddExpenseCategorySuccess) {
                    selectedCategories.add(state.selectedCategory);

                    categoryList
                        .firstWhere((element) =>
                            element.categoryID ==
                            state.selectedCategory.categoryID)
                        .isSelected = true;

                    List<ExpenseDetail> singleCategoryMultipleItems = [];
                    List<ExpenseAndIncome> singleCategoryMultipleExpenses = [];

                    singleCategoryMultipleItems.add(
                      ExpenseDetail(
                          categoryID: state.selectedCategory.categoryID,
                          expense: ExpenseAndIncome(
                              numberOfTimes: 1,
                              date: dateAdded,
                              categoryID: state.selectedCategory.categoryID,
                              categoryName: state.selectedCategory.categoryName,
                              dateType: 'gr'),
                          isLastItem: true),
                    );
                    singleCategoryMultipleExpenses.add(
                      ExpenseAndIncome(
                          numberOfTimes: 1,
                          date: dateAdded,
                          categoryID: state.selectedCategory.categoryID,
                          categoryName: state.selectedCategory.categoryName,
                          dateType: 'gr'),
                    );
                    expenseDetailList.add(singleCategoryMultipleItems);

                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is RemoveExpenseCategorySuccess) {
                    int index = selectedCategories.indexOf(selectedCategories
                        .where(
                            (element) => element.categoryID == state.categoryID)
                        .first);

                    if (selectedCategories.length == 1) {
                      selectedCategories = [];
                      expenseDetailList = [];
                    } else {
                      selectedCategories.removeAt(index);

                      expenseDetailList.removeAt(index);
                    }
                    categoryList[state.categoryID - 1].isSelected = false;
                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is RemoveFinishedCategorySuccess) {
                    int categoryIndex = selectedCategories.indexOf(
                        selectedCategories
                            .where((element) =>
                                element.categoryID == state.categoryID)
                            .first);
                    int finishedCategoryIndex = finishedCategoryList.indexOf(
                        finishedCategoryList
                            .where((element) => element.id == state.categoryID)
                            .first);

                    if (selectedCategories.length == 1) {
                      selectedCategories = [];
                    } else {
                      selectedCategories.removeAt(categoryIndex);
                      finishedCategoryList.removeAt(finishedCategoryIndex);
                    }

                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is AnotherItemAdded) {
                    int index = selectedCategories.indexOf(selectedCategories
                        .where(
                            (element) => element.categoryID == state.categoryID)
                        .first);

                    expenseDetailList[index].add(ExpenseDetail(
                        categoryID: state.categoryID,
                        expense: ExpenseAndIncome(
                            numberOfTimes: 1,
                            date: dateAdded,
                            dateType: 'gr',
                            categoryID: state.categoryID,
                            categoryName:
                                selectedCategories[index].categoryName),
                        isLastItem: true));
                  }
                  if (state is DateAdded) {
                    int categoryIndex = selectedCategories.indexOf(
                        selectedCategories
                            .where((element) =>
                                element.categoryID == state.categoryID)
                            .first);
                    expenseDetailList[categoryIndex][state.index].expense.date =
                        state.date;
                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is AmountAdded) {
                    int categoryIndex = selectedCategories.indexOf(
                        selectedCategories
                            .where((element) =>
                                element.categoryID == state.categoryID)
                            .first);

                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .netAmount = state.amount;
                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .totalAmount = (expenseDetailList[categoryIndex]
                                    [state.index]
                                .expense
                                .numberOfTimes *
                            double.parse(state.amount))
                        .toString();
                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is NumberOfTimesAdded) {
                    int categoryIndex = selectedCategories.indexOf(
                        selectedCategories
                            .where((element) =>
                                element.categoryID == state.categoryID)
                            .first);

                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .numberOfTimes = state.numberOfTimes;
                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .netAmount = expenseDetailList[categoryIndex]
                            [state.index]
                        .expense
                        .netAmount;
                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .totalAmount = (double.parse(
                                expenseDetailList[categoryIndex][state.index]
                                    .expense
                                    .netAmount) *
                            state.numberOfTimes)
                        .toString();
                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is ReasonAdded) {
                    int categoryIndex = selectedCategories.indexOf(
                        selectedCategories
                            .where((element) =>
                                element.categoryID == state.categoryID)
                            .first);

                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .reason = state.reason;

                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is ReasonAddedFromList) {
                    int categoryIndex = selectedCategories.indexOf(
                        selectedCategories
                            .where((element) =>
                                element.categoryID == state.categoryID)
                            .first);

                    if (state.categoryID != null &&
                        state.subcategoryID == null &&
                        state.subSubcategoryID == null) {
                      expenseDetailList[categoryIndex][state.index]
                          .expense
                          .categoryID = state.categoryID;
                    } else if (state.subcategoryID != null &&
                        state.subSubcategoryID == null) {
                      expenseDetailList[categoryIndex][state.index]
                          .expense
                          .categoryID = state.categoryID;
                      expenseDetailList[categoryIndex][state.index]
                          .expense
                          .subcategoryID = state.subcategoryID;
                    } else if (state.subSubcategoryID != null) {
                      expenseDetailList[categoryIndex][state.index]
                          .expense
                          .categoryID = state.categoryID;
                      expenseDetailList[categoryIndex][state.index]
                          .expense
                          .subcategoryID = state.subcategoryID;
                      expenseDetailList[categoryIndex][state.index]
                          .expense
                          .subsubcategoryID = state.subSubcategoryID;
                    }
                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .reason = state.reason;
                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .netAmount = state.amount;
                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .totalAmount = (expenseDetailList[categoryIndex]
                                    [state.index]
                                .expense
                                .numberOfTimes *
                            double.parse(state.amount))
                        .toString();

                    expenseDetailList[categoryIndex][state.index]
                        .expense
                        .reasonID = state.reasonID;

                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is CategoryFinished) {
                    int index = selectedCategories.indexOf(selectedCategories
                        .where((element) => element.categoryID == state.id)
                        .first);

                    int catIndex = -1;

                    for (int i = 0; i < finishedCategoryList.length; i++) {
                      if (finishedCategoryList[i].id == state.id) {
                        catIndex = finishedCategoryList
                            .indexOf(finishedCategoryList[i]);
                      }
                    }

                    if (catIndex == -1) {
                      finishedCategoryList.add(
                          FinishedCategory(expenseDetailList[index], state.id));
                    } else {
                      List<ExpenseDetail> expenseDetails =
                          finishedCategoryList[catIndex].expenseDetail;
                      expenseDetails.addAll(expenseDetailList[index]);
                      finishedCategoryList[catIndex].expenseDetail =
                          expenseDetails;
                    }

                    if (selectedCategories.length == 1) {
                      selectedCategories = [];
                      expenseDetailList = [];
                    } else {
                      selectedCategories.removeAt(index);

                      expenseDetailList.removeAt(index);
                    }
                    categoryList[state.id - 1].isSelected = false;

                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is ExpenseAddedSuccessfully) {}
                  BlocProvider.of<ExpenseBloc>(context).add(
                    ClearCategory(),
                  );
                  return SelectedCategoryInsertItem(
                      categoryList, cardItems, finishedCategoryList);
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () {
                        DateTime now = DateTime.now();

                        DateFormat dateFormat = DateFormat("dd-MM-yy");
                        DateFormat timeFormat = DateFormat("HH:mm:ss");
                        String currentDate = dateFormat.format(now);
                        String currentTime = timeFormat.format(now);
                        finishedCategoryList.forEach((element) {
                          element.expenseDetail.forEach((element) {
                            element.expense.addedDate = currentDate;
                            element.expense.addedTime = currentTime;
                          });
                        });
                        expenseDetailList.forEach((element) {
                          element.forEach((element) {
                            element.expense.addedDate = currentDate;
                            element.expense.addedTime = currentTime;
                          });
                        });
                        BlocProvider.of<ExpenseAndIncomeBloc>(context).add(
                          AddExpense(
                              finishedCategories: finishedCategoryList,
                              expenseDetails: expenseDetailList,
                              type: widget.type),
                        );

                        Navigator.pop(context);
                        Navigator.pop(context);
                        // context.read<ExpenseBloc>().add(
                        //       AddExpense(finishedCategoryList, expenseDetailList),
                        //     );
                      },
                      child: Text(
                        'Save',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> convertToCategoryCard(List<IncomeAndExpenseCategory> expenses,
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
    return multipleExpenses.length == 0
        ? Container()
        : ListView.separated(
            itemBuilder: (context, index) =>
                index == multipleExpenses.length - 1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              categoryName,
                              style: TextStyle(
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
