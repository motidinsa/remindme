import 'package:equatable/equatable.dart';
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
