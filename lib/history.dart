import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  TextEditingController _dayInitialController = TextEditingController();
  TextEditingController _dayFinalController = TextEditingController();
  TextEditingController _monthInitialController = TextEditingController();
  TextEditingController _monthFinalController = TextEditingController();
  TextEditingController _yearInitialController = TextEditingController();
  TextEditingController _yearFinalController = TextEditingController();

  String name;
  String dateSelected =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  TextEditingController _expenseAmountController = TextEditingController();

  DateTime _selectedDate;
  String date;
  String dateSet =
      '${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().year}';
  String _dateCount;
  String _range;
  String _rangeCount;
  String displayType;
  String sortType;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(
      () {
        if (args.value is DateTime) {
          _selectedDate = args.value;
          // date =
          // '${DateTime.parse(_selectedDate).day > 9 ? DateTime.parse(_selectedDate).day : '0${DateTime.parse(_selectedDate).day}'}-${DateTime.parse(_selectedDate).month > 9 ? DateTime.parse(_selectedDate).month : '0${DateTime.parse(_selectedDate).month}'}-${DateTime.parse(_selectedDate).year}';
          // print(_selectedDate);
          // print(date);
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListView(
        children: [
          Text(
            'Select time range',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .5,
                margin: EdgeInsets.only(top: 5),
                // color: Colors.green,
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text(
                            'Day',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Month',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Year',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .53,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 8,
                          child: TextField(
                            cursorHeight: 20,
                            controller: _dayInitialController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ),
                            onChanged: (text) => {name = text},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 8,
                          child: TextField(
                            cursorHeight: 20,
                            controller: _monthInitialController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ),
                            onChanged: (text) => {name = text},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 6,
                          child: TextField(
                            cursorHeight: 20,
                            controller: _yearInitialController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ),
                            onChanged: (text) => {name = text},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.grey,
                    padding: EdgeInsets.only(top: 10),
                    child: OutlinedButton(
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
                                                if (_selectedDate == null) {
                                                } else {
                                                  _dayInitialController
                                                      .text = _selectedDate
                                                              .day >
                                                          9
                                                      ? _selectedDate.day
                                                          .toString()
                                                      : '0${_selectedDate.day}';
                                                  _monthInitialController
                                                      .text = _selectedDate
                                                              .month >
                                                          9
                                                      ? _selectedDate.month
                                                          .toString()
                                                      : '0${_selectedDate.month}';
                                                  _yearInitialController.text =
                                                      _selectedDate.year
                                                          .toString();
                                                }
                                                Navigator.pop(context);
                                              },
                                            )
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
                        'Initial date',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'to',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .53,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 8,
                          child: TextField(
                            cursorHeight: 20,
                            controller: _dayFinalController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ),
                            onChanged: (text) => {name = text},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 8,
                          child: TextField(
                            cursorHeight: 20,
                            controller: _monthFinalController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ),
                            onChanged: (text) => {name = text},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 6,
                          child: TextField(
                            cursorHeight: 20,
                            controller: _yearFinalController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ),
                            onChanged: (text) => {name = text},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.grey,
                    padding: EdgeInsets.only(top: 10),
                    child: OutlinedButton(
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
                                                if (_selectedDate == null) {
                                                } else {
                                                  _dayFinalController
                                                      .text = _selectedDate
                                                              .day >
                                                          9
                                                      ? _selectedDate.day
                                                          .toString()
                                                      : '0${_selectedDate.day}';
                                                  _monthFinalController
                                                      .text = _selectedDate
                                                              .month >
                                                          9
                                                      ? _selectedDate.month
                                                          .toString()
                                                      : '0${_selectedDate.month}';
                                                  _yearFinalController.text =
                                                      _selectedDate.year
                                                          .toString();
                                                }
                                                Navigator.pop(context);
                                              },
                                            )
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
                        'Final date',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Display type',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: DropdownButton(
                      value: displayType,
                      hint: Text('Select type'),
                      items: [
                        DropdownMenuItem(
                          child: Text('Report'),
                          value: 'Report',
                        ),
                        DropdownMenuItem(
                          child: Text('ToDo'),
                          value: 'ToDo',
                        ),
                        DropdownMenuItem(
                          child: Text('Report and ToDo'),
                          value: 'Report and ToDo',
                        )
                      ],
                      onChanged: (value) {
                        setState(
                          () {
                            displayType = value;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Sort by',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: DropdownButton(
                      value: sortType,
                      hint: Text('Select type'),
                      items: [
                        DropdownMenuItem(
                          child: Text('Older first'),
                          value: 'older',
                        ),
                        DropdownMenuItem(
                          child: Text('Latest first'),
                          value: 'latest',
                        ),
                        DropdownMenuItem(
                          child: Text('Alphabetically'),
                          value: 'alphabetic',
                        )
                      ],
                      onChanged: (value) {
                        setState(
                          () {
                            sortType = value;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            child: OutlinedButton(
              child: Text(
                'Search',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category: Transportation',
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                        Text(
                          'Expense',
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date:',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey[600]),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    '30-01-2022',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 18),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        'This is a short description for the expense',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
