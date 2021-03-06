import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';

class SubSubcategorySelectItem extends StatelessWidget {
  final IncomeAndExpenseSubSubCategoryModel subSubcategoryModel;
  final int categoryCardId;

  // final IncomeAndExpenseController controller = Get.find();
  final controller;
  final String type;
  final int id;

  const SubSubcategorySelectItem({
    Key key,
    this.subSubcategoryModel,
    this.categoryCardId,
    this.controller,
    this.type,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        type == 'reason'
            ? id != null
                ? controller.editCategory(
                    categoryId: subSubcategoryModel.categoryID,
                    subcategoryId: subSubcategoryModel.subcategoryID,
                    subSubcategoryId: subSubcategoryModel.id,
                    id: id)
                : controller.addReason(
                    categoryId: subSubcategoryModel.categoryID,
                    subcategoryId: subSubcategoryModel.subcategoryID,
                    subSubcategoryId: subSubcategoryModel.id)
            : controller.updateCategoryModelDetailFromSubSubcategory(
                subSubcategoryModel.categoryID,
                subSubcategoryModel.subcategoryID,
                subSubcategoryModel.id,
                categoryCardId);
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subSubcategoryModel.subSubcategoryName,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
