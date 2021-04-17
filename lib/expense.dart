import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:mytask/expense_category.dart';
import 'package:mytask/reason.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Expense extends StatefulWidget {
  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  String dateSelected =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  TextEditingController _expenseReasonController = TextEditingController();
  TextEditingController _expenseAmountController = TextEditingController();

  String _selectedDate;
  String date;
  String dateSet =
      '${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().year}';
  String _dateCount;
  String _range;
  String _rangeCount;

  void setDate(String date) {
    setState(() {
      dateSet = date ?? dateSet;
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 20, bottom: 10),
            child: Text(
              'Category',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ExpenseCategory(
                          'Transportation',
                          Icon(
                            Icons.phonelink_setup,
                            size: 30,
                            color: Colors.black54,
                          ),
                          true),

                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.assignment,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.wysiwyg,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.app_settings_alt,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.assignment,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.wysiwyg,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        textTheme: ButtonTextTheme.accent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'More',
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
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
                  ),
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
                                  Text(
                                    'Food',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
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
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                  dateSet,
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
                                            onPressed: () => {
                                              setState(
                                                () {
                                                  setDate(date);
                                                  Navigator.pop(context);
                                                },
                                              )
                                              // DateTime date = Datetime
                                            },
                                            child: Text(
                                              'OK',
                                              style: TextStyle(
                                                  color: Colors.green),
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
        ],
      ),
    );
  }
}
