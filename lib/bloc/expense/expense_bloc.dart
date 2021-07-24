import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/expense/expense_event.dart';
import 'package:mytask/bloc/expense/expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(NoCategoryAdded());

  @override
  Stream<ExpenseState> mapEventToState(ExpenseEvent event) async* {
    if (event is AddExpenseCategory) {
      yield AddExpenseCategorySuccess(event.selectedCategory);
    }
    if (event is RemoveExpenseCategory) {
      yield RemoveExpenseCategorySuccess(event.categoryID);
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
    if (event is AddExpenseReason) {
      yield ReasonAdded(event.categoryID, event.index, event.reason);
    }
    if (event is FinishCategory) {
      yield CategoryFinished(event.id);
      // yield RemoveExpenseCategorySuccess(event.id);
    }
  }
}
