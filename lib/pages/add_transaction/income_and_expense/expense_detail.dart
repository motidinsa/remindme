import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/bloc/expense/expense_state.dart';
import 'package:remindme/bloc/reason/reason_bloc.dart';
import 'package:remindme/bloc/reason/reason_event.dart';
import 'package:remindme/bloc/reason/reason_state.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/single_reason.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/reason_list.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/subcategory_reason_select.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/src/intl/date_format.dart';

class ExpenseDetail extends StatefulWidget {
  final int categoryID;
  final int index;
  final bool isLastItem;
  ExpenseAndIncome expense;
  final Key key;

  ExpenseDetail(
      {this.key, this.categoryID, this.index, this.expense, this.isLastItem});

  @override
  _ExpenseDetailState createState() => _ExpenseDetailState();
}

class _ExpenseDetailState extends State<ExpenseDetail> {
  final TextEditingController _expenseReasonController =
      TextEditingController();
  final TextEditingController _expenseAmountController =
      TextEditingController();
  final TextEditingController _expenseNumberOfTimesController =
      TextEditingController();

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

  List<ExpenseAndIncomeSubCategoryModel> subcategories = [];
  List<Reason> categoryReasonList = [];
  List<Reason> reasonlist = [
    Reason(
      amount: 2.toString(),
      name: 'reason 1',
      record: 2,
    ),
    Reason(
      amount: 1.toString(),
      name: 'reason 2',
      record: 7,
    ),
    Reason(
      amount: 2.toString(),
      name: 'reason 3',
      record: 1,
    ),
    Reason(amount: 5.toString(), name: 'reason 4')
  ];

  void onAmountFocusChange() {
    if (!amountFocusNode.hasFocus)
      // expenseController.addAmount(widget.id, widget.index, amount);
      BlocProvider.of<ExpenseBloc>(context)
          .add(AddExpenseAmount(widget.categoryID, widget.index, amount));
  }

  void onReasonFocusChange() {
    if (!reasonFocusNode.hasFocus)
      // expenseController.addReason(widget.id, widget.index, reason);
      BlocProvider.of<ExpenseBloc>(context)
          .add(AddExpenseReason(widget.categoryID, widget.index, reason));
  }

  void onNumberOfTimesFocusChange() {
    if (!numberOfTimesFocusNode.hasFocus)
      // expenseController.addReason(widget.id, widget.index, reason);
      BlocProvider.of<ExpenseBloc>(context).add(AddExpenseNumberOfTimes(
          widget.categoryID, widget.index, numberOfTimes));
  }

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
    if (widget.expense.netAmount != null) {
      _expenseAmountController.text = widget.expense.netAmount.toString();
    }
    if (widget.expense.reason != null) {
      _expenseReasonController.text = widget.expense.reason;
    }

    if (widget.expense.numberOfTimes != 1) {
      _expenseNumberOfTimesController.text =
          widget.expense.numberOfTimes.toString();
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
                'widget.expense.date',
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
                                                .add(AddExpenseDate(
                                                    widget.categoryID,
                                                    widget.index,
                                                    date));
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
                    amount = newValue;
                  },
                  onEditingComplete: () {
                    BlocProvider.of<ExpenseBloc>(context).add(AddExpenseAmount(
                        widget.categoryID, widget.index, amount));
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  focusNode: numberOfTimesFocusNode,
                  keyboardType: TextInputType.number,
                  cursorHeight: 30,
                  controller: _expenseNumberOfTimesController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of times',
                    labelStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                    contentPadding: EdgeInsets.only(left: 20),
                  ),
                  onChanged: (newValue) {
                    numberOfTimes = int.parse(newValue);
                  },
                  onEditingComplete: () {
                    BlocProvider.of<ExpenseBloc>(context).add(
                        AddExpenseNumberOfTimes(
                            widget.categoryID, widget.index, numberOfTimes));
                  },
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
                child: Align(
              child: Wrap(
                  children: [Text('By default number of times is set to 1')]),
            )),
          ],
        ),
        SizedBox(
          height: 10,
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
                          AddExpenseReason(
                              widget.categoryID, widget.index, reason));
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
                    print('on pressed ${widget.categoryID}');
                    BlocProvider.of<ReasonBloc>(context).add(
                        GetAllSubCategoriesWithCategoryID(widget.categoryID));
                    BlocProvider.of<ExpenseBloc>(context)
                        .add(GetCategoryReasons(widget.categoryID));
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
                              left: 20,
                              top: 20,
                              right: 20,
                            ),
                            child: ListView(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'widget.expense.categoryName',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.brown,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                BlocBuilder<ReasonBloc, ReasonState>(
                                  builder: (_, state) {
                                    if (state
                                        is AllSubCategoriesWithCategoryIDFetched) {
                                      print(
                                          'called called ${widget.categoryID}');
                                      state.subcategories.forEach((element) {
                                        print(element.subcategoryName);
                                      });
                                      subcategories = state.subcategories;
                                    }

                                    return ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          SubcategoryReasonSelect(
                                        subCategoryModel: subcategories[index],
                                        index: widget.index,
                                        categoryID: widget.categoryID,
                                        subcategoryID: subcategories[index].id,
                                      ),
                                      itemCount: subcategories.length,
                                    );
                                  },
                                ),
                                BlocBuilder<ExpenseBloc, ExpenseState>(
                                  builder: (_, state) {
                                    if (state is CategoryReasonsFetched) {
                                      categoryReasonList =
                                          state.categoryReasons;
                                    }

                                    return ReasonList(
                                      reasonList: categoryReasonList,
                                      categoryID: widget.categoryID,
                                      index: widget.index,
                                    );
                                  },
                                ),
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
                        .add(AddAnotherItem(widget.categoryID));
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
                        .add(FinishCategory(widget.categoryID));
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
