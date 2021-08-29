import 'package:equatable/equatable.dart';
import 'package:mytask/models/expense_and_income_category.dart';
import 'package:mytask/models/expense_and_income_subcategory.dart';
import 'package:mytask/models/expense_and_income_subsubcategory.dart';
import 'package:mytask/models/expense_tobe_added.dart';
import 'package:mytask/models/expense_and_income.dart';
import 'package:mytask/models/finished_category.dart';
import 'package:mytask/pages/add_transaction/expense/expense_category.dart';
import 'package:mytask/pages/add_transaction/expense/expense_detail.dart';

class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class AddExpenseCategorySuccess extends ExpenseState {
  final ExpenseAndIncomeCategory selectedCategory;

  const AddExpenseCategorySuccess(this.selectedCategory);

  @override
  List<Object> get props => [selectedCategory];
}

class RemoveExpenseCategorySuccess extends ExpenseState {
  final int categoryID;

  const RemoveExpenseCategorySuccess(this.categoryID);

  @override
  List<Object> get props => [categoryID];
}

class RemoveFinishedCategorySuccess extends ExpenseState {
  final int categoryID;

  const RemoveFinishedCategorySuccess(this.categoryID);

  @override
  List<Object> get props => [categoryID];
}

class NoCategoryAdded extends ExpenseState {}

class CategoryCleared extends ExpenseState {}

class AnotherItemAdded extends ExpenseState {
  final int categoryID;

  AnotherItemAdded(this.categoryID);

  @override
  List<Object> get props => [categoryID];
}

class DateAdded extends ExpenseState {
  final int categoryID;
  final int index;
  final String date;

  DateAdded(this.categoryID, this.index, this.date);

  @override
  List<Object> get props => [categoryID];
}

class AmountAdded extends ExpenseState {
  final int categoryID;
  final int index;
  final double amount;

  AmountAdded(this.categoryID, this.index, this.amount);

  @override
  List<Object> get props => [categoryID];
}

class NumberOfTimesAdded extends ExpenseState {
  final int categoryID;
  final int index;
  final int numberOfTimes;

  NumberOfTimesAdded(this.categoryID, this.index, this.numberOfTimes);

  @override
  List<Object> get props => [categoryID];
}

class ReasonAdded extends ExpenseState {
  final int categoryID;
  final int index;
  final String reason;

  ReasonAdded(this.categoryID, this.index, this.reason);

  @override
  List<Object> get props => [categoryID];
}

class ReasonAndAmountAdded extends ExpenseState {
  final int categoryID;
  final int subcategoryID;
  final int index;
  final String reason;
  final String amount;

  ReasonAndAmountAdded(
      {this.categoryID,
      this.index,
      this.reason,
      this.subcategoryID,
      this.amount});

  @override
  List<Object> get props => [categoryID];
}

class CategoryFinished extends ExpenseState {
  final int id;

  CategoryFinished(this.id);

  @override
  List<Object> get props => [id];
}

class ExpenseAddedSuccessfully extends ExpenseState {
  final List<FinishedCategory> finishedCategories;
  final List<List<ExpenseDetail>> expenseDetails;

  ExpenseAddedSuccessfully(this.finishedCategories, this.expenseDetails);

  @override
  List<Object> get props => [expenseDetails];
}

class ExpenseAddingFailed extends ExpenseState {
  ExpenseAddingFailed();

  @override
  List<Object> get props => [];
}

class AllExpenseLoaded extends ExpenseState {
  final List<ExpenseAndIncome> allExpenses;

  AllExpenseLoaded(this.allExpenses);

  @override
  List<Object> get props => [allExpenses];
}

class DailyExpenseLoaded extends ExpenseState {
  final List<ExpenseAndIncome> dailyExpenses;

  DailyExpenseLoaded(this.dailyExpenses);

  @override
  List<Object> get props => [dailyExpenses];
}

class WeeklyExpenseLoaded extends ExpenseState {
  final List<ExpenseAndIncome> weeklyExpenses;

  WeeklyExpenseLoaded(this.weeklyExpenses);

  @override
  List<Object> get props => [weeklyExpenses];
}

class MonthlyExpenseLoaded extends ExpenseState {
  final List<ExpenseAndIncome> monthlyExpenses;

  MonthlyExpenseLoaded(this.monthlyExpenses);

  @override
  List<Object> get props => [monthlyExpenses];
}

class ExpenseLoadingFailed extends ExpenseState {
  ExpenseLoadingFailed();

  @override
  List<Object> get props => [];
}

class ExpenseAndIncomeAdded extends ExpenseState {
  ExpenseAndIncomeAdded();

  @override
  List<Object> get props => [];
}
