import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hive/hive.dart';
import 'package:remindme/database_models/income_and_expense/income_and_expense_model.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/category_card_model.dart';

class IncomeAndExpenseOperation {
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  static List<IncomeAndExpenseModel> getAllIncomeAndExpense() {
    return Hive.box<IncomeAndExpenseModel>('income_and_expense')
        .values
        .toList();
  }

  void insertIncomeAndExpense() async {
    await Hive.openBox<IncomeAndExpenseModel>('income_and_expense');
    for (int i = 0; i < incomeAndExpenseController.categoryModels.length; i++) {
      List<CategoryCardModel> categoryCardModels =
          incomeAndExpenseController.categoryModels[i].categoryCardModels;
      for (int j = 0; j < categoryCardModels.length; j++) {
        final id = await Hive.box<IncomeAndExpenseModel>('income_and_expense')
            .add(IncomeAndExpenseModel());

        Hive.box<IncomeAndExpenseModel>('income_and_expense').put(
          id,
          IncomeAndExpenseModel(
              id: id,
              name: categoryCardModels[j].reason,
              categoryId: categoryCardModels[j].categoryId,
              subcategoryId: categoryCardModels[j].subcategoryId,
              subSubcategoryId: categoryCardModels[j].subSubCategoryId,
              dateAndTimeAdded: DateTime.now(),
              selectedDateAndTime: categoryCardModels[j].date,
              userId: 0,
              frequency: categoryCardModels[j].frequency,
              netAmount: categoryCardModels[j].netAmount,
              categoryName: categoryCardModels[j].categoryName,
              subcategoryName: categoryCardModels[j].subcategoryName,
              subSubcategoryName: categoryCardModels[j].subSubcategoryName,
              location: categoryCardModels[j].location,
              dateType: 'gr',
              type: categoryCardModels[j].categoryType,
              accountId: categoryCardModels[j].accountId,
              subAccountId: categoryCardModels[j].subAccountId,
              orderNumber: id,
              accountName: categoryCardModels[j].accountName,
              subAccountName: categoryCardModels[j].subAccountName,
              totalAmount: categoryCardModels[j].frequency *
                  categoryCardModels[j].netAmount),
        );
      }
    }
  }
}
