import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/reason.dart';

class SubSubcategoryReasonSelect extends StatelessWidget {
  final List<Reason> reason;
  final int categoryCardId;
  final String subSubcategoryName;
  final int subSubcategoryId;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  SubSubcategoryReasonSelect(
      {Key key,
      this.subSubcategoryName,
      this.reason,
      this.categoryCardId,
      this.subSubcategoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Card(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) => ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        reason[i].name,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    trailing: Text(
                      reason[i].amount,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
              itemCount: reason.length),
        ),
      ),
    );
  }
}
