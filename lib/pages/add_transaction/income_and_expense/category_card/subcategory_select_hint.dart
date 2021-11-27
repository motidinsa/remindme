import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';

class SubcategorySelectHint extends StatelessWidget {
  SubcategorySelectHint({Key key}) : super(key: key);
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return incomeAndExpenseController.subcategorySelectHintDismissed
        ? Container()
        : Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: Text(
                  'Subcategories will be automatically added from a predefined reason',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 18,
                ),
                onTap: () {
                  incomeAndExpenseController.dismissHint();
                },
                borderRadius: BorderRadius.circular(30),
              )
            ],
          );
  }
}
