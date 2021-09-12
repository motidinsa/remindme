import 'package:equatable/equatable.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';

class ExpenseAndIncomeState extends Equatable {
  const ExpenseAndIncomeState();

  @override
  List<Object> get props => [];
}

class NoIncomeAndExpenseFound extends ExpenseAndIncomeState {}

class AllIncomeAndExpenseFetched extends ExpenseAndIncomeState {
  final List<ExpenseAndIncome> allIncomeAndExpense;
  final List<ExpenseAndIncomeSubCategoryModel> allSubcategories;

  final List<ExpenseAndIncomeSubSubCategoryModel> allSubSubcategories;

  const AllIncomeAndExpenseFetched(
      {this.allIncomeAndExpense,
      this.allSubcategories,
      this.allSubSubcategories});

  @override
  List<Object> get props => [allIncomeAndExpense, allIncomeAndExpense.length];
}

class AllIncomeAndExpenseFailed extends ExpenseAndIncomeState {
  const AllIncomeAndExpenseFailed();

  @override
  List<Object> get props => [];
}
