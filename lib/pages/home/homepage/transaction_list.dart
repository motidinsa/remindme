import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:remindme/database_models/income_and_expense/income_and_expense_model.dart';
import 'package:remindme/getx_controller/income_and_expense/transaction_controller.dart';
import 'package:remindme/pages/home/homepage/single_transaction.dart';

class TransactionList extends StatelessWidget {
  final TransactionController transactionController = Get.find();

  TransactionList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<IncomeAndExpenseModel>>(
      valueListenable:
          Hive.box<IncomeAndExpenseModel>('income_and_expense').listenable(),
      builder: (context, box, _) {
        transactionController.updateTransaction(box.values.toList());
        return ListView.builder(
          itemCount: transactionController.sortedDates.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => SingleTransaction(
            date: transactionController.sortedDates[index],
            incomeAndExpenseModel: transactionController
                .groupedTransaction[transactionController.sortedDates[index]],
          ),
        );
      },
    );
  }
}
