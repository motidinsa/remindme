import 'package:equatable/equatable.dart';
import 'package:mytask/models/expense.dart';
import 'package:mytask/pages/add_transaction/expense/expense_category.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();
}

class AddExpenseCategory extends ExpenseEvent {
  final ExpenseCategoryy selectedCategory;

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
  final double amount;

  const AddExpenseAmount(this.categoryID, this.index, this.amount);

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
