import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remindme/models/sub_account_model.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_account/select_account.dart';

import '../../../../getx_controller/income_and_expense/income_and_expense_controller.dart';
import '../../../../models/account_model.dart';

class CategoryAccountSelect extends StatelessWidget {
  CategoryAccountSelect(
      {Key key,
      this.accountId,
      this.subAccountId,
      this.categoryCardId,
      this.categoryId})
      : super(key: key);
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();
  final int accountId;
  final int subAccountId;
  final int categoryId;
  final int categoryCardId;

  // AccountModel accountModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 6,
            child: const Text(
              'Selected account',
              textAlign: TextAlign.right,
            )),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 8,
          child: Card(
            elevation: 2,
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    incomeAndExpenseController.accountModels
                        .firstWhere((element) => element.id == accountId)
                        .accountName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  if (subAccountId != null)
                    Text(
                      incomeAndExpenseController.subAccountModels
                          .firstWhere((element) => element.id == subAccountId)
                          .subAccountName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black54),
                    ),
                  if (subAccountId != null)
                    SizedBox(
                      height: 2,
                    ),
                  Text(
                    'ETB ${subAccountId != null ? incomeAndExpenseController.subAccountModels.firstWhere((element) => element.id == subAccountId).balance : incomeAndExpenseController.accountModels.firstWhere((element) => element.id == accountId).balance}',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 6,
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                context: context,
                builder: (context) => SelectAccount(
                  categoryId: categoryId,
                  categoryCardId: categoryCardId,
                ),
              ).then(
                  (value) => incomeAndExpenseController.resetSelectedAccount());
            },
            child: const Text('Change'),
            // style: TextButton.styleFrom(
            //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            // ),
          ),
        )
      ],
    );
  }
}
