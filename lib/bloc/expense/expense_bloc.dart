import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/expense/expense_event.dart';
import 'package:mytask/bloc/expense/expense_state.dart';
import 'package:mytask/models/expense_and_income.dart';
import 'package:mytask/models/expense_tobe_added.dart';
import 'package:mytask/models/setting_configuration.dart';
import 'package:mytask/repository/expense_repository.dart';
import 'package:meta/meta.dart';
import 'package:mytask/repository/task_repository.dart';

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
    if (event is AddExpense) {
      try {
        await expenseRepository.insertExpense(ExpenseTobeAdded(
            categoryID: 2,
            categoryName: 'test only',
            netAmount: '23',
            totalAmount: '230',
            numberOfTimes: 10,
            subcategoryID: 10,
            changedDate: 'jf',
            time: 'cjk',
            reason: 'ui',
            date: 'oi',
            id: 22,
            dateType: 'gr'));
        // await expenseRepository.insertExpenses(
        //     event.finishedCategories, event.expenseDetails);
        print('yoyo di');
        // final tasks = await taskRepository.tasks();
        yield ExpenseAddedSuccessfully(
            event.finishedCategories, event.expenseDetails);
      } catch (e) {
        print(e);
        yield ExpenseAddingFailed();
      }
    }
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
  }
}
