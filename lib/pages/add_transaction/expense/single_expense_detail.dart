import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/data_provider/task_data.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/repository/expense_repository.dart';

class SingleExpenseDetail extends StatefulWidget {
  final ExpenseAndIncome expense;
  final ExpenseAndIncomeSubCategoryModel subcategorymodel;
  final ExpenseAndIncomeSubSubCategoryModel subSubcategorymodel;

  SingleExpenseDetail(
      {this.expense, this.subcategorymodel, this.subSubcategorymodel});

  @override
  _SingleExpenseDetailState createState() => _SingleExpenseDetailState();
}

class _SingleExpenseDetailState extends State<SingleExpenseDetail> {
  String dateAdded =
      '${DateTime.now().year}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}';

  // ExpenseAndIncomeSubCategoryModel subcategorymodel;
  // String subSubcategoryName;
  // final ExpenseRepository expenseRepository = ExpenseRepository(
  //   dataProvider: TaskDataProvider.instance,
  // );

  @override
  void initState() {
    super.initState();

    // getSubcategoryWithSubcategoryID(widget.expense.subcategoryID);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   getSubcategoryWithSubcategoryID(widget.expense.subcategoryID);
    // });
    // subcategorymodel = await getSubcategoryWithSubcategoryID(widget.expense.subcategoryID);
  }

  //
  // Future<void> getSubcategoryWithSubcategoryID(
  //     int id) async {
  //   subcategorymodel = (await expenseRepository.getSubcategoryWithSubcategoryID(id)).first;
  // }

  @override
  Widget build(BuildContext context) {
    // print('subsusb id ${widget.subSubcategorymodel.subSubcategoryName}');
    return Card(
      elevation: 2,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.expense.date,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    widget.expense.categoryName,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (widget.subcategorymodel != null)
                    Text(
                      '->  ${widget.subcategorymodel.subcategoryName}',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  SizedBox(
                    width: 5,
                  ),
                  if (widget.subSubcategorymodel != null)
                    Text(
                      '->  ${widget.subSubcategorymodel.subSubcategoryName}',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Align(
                    child: Icon(
                      widget.expense.categoryType == 'Income'
                          ? Icons.add
                          : Icons.minimize,
                      color: widget.expense.categoryType == 'Income'
                          ? Colors.green
                          : Colors.red,
                      size: 30,
                    ),
                    alignment: Alignment.centerLeft,
                  )),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.expense.reason,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            widget.expense.numberOfTimes == 1
                                ? Text(
                                    'amount: ${widget.expense.netAmount.toString()}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                    ),
                                  )
                                : Text(
                                    'amount: ${widget.expense.numberOfTimes} x ${widget.expense.netAmount} -> ${widget.expense.totalAmount.toString()}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Time added:  ${widget.expense.addedTime}',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
