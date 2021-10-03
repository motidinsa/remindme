import 'package:flutter/material.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/single_reason.dart';

class ReasonList extends StatelessWidget {
  final List<Reason> reasonList;
  final int categoryID;
  final String type;
  final int subcategoryID;
  final int subSubcategoryID;
  final int index;

  ReasonList(
      {this.reasonList,
      this.index,
      this.subSubcategoryID,
      this.subcategoryID,
      this.categoryID,
      this.type});

  @override
  Widget build(BuildContext context) {
    print('caaaaaaat id $categoryID');
    return Card(
      elevation: 4,
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) => SingleReason(
                name: reasonList[i].name,
                amount: reasonList[i].amount,
                categoryID: categoryID,
                index: index,
                reasonID: reasonList[i].id,
                // record: reasonList[index].record,
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: reasonList.length),
    );
  }
}
