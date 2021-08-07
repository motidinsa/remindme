import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mytask/bloc/expense/expense_bloc.dart';
import 'package:mytask/bloc/expense/expense_event.dart';
import 'package:mytask/bloc/expense/expense_state.dart';
import 'package:mytask/models/finished_category.dart';
import 'package:mytask/pages/add_transaction/expense/added_expense.dart';
import 'package:mytask/pages/add_transaction/expense/added_expense_list.dart';
import 'package:mytask/pages/add_transaction/expense/expense_detail.dart';
import 'package:mytask/pages/add_transaction/expense/selected_category.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'expense_category.dart';
import 'expense_category_list.dart';
import 'package:mytask/models/expense.dart';

import 'expense_controller.dart';

class ExpensePage extends StatefulWidget {
  static const routeName = 'AddExpense';

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  String dateSelected =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  TextEditingController _expenseReasonController = TextEditingController();
  TextEditingController _expenseAmountController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  List<ExpenseCategoryy> selectedCategories = [];
  List<Widget> cardItems = [];
  List<List<ExpenseDetail>> expenseDetailList = [];
  List<List<Expense>> expenseList = [];
  List<ExpenseDetail> finishedCategory = [];
  List<FinishedCategory> finishedCategoryList = [];
  bool expenseAdded = false;
  String _selectedDate;
  String date;
  String dateSet =
      '${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().year}';
  String _dateCount;
  String _range;
  String _rangeCount;
  List<Expense> singleCategoryExpenseList = [];

  // List<List<Expense>> allCategoryExpenseList = [];

  void setDate(String date) {
    setState(() {
      dateSet = date ?? dateSet;
    });
  }

  List<ExpenseCategoryy> categoryList = [
    ExpenseCategoryy(
        'Transportation',
        Icon(
          Icons.phonelink_setup,
          size: 30,
          color: Colors.black54,
        ),
        false,
        1,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.star,
          size: 30,
          color: Colors.black54,
        ),
        false,
        2,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.assignment,
          size: 30,
          color: Colors.black54,
        ),
        false,
        3,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        4,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.app_settings_alt,
          size: 30,
          color: Colors.black54,
        ),
        false,
        5,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.star,
          size: 30,
          color: Colors.black54,
        ),
        false,
        6,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.assignment,
          size: 30,
          color: Colors.black54,
        ),
        false,
        7,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        8,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        9,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        10,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        11,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        12,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        13,
        false,
        UniqueKey()),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        13,
        false,
        UniqueKey()),
  ];

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
        Get.reset();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Expense'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
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
                      .where(
                          (element) => element.id == state.selectedCategory.id)
                      .first);
                  categoryList[state.selectedCategory.id - 1].isSelected = true;
                  print(index.toString() + ' new index');
                  List<ExpenseDetail> singleCategoryMultipleItems = [];
                  List<Expense> singleCategoryMultipleExpenses = [];
                  singleCategoryMultipleItems.add(ExpenseDetail(
                      id: state.selectedCategory.id,
                      expense: Expense(
                          id: state.selectedCategory.id,
                          categoryName: state.selectedCategory.categoryName),
                      isLastItem: true));
                  singleCategoryMultipleExpenses.add(Expense(
                      id: state.selectedCategory.id,
                      categoryName: state.selectedCategory.categoryName));
                  expenseDetailList.add(singleCategoryMultipleItems);
                  // expenseList.add(singleCategoryMultipleExpenses);

                  print(selectedCategories.length.toString() + ' selected cat');
                  print(
                      expenseDetailList.length.toString() + ' expense detail');
                  print(expenseList.length.toString() + ' expense list');
                  cardItems = convertToCategoryCard(
                      selectedCategories, expenseDetailList);
                }
                if (state is RemoveExpenseCategorySuccess) {
                  int index = selectedCategories.indexOf(selectedCategories
                      .where((element) => element.id == state.categoryID)
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
                  print(selectedCategories.length.toString() + ' selected cat');
                  print(
                      expenseDetailList.length.toString() + ' expense detail');
                  print(expenseList.length.toString() + ' expense list');
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
                          .where((element) => element.id == state.categoryID)
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

                  print(selectedCategories.length.toString() + ' selected cat');
                  print(
                      expenseDetailList.length.toString() + ' expense detail');
                  print(expenseList.length.toString() + ' expense list');
                  // expenseList[index]
                  //     .removeWhere((element) => element.id == state.categoryID);
                  // expenseList.removeWhere((element) => element.length == 0);
                  // expenseList.remove(expenseList[index]);
                  cardItems = convertToCategoryCard(
                      selectedCategories, expenseDetailList);
                }
                if (state is AnotherItemAdded) {
                  int index = selectedCategories.indexOf(selectedCategories
                      .where((element) => element.id == state.categoryID)
                      .first);

                  expenseDetailList[index].add(ExpenseDetail(
                      id: state.categoryID,
                      expense: Expense(
                          id: state.categoryID,
                          categoryName: selectedCategories[index].categoryName),
                      isLastItem: true));
                  // expenseList[index].add(Expense(
                  //     id: state.categoryID,
                  //     categoryName: selectedCategories[index].categoryName));
                  print(selectedCategories.length.toString() + 'leen');
                  print(expenseDetailList[index].length.toString() + 'leenee');
                  cardItems = convertToCategoryCard(
                      selectedCategories, expenseDetailList);
                  print(selectedCategories.length.toString() + ' selected cat');
                  print(
                      expenseDetailList.length.toString() + ' expense detail');
                  print(expenseList.length.toString() + ' expense list');
                }
                if (state is DateAdded) {
                  int categoryIndex = selectedCategories.indexOf(
                      selectedCategories
                          .where((element) => element.id == state.categoryID)
                          .first);
                  expenseDetailList[categoryIndex][state.index].expense.date =
                      state.date;
                  cardItems = convertToCategoryCard(
                      selectedCategories, expenseDetailList);
                }
                if (state is AmountAdded) {
                  int categoryIndex = selectedCategories.indexOf(
                      selectedCategories
                          .where((element) => element.id == state.categoryID)
                          .first);
                  print(categoryIndex.toString() + ' indexxxxxxxx');
                  // expenseList[categoryIndex][state.index].amount = state.amount;
                  expenseDetailList[categoryIndex][state.index].expense.amount =
                      state.amount;
                  cardItems = convertToCategoryCard(
                      selectedCategories, expenseDetailList);
                }
                if (state is ReasonAdded) {
                  int categoryIndex = selectedCategories.indexOf(
                      selectedCategories
                          .where((element) => element.id == state.categoryID)
                          .first);
                  // expenseList[categoryIndex][state.index].reason = state.reason;
                  expenseDetailList[categoryIndex][state.index].expense.reason =
                      state.reason;
                  cardItems = convertToCategoryCard(
                      selectedCategories, expenseDetailList);
                }
                if (state is CategoryFinished) {
                  int index = selectedCategories.indexOf(selectedCategories
                      .where((element) => element.id == state.id)
                      .first);
                  print(index.toString() + ' yeeeeeeee');
                  int catIndex = -1;
                  // finishedCategory.add(expenseDetailList[index]);
                  for (int i = 0; i < finishedCategoryList.length; i++) {
                    if (finishedCategoryList[i].id == state.id) {
                      catIndex =
                          finishedCategoryList.indexOf(finishedCategoryList[i]);
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
                    onPressed: () {},
                    child: Text(
                      'Save',
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  List<Widget> convertToCategoryCard(List<ExpenseCategoryy> expenses,
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
                              id: multipleExpenses.first.id,
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
                              id: multipleExpenses.first.id,
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
