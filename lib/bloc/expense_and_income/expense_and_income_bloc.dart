import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/repository/expense_repository.dart';

import 'expense_and_income_event.dart';
import 'expense_and_income_state.dart';

class ExpenseAndIncomeBloc
    extends Bloc<ExpenseAndIncomeEvent, ExpenseAndIncomeState> {
  final ExpenseRepository expenseRepository;

  ExpenseAndIncomeBloc({this.expenseRepository})
      :
        // : assert(expenseRepository != null),
        super(NoIncomeAndExpenseFound());

  @override
  Stream<ExpenseAndIncomeState> mapEventToState(
      ExpenseAndIncomeEvent event) async* {
    if (event is GetAllIncomeAndExpense) {
      try {
        List<ExpenseAndIncome> allTransaction =
            await expenseRepository.getAllIncomeAndExpense();
        List<IncomeAndExpenseSubCategoryModel> allSubcategories =
            await expenseRepository.getAllSubCategories();
        List<IncomeAndExpenseSubSubCategoryModel> allSubSubcategories =
            await expenseRepository.getAllSubSubCategories();
        print('the len ${allTransaction.length}');
        yield AllIncomeAndExpenseFetched(
            allIncomeAndExpense: allTransaction,
            allSubcategories: allSubcategories,
            allSubSubcategories: allSubSubcategories);
      } catch (e) {
        print(e);
        yield AllIncomeAndExpenseFailed();
      }
    }
    if (event is AddExpense) {
      try {
        await expenseRepository.insertExpenses(
            event.finishedCategories, event.expenseDetails, event.type);
        List<ExpenseAndIncome> allTransaction =
            await expenseRepository.getAllIncomeAndExpense();
        List<IncomeAndExpenseSubCategoryModel> allSubcategories =
            await expenseRepository.getAllSubCategories();
        List<IncomeAndExpenseSubSubCategoryModel> allSubSubcategories =
            await expenseRepository.getAllSubSubCategories();
        print('the len ${allTransaction.length}');
        yield AllIncomeAndExpenseFetched(
            allIncomeAndExpense: allTransaction,
            allSubcategories: allSubcategories,
            allSubSubcategories: allSubSubcategories);
      } catch (e) {
        print(e);
        yield AllIncomeAndExpenseFailed();
      }
    }
  }
}
