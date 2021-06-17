import 'package:flutter/material.dart';

class RecurPeriodSelect extends StatefulWidget {
  @override
  _RecurPeriodSelectState createState() => _RecurPeriodSelectState();
}

class _RecurPeriodSelectState extends State<RecurPeriodSelect> {
  bool hasRecurringPeriod = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Recurring period',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  child: Switch(
                    value: hasRecurringPeriod,
                    onChanged: (value) {
                      setState(
                            () {
                          hasRecurringPeriod = value;
                        },
                      );
                      // if (!value) {
                      //   hasFrequency = false;
                      // }
                    },
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                flex: 3,
                child: Text(
                    'With recurring period disabled, tasks appear every week with the days set'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
