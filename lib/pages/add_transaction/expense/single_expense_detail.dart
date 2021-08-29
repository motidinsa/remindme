import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/expense/expense_bloc.dart';
import 'package:mytask/bloc/expense/expense_event.dart';
import 'package:mytask/models/expense_and_income.dart';

class SingleExpenseDetail extends StatefulWidget {
  final ExpenseAndIncome expense;

  SingleExpenseDetail({this.expense});

  @override
  _SingleExpenseDetailState createState() => _SingleExpenseDetailState();
}

class _SingleExpenseDetailState extends State<SingleExpenseDetail> {
  String dateAdded =
      '${DateTime.now().year}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
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
                  width: 10,
                ),
                if (widget.expense.subcategoryName != null)
                  Text(
                    '-->  ${widget.expense.subcategoryName}',
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
                        widget.expense.netAmount.toString(),
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        '${widget.expense.numberOfTimes} x ${widget.expense.netAmount} -> ${widget.expense.totalAmount.toString()}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
              ],
            ),
            // OutlinedButton(
            //     onPressed: () {
            //       // BlocProvider.of<ExpenseBloc>(context).add(AddExpense());
            //       BlocProvider.of<ExpenseBloc>(context).add(LoadAllExpense());
            //       // print(DateTime.now().difference(DateTime.parse('2021-08-07')).inDays);
            //     },
            //     child: Text('test'))
          ],
        ),
      ),
    );
  }
}
