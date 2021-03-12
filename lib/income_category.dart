import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/expense_category.dart';
import 'package:mytodo/reason.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Income extends StatefulWidget {
  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  String dateSelected =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
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
                          'Monthly Income',
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
            margin: EdgeInsets.only(left: 20,top: 30),
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
