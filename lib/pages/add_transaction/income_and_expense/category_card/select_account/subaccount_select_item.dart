import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import '../../../../../models/sub_account_model.dart';

class SubAccountSelectItem extends StatelessWidget {
  final SubAccountModel subAccountModel;
  final int categoryId;
  final int categoryCardId;

  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  // final int categoryCardId;
  // final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  SubAccountSelectItem(
      {Key key, this.subAccountModel, this.categoryId, this.categoryCardId
      // this.categoryCardId,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: subcategoryModel.isSelected ? Colors.green.shade50 : null,
      child: InkWell(
        onTap: () {
          incomeAndExpenseController.setSubAccountDetail(
              subAccountModel.accountId,
              subAccountModel.accountName,
              subAccountModel.id,
              subAccountModel.subAccountName,
              categoryId,
              categoryCardId);
          Get.back();
          // if (subcategoryModel.subSubcategoryCount > 0) {
          //   incomeAndExpenseController.fetchSubSubcategories(
          //       subcategoryModel.categoryID, subcategoryModel.id);
          //   incomeAndExpenseController.changeSelectedSubcategoryColor(
          //       subcategoryModel.categoryID, subcategoryModel.id);
          // } else {
          //   incomeAndExpenseController.updateCategoryModelDetailFromSubcategory(
          //       subcategoryModel.categoryID,
          //       subcategoryModel.id,
          //       categoryCardId);
          //   Get.back();
          // }
        },
        // onLongPress: () {
        //   // incomeAndExpenseController.updateCategoryModelDetailFromSubcategory(
        //   //     subcategoryModel.categoryID, subcategoryModel.id, categoryCardId);
        //   // Get.back();
        // },
        // color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  // if (subcategoryModel.subSubcategoryCount > 0) const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        subAccountModel.subAccountName,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${subAccountModel.balance}',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
