import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/bloc/expense/expense_state.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_bloc.dart';
import 'package:remindme/bloc/expense_and_income/expense_and_income_event.dart';
import 'package:remindme/data_provider/task_data.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/pages/add_transaction/expense/added_expense.dart';
import 'package:remindme/pages/add_transaction/expense/added_expense_list.dart';
import 'package:remindme/pages/add_transaction/expense/expense_detail.dart';
import 'package:remindme/pages/add_transaction/expense/selected_category.dart';
import 'package:remindme/repository/expense_repository.dart';
import 'package:remindme/utility/icons_helper.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../main.dart';
import 'expense_category.dart';
import 'expense_category_list.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/utility/icons_helper.dart';
import 'package:intl/src/intl/date_format.dart';
import 'expense_controller.dart';

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
  TextEditingController _expenseReasonController = TextEditingController();
  TextEditingController _expenseAmountController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  List<ExpenseAndIncomeCategory> selectedCategories = [];
  List<Widget> cardItems = [];
  List<List<ExpenseDetail>> expenseDetailList = [];

  // List<List<ExpenseAndIncome>> expenseList = [];
  List<ExpenseDetail> finishedCategory = [];
  List<FinishedCategory> finishedCategoryList = [];
  bool expenseAdded = false;
  String _selectedDate;
  String date;
  String dateAdded = DateFormat("dd-MM-yy").format(DateTime.now());

  // String dateSet =
  //     '${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().year}';
  String _dateCount;
  String _range;
  String _rangeCount;
  List<ExpenseAndIncome> singleCategoryExpenseList = [];
  List<ExpenseAndIncomeCategory> categoryList = [];

  // List<List<Expense>> allCategoryExpenseList = [];

  void setDate(String date) {
    setState(() {
      dateAdded = date ?? dateAdded;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.categories.forEach((element) {
      categoryList.add(ExpenseAndIncomeCategory(
          element.categoryName,
          Icon(
            IconsHelper.getIconGuessFavorFA(name: element.iconName),
            color: Colors.black54,
            size: 25,
          ),
          false,
          element.id,
          false,
          UniqueKey()));
    });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(
      () {
        if (args.value is DateTime) {
          _selectedDate = args.value.toString();
          date =
              '${DateTime.parse(_selectedDate).day > 9 ? DateTime.parse(_selectedDate).day : '0${DateTime.parse(_selectedDate).day}'}-${DateTime.parse(_selectedDate).month > 9 ? DateTime.parse(_selectedDate).month : '0${DateTime.parse(_selectedDate).month}'}-${DateTime.parse(_selectedDate).year}';
          print(_selectedDate);

          print(date);
        } else if (args.value is List<DateTime>) {
          _dateCount = args.value.length.toString();
        } else {
          _rangeCount = args.value.length.toString();
        }
      },
    );
  }

  // final ExpenseController expenseController = Get.put(ExpenseController());
  // final ExpenseController controller = Get.find();

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
                    int index = selectedCategories.indexOf(selectedCategories
                        .where((element) =>
                            element.categoryID ==
                            state.selectedCategory.categoryID)
                        .first);
                    // categoryList[state.selectedCategory.categoryID - 1]
                    //     .isSelected = true;
                    categoryList
                        .firstWhere((element) =>
                            element.categoryID ==
                            state.selectedCategory.categoryID)
                        .isSelected = true;
                    print(index.toString() + ' new index');
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
                    // expenseList.add(singleCategoryMultipleExpenses);

                    print(
                        selectedCategories.length.toString() + ' selected cat');
                    print(expenseDetailList.length.toString() +
                        ' expense detail');
                    // print(expenseList.length.toString() + ' expense list');
                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                  }
                  if (state is RemoveExpenseCategorySuccess) {
                    int index = selectedCategories.indexOf(selectedCategories
                        .where(
                            (element) => element.categoryID == state.categoryID)
                        .first);
                    print(index.toString() + ' newwwwww index');
                    if (selectedCategories.length == 1) {
                      selectedCategories = [];
                      expenseDetailList = [];
                      // expenseList = [];
                    } else {
                      selectedCategories.removeAt(index);
                      // selectedCategories
                      //     .removeWhere((element) => element.id == state.categoryID);
                      // print(selectedCategories.length);
                      expenseDetailList.removeAt(index);
                      // expenseDetailList[index]
                      //     .removeWhere((element) => element.id == state.categoryID);
                      // expenseDetailList
                      //     .removeWhere((element) => element.length == 0);
                      // expenseList[index].removeWhere(
                      //     (element) => element.id == state.categoryID);
                      // expenseList.removeWhere((element) => element.length == 0);
                      // print(expenseList[0][0].amount.toString() + ' previous');
                      // expenseList.removeAt(index);
                      // print(expenseList[0][0].amount.toString() + ' after');
                    }
                    categoryList[state.categoryID - 1].isSelected = false;
                    print(
                        selectedCategories.length.toString() + ' selected cat');
                    print(expenseDetailList.length.toString() +
                        ' expense detail');
                    // print(expenseList.length.toString() + ' expense list');
                    // expenseList[index]
                    //     .removeWhere((element) => element.id == state.categoryID);
                    // expenseList.removeWhere((element) => element.length == 0);
                    // expenseList.remove(expenseList[index]);
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
                    // finishedCategory.where((element) => element.where((element) => element.id==))
                    // int finishedCategoryIndex = finishedCategory.indexOf(finishedCategory
                    //     .where((element) => element. == state.categoryID)
                    //     .first);
                    // print(index.toString() + ' newwwwww index');
                    if (selectedCategories.length == 1) {
                      selectedCategories = [];
                      // expenseDetailList = [];
                      // expenseList = [];
                    } else {
                      selectedCategories.removeAt(categoryIndex);
                      // selectedCategories
                      //     .removeWhere((element) => element.id == state.categoryID);
                      // print(selectedCategories.length);
                      finishedCategoryList.removeAt(finishedCategoryIndex);
                      // expenseDetailList[index]
                      //     .removeWhere((element) => element.id == state.categoryID);
                      // expenseDetailList
                      //     .removeWhere((element) => element.length == 0);
                      // expenseList[index].removeWhere(
                      //     (element) => element.id == state.categoryID);
                      // expenseList.removeWhere((element) => element.length == 0);
                      // print(expenseList[0][0].amount.toString() + ' previous');
                      // expenseList.removeAt(index);
                      // print(expenseList[0][0].amount.toString() + ' after');
                    }

                    print(
                        selectedCategories.length.toString() + ' selected cat');
                    print(expenseDetailList.length.toString() +
                        ' expense detail');
                    // print(expenseList.length.toString() + ' expense list');
                    // expenseList[index]
                    //     .removeWhere((element) => element.id == state.categoryID);
                    // expenseList.removeWhere((element) => element.length == 0);
                    // expenseList.remove(expenseList[index]);
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
                    // expenseList[index].add(Expense(
                    //     id: state.categoryID,
                    //     categoryName: selectedCategories[index].categoryName));
                    print(selectedCategories.length.toString() + 'leen');
                    print(
                        expenseDetailList[index].length.toString() + 'leenee');
                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                    print(
                        selectedCategories.length.toString() + ' selected cat');
                    print(expenseDetailList.length.toString() +
                        ' expense detail');
                    // print(expenseList.length.toString() + ' expense list');
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
                    print(categoryIndex.toString() + ' indexxxxxxxx');
                    // expenseList[categoryIndex][state.index].amount = state.amount;
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
                    print(categoryIndex.toString() + ' indexxxxxxxx');
                    // expenseList[categoryIndex][state.index].amount = state.amount;
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
                    // expenseList[categoryIndex][state.index].reason = state.reason;
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
                    print('zzzzzzz before $categoryIndex');
                    print(state.amount + ' opopoppopopopopop');
                    // expenseList[categoryIndex][state.index].reason = state.reason;
                    if (state.categoryID != null &&
                        state.subcategoryID == null &&
                        state.subSubcategoryID == null) {
                      expenseDetailList[categoryIndex][state.index]
                          .expense
                          .categoryID = state.categoryID;
                    } else if (state.subcategoryID != null &&
                        state.subSubcategoryID == null) {
                      print('zzzzzzz after $categoryIndex');
                      expenseDetailList[categoryIndex][state.index]
                          .expense
                          .categoryID = state.categoryID;
                      expenseDetailList[categoryIndex][state.index]
                          .expense
                          .subcategoryID = state.subcategoryID;
                    } else if (state.subSubcategoryID != null) {
                      print('zzzzzzz after $categoryIndex');
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
                    print('reason id ${state.reasonID}');
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
                    print(index.toString() + ' yeeeeeeee');
                    int catIndex = -1;
                    // finishedCategory.add(expenseDetailList[index]);
                    for (int i = 0; i < finishedCategoryList.length; i++) {
                      if (finishedCategoryList[i].id == state.id) {
                        catIndex = finishedCategoryList
                            .indexOf(finishedCategoryList[i]);
                      }
                    }

                    print(catIndex.toString() + ' cat iiiiiindex');
                    if (catIndex == -1)
                      finishedCategoryList.add(
                          FinishedCategory(expenseDetailList[index], state.id));
                    else {
                      List<ExpenseDetail> expenseDetails =
                          finishedCategoryList[catIndex].expenseDetail;
                      // List<ExpenseDetail> addedExpenseDetail = [...expenseDetailList[index]]
                      expenseDetails.addAll(expenseDetailList[index]);
                      finishedCategoryList[catIndex].expenseDetail =
                          expenseDetails;
                    }

// expenseDetailList.removeAt(index);
                    print(index.toString() + ' newwwwww index');
                    if (selectedCategories.length == 1) {
                      selectedCategories = [];
                      expenseDetailList = [];
                      // expenseList = [];
                    } else {
                      selectedCategories.removeAt(index);
                      // selectedCategories
                      //     .removeWhere((element) => element.id == state.categoryID);
                      // print(selectedCategories.length);
                      expenseDetailList.removeAt(index);
                      // expenseDetailList[index]
                      //     .removeWhere((element) => element.id == state.categoryID);
                      // expenseDetailList
                      //     .removeWhere((element) => element.length == 0);
                      // expenseList[index].removeWhere(
                      //     (element) => element.id == state.categoryID);
                      // expenseList.removeWhere((element) => element.length == 0);
                      // print(expenseList[0][0].amount.toString() + ' previous');
                      // expenseList.removeAt(index);
                      // print(expenseList[0][0].amount.toString() + ' after');
                    }
// categoryList.where((element) => element.id==state.id).first.isSelected=false;
                    categoryList[state.id - 1].isSelected = false;
                    print(categoryList[state.id - 1].isSelected.toString() +
                        ' bbbbbbbbbbbbbbbb');
                    // selectedCategories[index].finishedCategory = true;
                    cardItems = convertToCategoryCard(
                        selectedCategories, expenseDetailList);
                    // if(selectedCategories==null)selectedCategories=[];
                    // if(expenseDetailList==null)expenseDetailList=[];
                    // if(expenseList==null)expenseList=[];
                    // BlocProvider.of<ExpenseBloc>(context)
                    //     .add(RemoveExpenseCategory(state.id));
                    // return AddedExpense(state.expenses);
                  }
                  if (state is ExpenseAddedSuccessfully) {
                    // Navigator.pop(context);
                    // Navigator.pop(context);
                    // return Container();
                  }
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

  List<Widget> convertToCategoryCard(List<ExpenseAndIncomeCategory> expenses,
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
