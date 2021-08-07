import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/expense/expense_bloc.dart';
import 'package:mytask/bloc/expense/expense_event.dart';
import 'package:mytask/models/expense.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:get/get.dart';

import 'expense_controller.dart';

class ExpenseDetail extends StatefulWidget {
  final int id;
  final int index;
  final bool isLastItem;
  Expense expense;
  final Key key;

  ExpenseDetail({this.key, this.id, this.index, this.expense, this.isLastItem});

  @override
  _ExpenseDetailState createState() => _ExpenseDetailState();
}

class _ExpenseDetailState extends State<ExpenseDetail> {
  // final ExpenseController expenseController = Get.put(ExpenseController());
  TextEditingController _expenseReasonController = TextEditingController();
  TextEditingController _expenseAmountController = TextEditingController();
  String date;
  String _selectedDate;
  double amount;
  String reason;
  String _dateCount;
  String _rangeCount;
  String dateSet =
      '${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().year}';
  FocusNode amountFocusNode = FocusNode();
  FocusNode reasonFocusNode = FocusNode();

  void onAmountFocusChange() {
    if (!amountFocusNode.hasFocus)
      // expenseController.addAmount(widget.id, widget.index, amount);
      BlocProvider.of<ExpenseBloc>(context)
          .add(AddExpenseAmount(widget.id, widget.index, amount));
  }

  void onReasonFocusChange() {
    if (!reasonFocusNode.hasFocus)
      // expenseController.addReason(widget.id, widget.index, reason);
      BlocProvider.of<ExpenseBloc>(context)
          .add(AddExpenseReason(widget.id, widget.index, reason));
  }

  void setDate(String date) {
    setState(() {
      dateSet = date ?? dateSet;
    });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
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
  }

  @override
  void initState() {
    super.initState();
    amountFocusNode.addListener(onAmountFocusChange);
    reasonFocusNode.addListener(onReasonFocusChange);
    if (widget.expense.amount != null) {
      _expenseAmountController.text = widget.expense.amount.toString();
    }
    if (widget.expense.reason != null) {
      _expenseReasonController.text = widget.expense.reason;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            children: [
              Text(
                'Date:',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                widget.expense.date ?? dateSet,
                // key: UniqueKey(),
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlineButton(
                      textTheme: ButtonTextTheme.accent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          context: context,
                          builder: (context) => StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SfDateRangePicker(
                                      onSelectionChanged: _onSelectionChanged,
                                      showNavigationArrow: true,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: OutlineButton(
                                          textTheme: ButtonTextTheme.accent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<ExpenseBloc>(
                                                    context)
                                                .add(AddExpenseDate(widget.id,
                                                    widget.index, date));
                                            // setDate(date);
                                            Navigator.pop(context);

                                            // DateTime date = Datetime
                                          },
                                          child: Text(
                                            'OK',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Select another day',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  focusNode: amountFocusNode,
                  keyboardType: TextInputType.number,
                  cursorHeight: 30,
                  controller: _expenseAmountController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Amount',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                    contentPadding: EdgeInsets.only(left: 20),
                  ),
                  onChanged: (newValue) {
                    amount = double.parse(newValue);
                  },
                  onEditingComplete: () {
                    BlocProvider.of<ExpenseBloc>(context)
                        .add(AddExpenseAmount(widget.id, widget.index, amount));
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                    focusNode: reasonFocusNode,
                    cursorHeight: 30,
                    controller: _expenseReasonController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Reason',
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                    ),
                    onChanged: (newValue) => reason = newValue,
                    onEditingComplete: () {
                      //   expenseController.addReason(
                      //   widget.id,
                      //   widget.index,
                      //   reason,
                      // );
                      BlocProvider.of<ExpenseBloc>(context).add(
                          AddExpenseReason(widget.id, widget.index, reason));
                    }),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: OutlineButton(
                  textTheme: ButtonTextTheme.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      context: context,
                      builder: (context) => StatefulBuilder(
                        builder: (context, setState) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 20, top: 20, right: 20, bottom: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Food',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.brown,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    OutlinedButton(
                                        onPressed: () {
                                          showDialog<bool>(
                                            context: context,
                                            builder: (context) {
                                              return Center(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30),
                                                  child: Card(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Align(
                                                                  child: Icon(
                                                                    Icons
                                                                        .alt_route_outlined,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      TextButton(
                                                                    child: Text(
                                                                      'Anbessa',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                    ),
                                                                    onPressed:
                                                                        () {},
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          color: Colors.grey,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Align(
                                                                  child: Icon(
                                                                    Icons
                                                                        .alt_route_outlined,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      TextButton(
                                                                    child: Text(
                                                                      'Anbessa',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                    ),
                                                                    onPressed:
                                                                        () {},
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          color: Colors.grey,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Align(
                                                                  child: Icon(
                                                                    Icons
                                                                        .alt_route_outlined,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      TextButton(
                                                                    child: Text(
                                                                      'Anbessa',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                    ),
                                                                    onPressed:
                                                                        () {},
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text('Sub Category'))
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  elevation: 4,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _expenseReasonController.text =
                                                'reason 1 cdbjhb';
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              top: 15,
                                              bottom: 15,
                                              right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'reason 1 cdbjhb',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey),
                                                textAlign: TextAlign.start,
                                              ),
                                              Text(
                                                '15 records',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 0,
                                        color: Colors.black54,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _expenseReasonController.text =
                                                'reason 2 cdbjhb';
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              top: 15,
                                              bottom: 15,
                                              right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'reason 2 cdbjhb',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey),
                                                textAlign: TextAlign.start,
                                              ),
                                              Text(
                                                '13 records',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 0,
                                        color: Colors.black54,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _expenseReasonController.text =
                                                'reason 3 cdbjhb';
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              top: 15,
                                              bottom: 15,
                                              right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'reason 3 cdbjhb',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey),
                                                textAlign: TextAlign.start,
                                              ),
                                              Text(
                                                '16 records',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 0,
                                        color: Colors.black54,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _expenseReasonController.text =
                                                'reason 4 cdbjhb';
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              top: 15,
                                              bottom: 15,
                                              right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'reason 4 cdbjhb',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey),
                                                textAlign: TextAlign.start,
                                              ),
                                              Text(
                                                '12 records',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Select reasons',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              )
            ],
          ),
        ),
        if (widget.isLastItem)
          Row(
            children: [
              Expanded(child: Container()),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // expenseController.addAnotherItem(widget.id);
                    BlocProvider.of<ExpenseBloc>(context)
                        .add(AddAnotherItem(widget.id));
                  },
                  child: Text('Add another'),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // expenseController.finishCategory(widget.id);
                    BlocProvider.of<ExpenseBloc>(context)
                        .add(FinishCategory(widget.id));
                  },
                  child: Text('Finish'),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                ),
              ),
            ],
          )
      ],
    );
  }
}
