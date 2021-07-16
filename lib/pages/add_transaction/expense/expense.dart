import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/expense/expense_bloc.dart';
import 'package:mytask/bloc/expense/expense_event.dart';
import 'package:mytask/bloc/expense/expense_state.dart';
import 'package:mytask/pages/add_transaction/expense/added_expense.dart';
import 'package:mytask/pages/add_transaction/expense/expense_detail.dart';
import 'package:mytask/pages/add_transaction/expense/expense_detail_list.dart';
import 'package:mytask/pages/add_transaction/expense/selected_category.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'expense_category.dart';
import 'expense_category_list.dart';
import 'package:mytask/models/expense.dart';

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
  List<ExpenseCategoryy> selectedCategories = [];
  List<Widget> cardItems = [];
  List<List<ExpenseDetail>> expenseDetailList = [];

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
        1),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.star,
          size: 30,
          color: Colors.black54,
        ),
        false,
        2),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.assignment,
          size: 30,
          color: Colors.black54,
        ),
        false,
        3),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        4),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.app_settings_alt,
          size: 30,
          color: Colors.black54,
        ),
        false,
        5),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.star,
          size: 30,
          color: Colors.black54,
        ),
        false,
        6),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.assignment,
          size: 30,
          color: Colors.black54,
        ),
        false,
        7),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        8),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        9),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        10),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        11),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        12),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        13),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        13),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<ExpenseBloc>(context).add(ClearCategory());
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
            CategoryList(categoryList),
            AddedExpense(
              [
                Expense(
                    categoryName: 'Transport',
                    date: '23/02/2013',
                    expenseName: 'some dcghs',
                    amount: 23.5),
                Expense(
                    categoryName: 'Transport',
                    date: '23/02/2013',
                    expenseName: 'some dcghs',
                    amount: 23.5),
                Expense(
                    categoryName: 'Transport',
                    date: '23/02/2013',
                    expenseName: 'some dcghs',
                    amount: 23.5),
              ],
            ),
            BlocBuilder<ExpenseBloc, ExpenseState>(
              builder: (_, state) {
                if (state is AddExpenseCategorySuccess) {
                  selectedCategories.add(state.selectedCategory);
                  // singleCategoryMultipleItems = [];
                  List<ExpenseDetail> singleCategoryMultipleItems = [];
                  singleCategoryMultipleItems
                      .add(ExpenseDetail(state.selectedCategory.id, true));
                  expenseDetailList.add(singleCategoryMultipleItems);
                  cardItems = convertToCategoryCard(
                      selectedCategories, expenseDetailList);
                }
                if (state is RemoveExpenseCategorySuccess) {
                  int index = selectedCategories.indexOf(selectedCategories
                      .where((element) => element.id == state.categoryID)
                      .first);
                  selectedCategories
                      .removeWhere((element) => element.id == state.categoryID);
                  print(selectedCategories.length);

                  expenseDetailList[index]
                      .removeWhere((element) => element.id == state.categoryID);
                  expenseDetailList
                      .removeWhere((element) => element.length == 0);
                  // singleCategoryMultipleItems = [];
                  // for (int i = 0; i < selectedCategories.length; i++) {
                  //   if (expenseDetailList[i].first.id == state.categoryID) {
                  //     expenseDetailList.removeAt(i);
                  //   }
                  // }
                  // expenseDetailList.removeAt(state.categoryID - 1);
                  cardItems = convertToCategoryCard(
                      selectedCategories, expenseDetailList);
                }
                if (state is AnotherItemAdded) {
                  int index = selectedCategories.indexOf(selectedCategories
                      .where((element) => element.id == state.categoryID)
                      .first);

                  expenseDetailList[index]
                      .add(ExpenseDetail(state.categoryID, true));
                  // for (int i = 0; i < selectedCategories.length; i++) {
                  //   if (expenseDetailList[i].first.id == state.categoryID) {
                  //     expenseDetailList[i].add(
                  //         ExpenseDetail(expenseDetailList[i].first.id, true));
                  //     // expenseDetailList.removeAt(i);
                  //   }
                  // }
                  // selectedCategories.add(state.selectedCategory);
                  // singleCategoryMultipleItems.clear();
                  // singleCategoryMultipleItems.add(ExpenseDetail(state.selectedCategory.id,true));
                  // expenseDetailList.add(singleCategoryMultipleItems);
                  print(selectedCategories.length.toString() + 'leen');
                  print(expenseDetailList[index].length.toString() + 'leenee');
                  cardItems = convertToCategoryCard(
                      selectedCategories, expenseDetailList);
                }
                // if (expenseDetailList.isNotEmpty)
                //   print(expenseDetailList.first.length.toString() + ' first');
                BlocProvider.of<ExpenseBloc>(context).add(
                  ClearCategory(),
                );
                return SelectedCategoryInsertItem(cardItems);
              },
            ),

            // ExpenseDetail(
            //   categoryTitle: 'Transportation',
            // ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    // textTheme: ButtonTextTheme.accent,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {},
                    child: Text(
                      'Save',
                      // style: TextStyle(color: Colors.green),
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
      String categoryName, List<ExpenseDetail> multipleExpenses) {
    // List<Widget> tobeReturned = [];
    return ListView.separated(
        itemBuilder: (context, index) => index == multipleExpenses.length - 1
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
                  ExpenseDetail(multipleExpenses.first.id, true),
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
                  ExpenseDetail(multipleExpenses.first.id, false),
                ],
              ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: multipleExpenses.length);
    // for (int i = 0; i < multipleExpenses.length; i++) {
    //   if (i == multipleExpenses.length - 1) {
    //     tobeReturned.add(
    //         Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           margin: EdgeInsets.only(left: 20, top: 10),
    //           child: Text(
    //             categoryName,
    //             style: TextStyle(
    //               fontSize: 18,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.brown,
    //             ),
    //           ),
    //         ),
    //         ExpenseDetail(multipleExpenses[i].first.id, true),
    //       ],
    //     ));
    //   } else {
    //     tobeReturned.add(
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Container(
    //             margin: EdgeInsets.only(left: 20, top: 10),
    //             child: Text(
    //               categoryName,
    //               style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.brown),
    //             ),
    //           ),
    //           ExpenseDetail(multipleExpenses[i].first.id, false),
    //           Divider()
    //         ],
    //       ),
    //     );
    //   }
    // }
    // return ListView(
    //   // shrinkWrap: true,
    //   children: tobeReturned,
    // );
  }
}
