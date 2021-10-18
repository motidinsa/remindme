import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';

class MultipleCategoryCard extends StatelessWidget {
  final List<Widget> cardList;
  final int categoryId;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  MultipleCategoryCard({Key key, this.cardList, this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: incomeAndExpenseController,
      builder: (_) => ListView.builder(
        shrinkWrap: true,
        physics: cardList.length == 1
            ? const NeverScrollableScrollPhysics()
            : const ClampingScrollPhysics(),
        itemBuilder: (context, index) => cardList[index],
        itemCount: cardList.length,
      ),
    );
  }
}
