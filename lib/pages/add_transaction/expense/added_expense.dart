import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mytask/models/expense.dart';

class AddedExpense extends StatefulWidget {
  final List<Expense> expenseList;

  AddedExpense(this.expenseList);

  @override
  _AddedExpenseState createState() => _AddedExpenseState();
}

class _AddedExpenseState extends State<AddedExpense> {
  List<Expense> expenseList;

  @override
  // ignore: must_call_super
  void initState() {
    expenseList = widget.expenseList;
  }

  @override
  Widget build(BuildContext context) {
    return expenseList.length != 0
        ? Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10, top: 10),
                  child: Text(
                    expenseList[0].categoryName,
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
                            expenseList.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                expenseList[index].date,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                expenseList[index].reason,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                expenseList[index].amount.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                // highlightColor: Colors.amber,
                                onTap: () {
                                  print(expenseList.toString() + ' before');
                                  setState(() {
                                    expenseList.removeAt(index);
                                  });
                                  print(expenseList.toString() + ' after');
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
                                    expenseList[index].date,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    expenseList[index].reason,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    expenseList[index].amount.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(100),
                                    // highlightColor: Colors.amber,
                                    onTap: () {
                                      print(expenseList.toString() + ' before');
                                      setState(() {
                                        expenseList.removeAt(index);
                                      });
                                      print(expenseList.toString() + ' after');
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
                    itemCount: expenseList.length,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
