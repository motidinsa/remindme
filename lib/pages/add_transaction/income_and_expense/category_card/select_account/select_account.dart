import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_account/subaccount_select_item.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_subcategory/sub_subcategory_select_item.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_subcategory/subcategory_select_item.dart';
import '../../../../../models/account_model.dart';
import '../../../../../models/sub_account_model.dart';
import 'account_select_item.dart';

class SelectAccount extends StatelessWidget {
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();
  final int categoryId;
  final int categoryCardId;

  SelectAccount({Key key, this.categoryId, this.categoryCardId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<AccountModel> accountsWithNoSubAccount = [];
    // for (int i = 0; i < accountModels.length; i++) {
    //   if (accountModels[i].hasSubAccount == null) {
    //     accountsWithNoSubAccount.add(accountModels[i]);
    //     accountModels.removeAt(i);
    //   }
    // }
    // accountModels.addAll(accountsWithNoSubAccount);
    // accountsWithNoSubAccount = [];
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Select Account',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              OutlinedButton(
                child: const Text('Add Account'),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              )
            ],
          ),
        ),
        GetBuilder(
          init: incomeAndExpenseController,
          builder: (controller) => WidgetSize(
            onChange: (Size size) {
              incomeAndExpenseController.updateAccountHeight(size.height);
            },
            child: SizedBox(
              height: incomeAndExpenseController.accountSelectPageHeight,
              child: Padding(
                padding: Get.context.isLandscape
                    ? const EdgeInsets.fromLTRB(20, 0, 20, 20)
                    : const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Card(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => AccountSelectItem(
                            accountModel:
                                incomeAndExpenseController.accountModels[index],
                            categoryId: categoryId,
                            categoryCardId: categoryCardId,
                          ),
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.green.shade100,
                            height: 10,
                          ),
                          itemCount:
                              incomeAndExpenseController.accountModels.length,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Card(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => SubAccountSelectItem(
                            subAccountModel: incomeAndExpenseController
                                .selectedSubAccountList[index],
                            categoryId: categoryId,
                            categoryCardId: categoryCardId,
                          ),
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.green.shade100,
                            height: 10,
                          ),
                          itemCount: incomeAndExpenseController
                              .selectedSubAccountList.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
