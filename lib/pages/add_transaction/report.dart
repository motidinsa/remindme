import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  final String reportType;
  final double income;
  final double expense;

  Report(this.reportType, this.income, this.expense);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey,
              //       offset: const Offset(
              //         0.0,
              //         5.0,
              //       ),
              //       blurRadius: 15.0,
              //       spreadRadius: 1.0,
              //     ),
              //     BoxShadow(
              //       color: Colors.white,
              //       offset: const Offset(0.0, 0.0),
              //       blurRadius: 0.0,
              //       spreadRadius: 0.0,
              //     ),
              //   ],
              // ),
              // decoration: BoxDecoration(color: Colors.grey),
              child: Column(
                children: [
                  Text(
                    reportType == 'day'
                        ? 'Daily report'
                        : reportType == 'week'
                            ? 'Weekly report'
                            : reportType == 'month'
                                ? 'Monthly report'
                                : reportType == 'all'
                                    ? 'All time report'
                                    : '',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total income: ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '$income birr',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.green),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total income_and_expense: ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '$expense birr',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.red),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Net: ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '${income - expense} birr',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () => {},
                          child: Text('Detail'),
                          textColor: Colors.blue,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
