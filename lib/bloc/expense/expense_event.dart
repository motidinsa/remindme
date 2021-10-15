import 'package:equatable/equatable.dart';
import 'package:remindme/models/expense_tobe_added.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();
}

class AddExpenseCategory extends ExpenseEvent {
  final IncomeAndExpenseCategorySelect selectedCategory;

  const AddExpenseCategory(this.selectedCategory);

  @override
  List<Object> get props => [selectedCategory];
}

class RemoveExpenseCategory extends ExpenseEvent {
  final int categoryID;

  const RemoveExpenseCategory(this.categoryID);

  @override
  List<Object> get props => [categoryID];
}

class AddAnotherItem extends ExpenseEvent {
  final int categoryID;

  const AddAnotherItem(this.categoryID);

  @override
  List<Object> get props => [];
}

class AddExpenseDate extends ExpenseEvent {
  final int categoryID;
  final int index;
  final String date;

  const AddExpenseDate(this.categoryID, this.index, this.date);

  @override
  List<Object> get props => [];
}

class AddExpenseAmount extends ExpenseEvent {
  final int categoryID;
  final int index;
  final String amount;

  const AddExpenseAmount(this.categoryID, this.index, this.amount);

  @override
  List<Object> get props => [categoryID, index, amount];
}

class AddExpenseNumberOfTimes extends ExpenseEvent {
  final int categoryID;
  final int index;
  final int numberOfTimes;

  const AddExpenseNumberOfTimes(
      this.categoryID, this.index, this.numberOfTimes);

  @override
  List<Object> get props => [];
}

class AddExpenseReason extends ExpenseEvent {
  final int categoryID;
  final int index;
  final String reason;

  const AddExpenseReason(this.categoryID, this.index, this.reason);

  @override
  List<Object> get props => [];
}

class AddExpenseReasonFromList extends ExpenseEvent {
  final int categoryID;
  final int subcategoryID;
  final int subSubcategoryID;
  final int index;
  final int reasonID;
  final String reason;
  final String amount;

  const AddExpenseReasonFromList({
    this.categoryID,
    this.index,
    this.reason,
    this.subcategoryID,
    this.subSubcategoryID,
    this.amount,
    this.reasonID,
  });

  @override
  List<Object> get props => [reason, amount];
}

class AddExpenseReasonAndAmount extends ExpenseEvent {
  final int categoryID;
  final int subcategoryID;
  final int index;
  final String reason;
  final String amount;

  const AddExpenseReasonAndAmount(
      {this.categoryID,
      this.index,
      this.reason,
      this.amount,
      this.subcategoryID});

  @override
  List<Object> get props => [];
}

class FinishCategory extends ExpenseEvent {
  final int id;

  const FinishCategory(this.id);

  @override
  List<Object> get props => [];
}

class RemoveFinishedCategory extends ExpenseEvent {
  final int id;

  const RemoveFinishedCategory(this.id);

  @override
  List<Object> get props => [];
}

class NoCategory extends ExpenseEvent {
  const NoCategory();

  @override
  List<Object> get props => [];
}

class ClearCategory extends ExpenseEvent {
  const ClearCategory();

  @override
  List<Object> get props => [];
}

// class AddExpense extends ExpenseEvent {
//   final List<FinishedCategory> finishedCategories;
//   final List<List<ExpenseDetail>> expenseDetails;
//   final String type;
//
//   const AddExpense({this.finishedCategories, this.expenseDetails, this.type});
//
//   @override
//   List<Object> get props => [finishedCategories,expenseDetails];
// }

class LoadAllExpense extends ExpenseEvent {
  const LoadAllExpense();

  @override
  List<Object> get props => [];
}

class LoadDailyExpense extends ExpenseEvent {
  const LoadDailyExpense();

  @override
  List<Object> get props => [];
}

class LoadWeeklyExpense extends ExpenseEvent {
  const LoadWeeklyExpense();

  @override
  List<Object> get props => [];
}

class LoadMonthlyExpense extends ExpenseEvent {
  const LoadMonthlyExpense();

  @override
  List<Object> get props => [];
}

class InitializeCategoryAndSubcategory extends ExpenseEvent {
  const InitializeCategoryAndSubcategory();

  @override
  List<Object> get props => [];
}

class GetCategoryReasons extends ExpenseEvent {
  final int categoryID;

  const GetCategoryReasons(this.categoryID);

  @override
  List<Object> get props => [];
}

class GetSubCategoryReasons extends ExpenseEvent {
  final int subcategoryID;

  const GetSubCategoryReasons(this.subcategoryID);

  @override
  List<Object> get props => [subcategoryID];
}

class GetSubSubCategoryReasons extends ExpenseEvent {
  final int subsubcategoryID;

  const GetSubSubCategoryReasons(this.subsubcategoryID);

  @override
  List<Object> get props => [subsubcategoryID];
}
// class GetAllIncomeAndExpense extends ExpenseEvent {
//
//   const GetAllIncomeAndExpense();
//
//   @override
//   List<Object> get props => [];
// }
