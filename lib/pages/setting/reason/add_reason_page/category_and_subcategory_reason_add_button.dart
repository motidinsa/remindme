import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/database_models/reason/reason_model.dart';
import '../../../../getx_controller/reason/reason_controller.dart';

class ReasonCategoryAndSubcategorySelect extends StatelessWidget {
  final int categoryId;
  final ReasonController reasonController = Get.find();

  ReasonCategoryAndSubcategorySelect({
    Key key,
    this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                child: const Text(
                  'Add reason to category dbhfvfd vfvf',
                  textAlign: TextAlign.center,
                ),
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  reasonController.addReason(
                    categoryId,
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
                  // FocusScope.of(context).unfocus();
                  // for (var element in incomeAndExpenseController.subcategories) {
                  //   element.isSelected = false;
                  // }
                  // incomeAndExpenseController.selectedSubSubcategories = [];
                  // showModalBottomSheet(
                  //   shape: const RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(10),
                  //       topRight: Radius.circular(10),
                  //     ),
                  //   ),
                  //   context: context,
                  //   builder: (context) => SelectSubcategory(
                  //     categoryId: categoryId,
                  //     categoryCardId: categoryCardId,
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
