import 'package:equatable/equatable.dart';
import 'package:mytask/pages/add_transaction/expense/expense_category.dart';

class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class AddExpenseCategorySuccess extends ExpenseState {
  final ExpenseCategoryy selectedCategory;

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

class NoCategoryAdded extends ExpenseState {}

class CategoryCleared extends ExpenseState {}

class AnotherItemAdded extends ExpenseState {
  final int categoryID;

  AnotherItemAdded(this.categoryID);

  @override
  List<Object> get props => [categoryID];
}
