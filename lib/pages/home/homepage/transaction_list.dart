import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:remindme/database_models/income_and_expense/income_and_expense_model.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:remindme/getx_controller/income_and_expense/transaction_controller.dart';
import 'package:remindme/pages/home/homepage/single_transaction.dart';
import 'package:intl/intl.dart';
import "package:collection/collection.dart";
import 'package:sortedmap/sortedmap.dart';

class TransactionList extends StatelessWidget {
  // List<IncomeAndExpenseModel> transactions;
  final TransactionController transactionController = Get.find();

  TransactionList({Key key}) : super(key: key);

// sort(List<IncomeAndExpenseModel> transactions) async{
//   await transactions.sort(
//           (a, b) => b.selectedDateAndTime.compareTo(a.selectedDateAndTime));
// }
//   void _onReorder(int oldIndex, int newIndex) {
//     if (newIndex > oldIndex) {
//       newIndex -= 1;
//     }
//     IncomeAndExpenseModel deletedTransaction = transactions[oldIndex];
//     List<int> sortedOrderNumbers =
//         transactions.map((e) => e.orderNumber).toList();
//     transactions.removeAt(oldIndex);
//     transactions.insert(newIndex, deletedTransaction);
//
//     for (int i = 0; i < transactions.length; i++) {
//       Hive.box<IncomeAndExpenseModel>('income_and_expense').put(
//           transactions[i].id,
//           transactions[i]..orderNumber = sortedOrderNumbers[i]);
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<IncomeAndExpenseModel>>(
      valueListenable:
          Hive.box<IncomeAndExpenseModel>('income_and_expense').listenable(),
      builder: (context, box, _) {
        // transactions = box.values.toList();
        transactionController.updateTransaction(box.values.toList());
        // transactionController.is
        // Map<DateTime, List<IncomeAndExpenseModel>> a =
        //     transactions.groupListsBy((element) => element.selectedDateAndTime);
        //
        // List<DateTime> sortedKeys = a.keys.toList(growable: false)
        //   ..sort((k1, k2) => k2.compareTo(k1));

        // LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys,
        //     key: (k) => k, value: (k) => a[k]);
        // Map<DateTime, List<IncomeAndExpenseModel>> map = SortedMap();
        // map.addAll(a);
        // final reverseM =
        //     LinkedHashMap.fromEntries(map.entries.toList().reversed);

        print('called it');
        // print(a);
        // groupBy(data, (Map obj) => obj['release_date']);
        // transactions.sort((a, b) => b.orderNumber.compareTo(a.orderNumber));
        // return ReorderableListView(
        //   children: transactions
        //       .map((e) => Text(
        //             '${e.selectedDateAndTime.toString()}    ${e.orderNumber}  id ${e.id}',
        //             key: Key(e.id.toString()),
        //           ))
        //       .toList(),
        //   onReorder: _onReorder,
        // );

        return ListView.builder(
          itemCount: transactionController.sortedDates.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => SingleTransaction(
            date: transactionController.sortedDates[index],
            incomeAndExpenseModel: transactionController
                .groupedTransaction[transactionController.sortedDates[index]],
          ),
        );

        //   ListView.builder(
        //   itemBuilder: (context, index) {
        //     // final transaction = box.getAt(index);
        //     return Row(
        //       children: [
        //         Text(transactions[index].id.toString()),
        //         const SizedBox(
        //           width: 20,
        //         ),
        //         Text(transactions[index].orderNumber.toString()),
        //         const SizedBox(
        //           width: 20,
        //         ),Text(transactions[index].name ?? 'no name'),
        //         const SizedBox(
        //           width: 20,
        //         ),
        //         Text(transactions[index].categoryName ?? 'no cat'),
        //         const SizedBox(
        //           width: 20,
        //         ),
        //         Text(transactions[index].selectedDateAndTime.toString() ??
        //             'no date'),
        //       ],
        //     );
        //   },
        //   itemCount: box.values.length,
        // );
      },
    );
  }
}
