import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mytask/models/expense_and_income.dart';

import 'expense_detail.dart';

class AddedExpense extends StatefulWidget {
  final List<ExpenseDetail> expenseList;

  AddedExpense(this.expenseList);

  @override
  _AddedExpenseState createState() => _AddedExpenseState();
}

class _AddedExpenseState extends State<AddedExpense> {
  // List<Expense> expenseList;

  // @override
  // // ignore: must_call_super
  // void initState() {
  //   expenseList = widget.expenseList;
  // }

  @override
  Widget build(BuildContext context) {
    return widget.expenseList.length != 0
        ? Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10, top: 10),
                  child: Text(
                    widget.expenseList[0].expense.categoryName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => index ==
                        widget.expenseList.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                widget.expenseList[index].expense.date,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.expenseList[index].expense.reason,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.expenseList[index].expense
                                            .numberOfTimes ==
                                        1
                                    ? widget
                                        .expenseList[index].expense.netAmount
                                        .toString()
                                    : '${widget.expenseList[index].expense.totalAmount} (${widget.expenseList[index].expense.numberOfTimes} x ${widget.expenseList[index].expense.netAmount})'
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                // highlightColor: Colors.amber,
                                onTap: () {
                                  print(widget.expenseList.toString() +
                                      ' before');
                                  setState(() {
                                    widget.expenseList.removeAt(index);
                                  });
                                  print(
                                      widget.expenseList.toString() + ' after');
                                },
                                child: Ink(
                                    // padding: EdgeInsets.all(),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        // color: isSelected ? Colors.grey[300] : null,
                                        border: Border.all(color: Colors.grey)),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                    )),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    widget.expenseList[index].expense.date,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    widget.expenseList[index].expense.reason,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    widget.expenseList[index].expense.netAmount
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(100),
                                    // highlightColor: Colors.amber,
                                    onTap: () {
                                      print(widget.expenseList.toString() +
                                          ' before');
                                      setState(() {
                                        widget.expenseList.removeAt(index);
                                      });
                                      print(widget.expenseList.toString() +
                                          ' after');
                                    },
                                    child: Ink(
                                        // padding: EdgeInsets.all(),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            // color: isSelected ? Colors.grey[300] : null,
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.red,
                                        )),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              )
                            ],
                          ),
                    itemCount: widget.expenseList.length,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
