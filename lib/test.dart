import 'package:flutter/material.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/test2.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TestExpenseDetail extends StatefulWidget {
  @override
  _TestExpenseDetailState createState() => _TestExpenseDetailState();
}

class _TestExpenseDetailState extends State<TestExpenseDetail> {
  final TextEditingController _expenseReasonController =
      TextEditingController();
  final TextEditingController _expenseAmountController =
      TextEditingController();
  final TextEditingController _expenseNumberOfTimesController =
      TextEditingController();
  final TextEditingController _expenseLocationController =
      TextEditingController();
  String dropdown;
  String date = DateFormat("dd-MM-yy").format(DateTime.now());
  String _selectedDate;
  String amount;
  String reason;
  int numberOfTimes;
  String _dateCount;
  String _rangeCount;
  String dateSet = DateFormat("dd-MM-yy").format(DateTime.now());
  FocusNode amountFocusNode = FocusNode();
  FocusNode reasonFocusNode = FocusNode();
  FocusNode numberOfTimesFocusNode = FocusNode();
  FocusNode locationFocusNode = FocusNode();
  double height;
  double categoryheight;
  bool isHeightSet = false;
  bool isCategoryHeightSet = false;
  bool saveReason = true;

  void onAmountFocusChange() {}

  void onReasonFocusChange() {}

  void onNumberOfTimesFocusChange() {}

  void setDate(String date) {
    setState(() {
      dateSet = date ?? dateSet;
    });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      // _selectedDate = args.value;
      // date =
      //     '${DateTime.parse(_selectedDate).day > 9 ? DateTime.parse(_selectedDate).day : '0${DateTime.parse(_selectedDate).day}'}-${DateTime.parse(_selectedDate).month > 9 ? DateTime.parse(_selectedDate).month : '0${DateTime.parse(_selectedDate).month}'}-${DateTime.parse(_selectedDate).year}';
      date = DateFormat("dd-MM-yy").format(args.value);
      print(date);

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
    numberOfTimesFocusNode.addListener(onNumberOfTimesFocusChange);
    // if (widget.expense.netAmount != null) {
    //   _expenseAmountController.text = widget.expense.netAmount.toString();
    // }
    // if (widget.expense.reason != null) {
    //   _expenseReasonController.text = widget.expense.reason;
    // }
    //
    // if (widget.expense.numberOfTimes != 1) {
    //   _expenseNumberOfTimesController.text =
    //       widget.expense.numberOfTimes.toString();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      'Date:',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'expense.date',
                      // key: UniqueKey(),
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            child: const Text(
                              'Change Date',
                              style: TextStyle(color: Colors.green),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
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
                                            onSelectionChanged:
                                                _onSelectionChanged,
                                            showNavigationArrow: true,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 20),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: OutlinedButton(
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                ),
                                                onPressed: () {
                                                  // BlocProvider.of<ExpenseBloc>(
                                                  //     context)
                                                  //     .add(AddExpenseDate(
                                                  //     widget.categoryID,
                                                  //     widget.index,
                                                  //     date));
                                                  // setDate(date);
                                                  Navigator.pop(context);

                                                  // DateTime date = Datetime
                                                },
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
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: const Text('Select reason'),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text('Select Subcategory'),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          context: context,
                          builder: (context) => Test2());
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Row(
                  children: const [
                    Text(
                      'Transport',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Bus',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey,
                    ),
                    Text(
                      'Anbessa',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 175),
                child: Text(
                  'Frequency',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100,
                      height: isHeightSet ? height - 10 : height,
                      child: TextField(
                        focusNode: amountFocusNode,
                        keyboardType: TextInputType.number,
                        controller: _expenseAmountController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                          contentPadding: EdgeInsets.only(left: 20, bottom: 20),
                        ),
                        onChanged: (newValue) {
                          amount = newValue;
                        },
                        onEditingComplete: () {
                          // BlocProvider.of<ExpenseBloc>(context).add(AddExpenseAmount(
                          //     widget.categoryID, widget.index, amount));
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 100,
                      height: isHeightSet ? height - 10 : height,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                              // flex: 2,
                              child: WidgetSize(
                                onChange: (Size size) {
                                  if (height == null) {
                                    setState(() {
                                      height = size.height;
                                      isHeightSet = true;
                                    });
                                  }
                                },
                                child: TextButton(
                                  child: const Icon(
                                    Icons.remove,
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                // focusNode: amountFocusNode,
                                keyboardType: TextInputType.number,
                                controller: _expenseNumberOfTimesController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 20),
                                ),
                                onChanged: (newValue) {
                                  amount = newValue;
                                },
                                onEditingComplete: () {
                                  // BlocProvider.of<ExpenseBloc>(context).add(AddExpenseAmount(
                                  //     widget.categoryID, widget.index, amount));
                                },
                              ),
                            ),
                            Expanded(
                              // flex: 2,
                              child: TextButton(
                                child: const Center(
                                  child: Icon(Icons.add),
                                ),
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: isHeightSet ? height - 10 : height,
                        child: TextField(
                            focusNode: reasonFocusNode,
                            // cursorHeight: 30,
                            controller: _expenseReasonController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Reason',
                              labelStyle: TextStyle(
                                // fontSize: 18,
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
                              // BlocProvider.of<ExpenseBloc>(context).add(
                              //     AddExpenseReason(
                              //         widget.categoryID, widget.index, reason));
                            }),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // flex: 2,
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'Save reason',
                          )),
                          Expanded(
                            child: Switch(
                              onChanged: (value) {
                                setState(() {
                                  saveReason = value;
                                });
                              },
                              value: saveReason,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: isHeightSet ? height - 10 : height,
                        child: TextField(
                            focusNode: locationFocusNode,
                            // cursorHeight: 30,
                            controller: _expenseLocationController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Location (Optional)',
                              labelStyle: TextStyle(
                                // fontSize: 18,
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
                              // BlocProvider.of<ExpenseBloc>(context).add(
                              //     AddExpenseReason(
                              //         widget.categoryID, widget.index, reason));
                            }),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Spacer()
                  ],
                ),
              ),
              // if (widget.isLastItem)
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // expenseController.addAnotherItem(widget.id);
                        // BlocProvider.of<ExpenseBloc>(context)
                        //     .add(AddAnotherItem(widget.categoryID));
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
                        // BlocProvider.of<ExpenseBloc>(context)
                        //     .add(FinishCategory(widget.categoryID));
                      },
                      child: Text('Finish'),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
