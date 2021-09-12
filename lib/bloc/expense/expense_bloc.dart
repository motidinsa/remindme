import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/bloc/expense/expense_state.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/expense_tobe_added.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/models/setting_configuration.dart';
import 'package:remindme/repository/expense_repository.dart';
import 'package:meta/meta.dart';
import 'package:remindme/repository/task_repository.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository expenseRepository;

  ExpenseBloc({this.expenseRepository})
      :
        // : assert(expenseRepository != null),
        super(NoCategoryAdded());

  @override
  Stream<ExpenseState> mapEventToState(ExpenseEvent event) async* {
    // if (event is CheckInitialization) {
    //   try {
    //     final settings = await expenseRepository.getInitializedParameters();
    //     if (settings.length == 0) {
    //       await expenseRepository.initializeCategoryAndSubcategory();
    //     }
    //     final categories = await expenseRepository.getAllCategories();
    //     final subcategories = await expenseRepository.getAllSubCategories();
    //     final subSubcategories =
    //         await expenseRepository.getAllSubSubCategories();
    //     yield CategoryInitialized(
    //         categories: categories,
    //         subcategories: subcategories,
    //         subSubcategories: subSubcategories);
    //   } catch (e) {
    //     print(e);
    //     yield CategoryInsertErrorOccurred();
    //   }
    // }

    if (event is AddExpenseCategory) {
      yield AddExpenseCategorySuccess(event.selectedCategory);
    }
    if (event is RemoveExpenseCategory) {
      yield RemoveExpenseCategorySuccess(event.categoryID);
    }
    if (event is RemoveFinishedCategory) {
      yield RemoveFinishedCategorySuccess(event.id);
    }
    if (event is ClearCategory) {
      yield CategoryCleared();
    }
    if (event is AddAnotherItem) {
      yield AnotherItemAdded(event.categoryID);
    }
    if (event is AddExpenseDate) {
      yield DateAdded(event.categoryID, event.index, event.date);
    }
    if (event is AddExpenseAmount) {
      yield AmountAdded(event.categoryID, event.index, event.amount);
    }
    if (event is AddExpenseNumberOfTimes) {
      yield NumberOfTimesAdded(
          event.categoryID, event.index, event.numberOfTimes);
    }
    if (event is AddExpenseReason) {
      yield ReasonAdded(event.categoryID, event.index, event.reason);
    }
    if (event is AddExpenseReasonFromList) {
      yield ReasonAddedFromList(
        categoryID: event.categoryID,
        subSubcategoryID: event.subSubcategoryID,
        subcategoryID: event.subcategoryID,
        reason: event.reason,
        index: event.index,
        amount: event.amount,
        reasonID: event.reasonID,
      );
    }
    if (event is AddExpenseReasonAndAmount) {
      yield ReasonAndAmountAdded(
          categoryID: event.categoryID,
          index: event.index,
          reason: event.reason,
          subcategoryID: event.subcategoryID,
          amount: event.amount);
    }
    if (event is FinishCategory) {
      yield CategoryFinished(event.id);
      // yield RemoveExpenseCategorySuccess(event.id);
    }
    // if (event is AddExpense) {
    //   try {
    //     await expenseRepository.insertExpenses(
    //         event.finishedCategories, event.expenseDetails, event.type);
    //     List<ExpenseAndIncome> allTransaction =
    //         await expenseRepository.getAllIncomeAndExpense();
    //     print('the len ${allTransaction.length}');
    //     yield AllIncomeAndExpenseFetched(allTransaction);
    //   } catch (e) {
    //     print(e);
    //     yield ExpenseAddingFailed();
    //   }
    // }
    // if (event is GetAllIncomeAndExpense) {
    //   try {
    //     List<ExpenseAndIncome> allTransaction =
    //         await expenseRepository.getAllIncomeAndExpense();
    //
    //     yield AllIncomeAndExpenseFetched(allTransaction);
    //   } catch (e) {
    //     print(e);
    //     yield AllIncomeAndExpenseFailed();
    //   }
    // }
    if (event is LoadAllExpense) {
      try {
        final allExpenses = await expenseRepository.allExpenses();
        // print(allExpenses.length.toString()+' working');
        yield AllExpenseLoaded(allExpenses);
      } catch (e) {
        print(e);
        yield ExpenseLoadingFailed();
      }
    }
    if (event is ExpenseAndIncomeAdded) {
      try {
        final allExpenses = await expenseRepository.allExpenses();
        // print(allExpenses.length.toString()+' working');
        yield AllExpenseLoaded(allExpenses);
      } catch (e) {
        print(e);
        yield ExpenseLoadingFailed();
      }
    }
    if (event is GetCategoryReasons) {
      try {
        List<Reason> categoryReasons =
            await expenseRepository.getCategoryReasons(event.categoryID);

        yield CategoryReasonsFetched(categoryReasons);
      } catch (e) {
        print(e);
        yield ExpenseAddingFailed();
      }
    }
    if (event is GetSubCategoryReasons) {
      try {
        List<Reason> subcategoryReasons =
            await expenseRepository.getSubCategoryReasons(event.subcategoryID);

        yield SubCategoryReasonsFetched(subcategoryReasons);
      } catch (e) {
        print(e);
        yield ExpenseAddingFailed();
      }
    }
    if (event is GetSubSubCategoryReasons) {
      try {
        List<Reason> subsubcategoryReasons = await expenseRepository
            .getSubSubCategoryReasons(event.subsubcategoryID);

        yield SubSubCategoryReasonsFetched(subsubcategoryReasons);
      } catch (e) {
        print(e);
        yield ExpenseAddingFailed();
      }
    }
  }
}
