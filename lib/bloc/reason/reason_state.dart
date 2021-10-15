import 'package:equatable/equatable.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/expense_tobe_added.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';

class ReasonState extends Equatable {
  const ReasonState();

  @override
  List<Object> get props => [];
}

class ReasonCategoryAdded extends ReasonState {
  final int categoryID;

  const ReasonCategoryAdded(this.categoryID);

  @override
  List<Object> get props => [categoryID];
}

class ReasonSubCategoryAdded extends ReasonState {
  final int subcategoryID;

  const ReasonSubCategoryAdded(this.subcategoryID);

  @override
  List<Object> get props => [subcategoryID];
}

class ReasonSubSubCategoryAdded extends ReasonState {
  final int subsubcategoryID;

  const ReasonSubSubCategoryAdded(this.subsubcategoryID);

  @override
  List<Object> get props => [subsubcategoryID];
}

class CategoryReasonAdded extends ReasonState {
  final String categoryReason;
  final int categoryID;
  final int id;

  const CategoryReasonAdded({this.categoryReason, this.categoryID, this.id});

  @override
  List<Object> get props => [categoryReason];
}

class SubCategoryReasonAdded extends ReasonState {
  final String subcategoryReason;
  final int categoryID;
  final int subcategoryID;
  final int id;

  const SubCategoryReasonAdded(
      {this.subcategoryReason, this.categoryID, this.id, this.subcategoryID});

  @override
  List<Object> get props => [subcategoryReason];
}

class SubSubCategoryReasonAdded extends ReasonState {
  final String subcategoryReason;
  final int categoryID;
  final int subcategoryID;
  final int subsubcategoryID;
  final int id;

  const SubSubCategoryReasonAdded(
      {this.subcategoryReason,
      this.categoryID,
      this.id,
      this.subcategoryID,
      this.subsubcategoryID});

  @override
  List<Object> get props => [subcategoryReason];
}

class CategoryAmountAdded extends ReasonState {
  final String categoryAmount;
  final int categoryID;
  final int id;

  const CategoryAmountAdded({this.categoryAmount, this.categoryID, this.id});

  @override
  List<Object> get props => [categoryAmount, categoryID, id];
}

class SubCategoryAmountAdded extends ReasonState {
  final String subcategoryAmount;
  final int categoryID;
  final int subcategoryID;
  final int id;

  const SubCategoryAmountAdded(
      {this.subcategoryAmount, this.categoryID, this.id, this.subcategoryID});

  @override
  List<Object> get props => [subcategoryAmount, categoryID, id];
}

class SubSubCategoryAmountAdded extends ReasonState {
  final String subsubcategoryAmount;
  final int categoryID;
  final int subcategoryID;
  final int subsubcategoryID;
  final int id;

  const SubSubCategoryAmountAdded(
      {this.subsubcategoryAmount,
      this.categoryID,
      this.id,
      this.subcategoryID,
      this.subsubcategoryID});

  @override
  List<Object> get props => [subsubcategoryAmount, categoryID, id];
}

class NoReasonAdded extends ReasonState {}

class CategoryFetchError extends ReasonState {}

class AllCategoriesFetched extends ReasonState {
  final List<IncomeAndExpenseCategoryModel> categories;

  const AllCategoriesFetched(this.categories);

  @override
  List<Object> get props => [categories];
}

class AllSubCategoriesWithCategoryIDFetched extends ReasonState {
  final List<IncomeAndExpenseSubCategoryModel> subcategories;

  const AllSubCategoriesWithCategoryIDFetched(this.subcategories);

  @override
  List<Object> get props => [subcategories.length, subcategories];
}

class AllSubSubCategoriesWithSubCategoryIDFetched extends ReasonState {
  final List<IncomeAndExpenseSubSubCategoryModel> subsubcategories;

  const AllSubSubCategoriesWithSubCategoryIDFetched(this.subsubcategories);

  @override
  List<Object> get props => [subsubcategories];
}

class CategoryReasonRemoved extends ReasonState {
  // final String categoryAmount;
  final int categoryID;
  final int id;

  const CategoryReasonRemoved({this.categoryID, this.id});

  @override
  List<Object> get props => [categoryID, id];
}

class SubCategoryReasonRemoved extends ReasonState {
  // final String categoryAmount;
  final int subcategoryID;
  final int id;

  const SubCategoryReasonRemoved({this.subcategoryID, this.id});

  @override
  List<Object> get props => [subcategoryID, id];
}

class CategoryReasonInserted extends ReasonState {
  // final String categoryAmount;
  final List<Reason> categoryReason;

  const CategoryReasonInserted({this.categoryReason});

  @override
  List<Object> get props => [categoryReason];
}

class SubCategoryReasonInserted extends ReasonState {
  // final String categoryAmount;
  // final List<Reason> categoryReason;

  const SubCategoryReasonInserted();

  @override
  List<Object> get props => [];
}

class SubSubCategoryReasonInserted extends ReasonState {
  // final String categoryAmount;
  // final List<Reason> categoryReason;

  const SubSubCategoryReasonInserted();

  @override
  List<Object> get props => [];
}

class Cleared extends ReasonState {}
