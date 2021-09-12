import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/bloc/expense/expense_state.dart';
import 'package:remindme/bloc/reason/reason_event.dart';
import 'package:remindme/bloc/reason/reason_state.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/expense_tobe_added.dart';
import 'package:remindme/models/setting_configuration.dart';
import 'package:remindme/repository/expense_repository.dart';
import 'package:meta/meta.dart';
import 'package:remindme/repository/task_repository.dart';

class ReasonBloc extends Bloc<ReasonEvent, ReasonState> {
  final ExpenseRepository expenseRepository;

  ReasonBloc({this.expenseRepository})
      :
        // : assert(expenseRepository != null),
        super(NoReasonAdded());

  @override
  Stream<ReasonState> mapEventToState(ReasonEvent event) async* {
    if (event is GetAllCategories) {
      try {
        final categories = await expenseRepository.getAllCategories();
        yield AllCategoriesFetched(categories);
      } catch (e) {
        yield CategoryFetchError();
      }
    }
    if (event is GetAllSubCategoriesWithCategoryID) {
      try {
        final subcategories = await expenseRepository
            .getAllSubCategoriesWithCategoryID(event.categoryID);
        yield AllSubCategoriesWithCategoryIDFetched(subcategories);
      } catch (e) {
        yield CategoryFetchError();
      }
    }
    if (event is GetAllSubSubCategoriesWithSubCategoryID) {
      try {
        final subsubcategories = await expenseRepository
            .getAllSubSubCategoriesWithSubCategoryID(event.subcategoryID);
        yield AllSubSubCategoriesWithSubCategoryIDFetched(subsubcategories);
      } catch (e) {
        yield CategoryFetchError();
      }
    }
    if (event is AddReasonCategoryName) {
      yield ReasonCategoryAdded(event.categoryID);
    }
    if (event is AddReasonSubCategoryName) {
      yield ReasonSubCategoryAdded(event.subcategoryID);
    }
    if (event is AddReasonSubSubCategoryName) {
      yield ReasonSubSubCategoryAdded(event.subsubcategoryID);
    }
    if (event is AddCategoryReason) {
      yield CategoryReasonAdded(
          categoryReason: event.categoryName,
          categoryID: event.categoryID,
          id: event.id);
    }
    if (event is AddSubCategoryReason) {
      yield SubCategoryReasonAdded(
          subcategoryReason: event.subcategoryName,
          categoryID: event.categoryID,
          id: event.id,
          subcategoryID: event.id);
    }
    if (event is AddSubSubCategoryReason) {
      yield SubSubCategoryReasonAdded(
          subcategoryReason: event.subcategoryName,
          categoryID: event.categoryID,
          id: event.id,
          subcategoryID: event.id,
          subsubcategoryID: event.subsubcategoryID);
    }
    if (event is AddCategoryAmount) {
      yield CategoryAmountAdded(
          categoryAmount: event.categoryAmount,
          categoryID: event.categoryID,
          id: event.id);
    }
    if (event is AddSubCategoryAmount) {
      yield SubCategoryAmountAdded(
          subcategoryAmount: event.subcategoryAmount,
          categoryID: event.categoryID,
          id: event.id,
          subcategoryID: event.subcategoryID);
    }
    if (event is AddSubSubCategoryAmount) {
      yield SubSubCategoryAmountAdded(
          subsubcategoryAmount: event.subsubcategoryAmount,
          categoryID: event.categoryID,
          id: event.id,
          subcategoryID: event.subcategoryID,
          subsubcategoryID: event.subsubcategoryID);
    }
    if (event is RemoveCategoryReason) {
      yield CategoryReasonRemoved(categoryID: event.categoryID, id: event.id);
    }
    if (event is InsertCategoryReason) {
      try {
        await expenseRepository.insertCategoryReason(event.categoryReason);
        yield CategoryReasonInserted(categoryReason: event.categoryReason);
      } catch (e) {
        yield CategoryFetchError();
      }
    }
    if (event is InsertSubCategoryReason) {
      try {
        await expenseRepository
            .insertSubCategoryReason(event.subcategoryReason);
        yield SubCategoryReasonInserted();
      } catch (e) {
        yield CategoryFetchError();
      }
    }
    if (event is InsertSubSubCategoryReason) {
      try {
        await expenseRepository
            .insertSubSubCategoryReason(event.subsubcategoryReason);
        yield SubSubCategoryReasonInserted();
      } catch (e) {
        yield CategoryFetchError();
      }
    }
    if (event is ClearReason) {
      yield Cleared();
    }
  }
}
