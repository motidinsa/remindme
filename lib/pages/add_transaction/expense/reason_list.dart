import 'package:flutter/material.dart';
import 'package:mytask/models/reason.dart';
import 'package:mytask/pages/add_transaction/expense/single_reason.dart';

class ReasonList extends StatelessWidget {
  final List<Reason> reasonList;

  ReasonList(this.reasonList);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => SingleReason(
                name: reasonList[index].name,
                amount: reasonList[index].amount,
                record: reasonList[index].record,
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: reasonList.length),
    );
  }
}
