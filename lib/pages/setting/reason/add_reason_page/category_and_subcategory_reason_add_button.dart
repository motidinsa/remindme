import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/database_models/reason/reason_model.dart';
import '../../../../getx_controller/reason/reason_controller.dart';
import '../../../add_transaction/income_and_expense/category_card/select_subcategory/select_subcategory.dart';

class ReasonCategoryAndSubcategorySelect extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  final ReasonController reasonController = Get.find();

  ReasonCategoryAndSubcategorySelect(
      {Key key, this.categoryId, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                child: Text(
                  'Add reason to $categoryName',
                  textAlign: TextAlign.center,
                ),
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  reasonController.removeFocus();
                  // FocusScope.of(context).unfocus();
                  reasonController.addReason(
                    categoryId: categoryId,
                  );
                  // FocusScope.of(context).unfocus();
                  // for (var element in incomeAndExpenseController.reasons) {
                  //   element.isSubcategorySelected = false;
                  // }
                  // incomeAndExpenseController.subcategoryReasons = [];
                  // showModalBottomSheet(
                  //   shape: const RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(10),
                  //       topRight: Radius.circular(10),
                  //     ),
                  //   ),
                  //   context: context,
                  //   builder: (context) => SelectReason(
                  //     categoryCardId: categoryCardId,
                  //     categoryId: categoryId,
                  //   ),
                  // );
                },
              ),
            ),
            Expanded(
              child: TextButton(
                child: const Text(
                  'Add reason to Subcategory',
                  textAlign: TextAlign.center,
                ),
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  reasonController.removeFocus();
                  FocusScope.of(context).unfocus();
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
                      // categoryCardId: categoryCardId,
                      controller: reasonController,
                      type: 'reason',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
