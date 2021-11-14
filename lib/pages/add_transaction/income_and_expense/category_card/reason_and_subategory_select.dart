import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_reason/select_reason.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/subcategory_select_hint.dart';

import 'select_subcategory/select_subcategory.dart';

class ReasonAndSubcategorySelect extends StatelessWidget {
  final int categoryId;
  final int categoryCardId;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  ReasonAndSubcategorySelect({Key key, this.categoryId, this.categoryCardId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text('Predefined reason'),
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                for (var element in incomeAndExpenseController.reasons) {
                  element.isSubcategorySelected = false;
                }
                incomeAndExpenseController.subcategoryReasons = [];
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  context: context,
                  builder: (context) => SelectReason(
                    categoryCardId: categoryCardId,
                    categoryId: categoryId,
                  ),
                );
              },
            ),
            TextButton(
              child: const Text('Select Subcategory'),
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                for (var element in incomeAndExpenseController.subcategories) {
                  element.isSelected = false;
                }
                incomeAndExpenseController.selectedSubSubcategories = [];
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  context: context,
                  builder: (context) => SelectSubcategory(
                    categoryId: categoryId,
                    categoryCardId: categoryCardId,
                  ),
                );
              },
            ),
          ],
        ),
        const SubcategorySelectHint()
      ],
    );
  }
}
