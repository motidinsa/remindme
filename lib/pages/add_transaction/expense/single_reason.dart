import 'package:flutter/material.dart';

class SingleReason extends StatelessWidget {
  final String name;
  final String amount;
  final int record;
  final int id;

  SingleReason({
    this.amount,
    this.name,
    this.record,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 18, color: Colors.grey),
            textAlign: TextAlign.start,
          ),
          Text('Amount: $amount'),
          Text(
            record == null
                ? '0 record'
                : record == 1
                    ? '$record record'
                    : '$record records',
            style: TextStyle(color: Colors.green),
          )
        ],
      ),
    );
  }
}
