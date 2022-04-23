import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';

class SubcategorySelectItem extends StatelessWidget {
  final IncomeAndExpenseSubCategoryModel subcategoryModel;
  final int categoryCardId;

  // final IncomeAndExpenseController controller = Get.find();
  final String type;
  final controller;
  final int id;

  const SubcategorySelectItem({
    Key key,
    this.subcategoryModel,
    this.categoryCardId,
    this.type,
    this.controller,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: subcategoryModel.isSelected ? Colors.green.shade50 : null,
      child: InkWell(
        onTap: () {
          if (subcategoryModel.subSubcategoryCount > 0) {
            controller.fetchSubSubcategories(
                subcategoryModel.categoryID, subcategoryModel.id);
            controller.changeSelectedSubcategoryColor(
                subcategoryModel.categoryID, subcategoryModel.id);
          } else {
            type == 'reason'
                ? id != null
                    ? controller.editCategory(
                        categoryId: subcategoryModel.categoryID,
                        subcategoryId: subcategoryModel.id,
                        reasonModelId: id,
                      )
                    : controller.addReason(
                        categoryId: subcategoryModel.categoryID,
                        subcategoryId: subcategoryModel.id)
                : controller.updateCategoryModelDetailFromSubcategory(
                    subcategoryModel.categoryID,
                    subcategoryModel.id,
                    categoryCardId);
            Get.back();
          }
        },
        onLongPress: () {
          type == 'reason'
              ? id != null
                  ? controller.editCategory(
                      categoryId: subcategoryModel.categoryID,
                      subcategoryId: subcategoryModel.id,
                      reasonModelId: id)
                  : controller.addReason(
                      categoryId: subcategoryModel.categoryID,
                      subcategoryId: subcategoryModel.id)
              : controller.updateCategoryModelDetailFromSubcategory(
                  subcategoryModel.categoryID,
                  subcategoryModel.id,
                  categoryCardId);
          Get.back();
        },
        // color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              if (subcategoryModel.subSubcategoryCount > 0) const Spacer(),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    subcategoryModel.subcategoryName,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              if (subcategoryModel.subSubcategoryCount > 0)
                Expanded(
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.green,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
