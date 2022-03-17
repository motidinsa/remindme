import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import '../../../../../models/account_model.dart';

class AccountSelectItem extends StatelessWidget {
  final AccountModel accountModel;
  final int categoryId;
  final int categoryCardId;

  // final int categoryCardId;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  AccountSelectItem({
    Key key,
    this.accountModel,
    this.categoryId,
    this.categoryCardId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: accountModel.isSelected == true ? Colors.green.shade50 : null,
      child: InkWell(
        onTap: () {
          if (accountModel.hasSubAccount == true) {
            incomeAndExpenseController.fetchSubAccountList(accountModel.id);
            incomeAndExpenseController
                .changeSelectedAccountColor(accountModel.id);
            // incomeAndExpenseController
            //     .removeBackgroundColorOfSelectedSubSubCategoryReason();
            // print('cat id ${reason.categoryId} subcat ${reason.subcategoryId}');
          } else {
            incomeAndExpenseController.setAccountDetail(
                accountModel.id, categoryId, categoryCardId);
            Get.back();
          }
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
                        accountModel.accountName,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  if (accountModel.hasSubAccount == true)
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
              const SizedBox(
                height: 5,
              ),
              Text(
                'ETB ${accountModel.balance}',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
