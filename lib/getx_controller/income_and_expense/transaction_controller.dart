import 'package:collection/src/iterable_extensions.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:remindme/database_models/income_and_expense/income_and_expense_model.dart';

class TransactionController extends GetxController {
  List<IncomeAndExpenseModel> transactions;
  Map<DateTime, List<IncomeAndExpenseModel>> groupedTransaction;
  List<DateTime> sortedDates;

  void updateTransaction(List<IncomeAndExpenseModel> currentTransaction) {
    transactions = currentTransaction;
    groupedTransaction =
        transactions.groupListsBy((element) => element.selectedDateAndTime);
    sortedDates = groupedTransaction.keys.toList(growable: false)
      ..sort((k1, k2) {
        if (k2 == null) {
          return 0;
        }
        return k2.compareTo(k1);
      });
  }

  void onReorder(int oldIndex, int newIndex, DateTime date) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    IncomeAndExpenseModel deletedTransaction =
        groupedTransaction[date][oldIndex];

    List<int> sortedOrderNumbers =
        groupedTransaction[date].map((e) => e.orderNumber).toList();
    groupedTransaction[date].removeAt(oldIndex);
    groupedTransaction[date].insert(newIndex, deletedTransaction);

    for (int i = 0; i < groupedTransaction[date].length; i++) {
      Hive.box<IncomeAndExpenseModel>('income_and_expense').put(
          groupedTransaction[date][i].id,
          groupedTransaction[date][i]..orderNumber = sortedOrderNumbers[i]);
    }
  }
}
