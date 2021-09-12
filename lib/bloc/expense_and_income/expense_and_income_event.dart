import 'package:equatable/equatable.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/pages/add_transaction/expense/expense_detail.dart';

abstract class ExpenseAndIncomeEvent extends Equatable {
  const ExpenseAndIncomeEvent();
}

class AddExpense extends ExpenseAndIncomeEvent {
  final List<FinishedCategory> finishedCategories;
  final List<List<ExpenseDetail>> expenseDetails;
  final String type;

  const AddExpense({this.finishedCategories, this.expenseDetails, this.type});

  @override
  List<Object> get props => [finishedCategories, expenseDetails];
}

class NoIncomeAndExpense extends ExpenseAndIncomeEvent {
  const NoIncomeAndExpense();

  @override
  List<Object> get props => [];
}

class GetAllIncomeAndExpense extends ExpenseAndIncomeEvent {
  const GetAllIncomeAndExpense();

  @override
  List<Object> get props => [];
}
