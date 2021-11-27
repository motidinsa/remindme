import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';

class CategoryCarouselIndicator extends StatelessWidget {
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  CategoryCarouselIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: incomeAndExpenseController,
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: incomeAndExpenseController.categoryModels.map(
          (url) {
            return Container(
              width: 6.0,
              height: 6.0,
              margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    incomeAndExpenseController.currentCarouselPosition == url.id
                        ? Colors.green
                        : Colors.grey,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
