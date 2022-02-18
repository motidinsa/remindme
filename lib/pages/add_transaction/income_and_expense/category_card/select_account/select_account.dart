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

  SelectAccount({Key key}) : super(key: key);

  final List<AccountModel> accountModels = [
    AccountModel(
      accountName: 'Wallet',
      balance: 2500,
      id: 1,
      hasSubAccount: true,
    ),
    AccountModel(accountName: 'Bank', balance: 3300, id: 2),
    AccountModel(accountName: 'Person', balance: 1200, id: 3),
  ];
  List<SubAccountModel> subAccountModels = [
    SubAccountModel(
      id: 1,
      accountId: 1,
      subAccountName: 'Bank 1',
      balance: 500,
    ),
    SubAccountModel(
      id: 2,
      accountId: 1,
      subAccountName: 'Bank 2',
      balance: 550,
    ),
    SubAccountModel(
      id: 3,
      accountId: 1,
      subAccountName: 'Bank 3',
      balance: 1200,
    ),
    SubAccountModel(
      id: 4,
      accountId: 1,
      subAccountName: 'Bank 5',
      balance: 200,
    ),
    SubAccountModel(
      id: 5,
      accountId: 3,
      subAccountName: 'Person 1',
      balance: 1000,
    ),
    SubAccountModel(
      id: 6,
      accountId: 3,
      subAccountName: 'Person 2',
      balance: 250,
    ),
    SubAccountModel(
      id: 7,
      accountId: 3,
      subAccountName: 'Person 3',
      balance: 250,
    ),
    SubAccountModel(
      id: 8,
      accountId: 3,
      subAccountName: 'Person 4',
      balance: 250,
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Card(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => AccountSelectItem(
                            accountModel: accountModels[index],
                          ),
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.green.shade100,
                            height: 10,
                          ),
                          itemCount: accountModels.length,
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
                            subAccountModel: subAccountModels[index],
                          ),
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.green.shade100,
                            height: 10,
                          ),
                          itemCount: subAccountModels.length,
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
