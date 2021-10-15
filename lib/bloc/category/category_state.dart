import 'package:equatable/equatable.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';

class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class NoCategoryAdded extends CategoryState {}

class CategoryInitialized extends CategoryState {
  final List<IncomeAndExpenseCategoryModel> categories;
  final List<IncomeAndExpenseSubCategoryModel> subcategories;
  final List<IncomeAndExpenseSubSubCategoryModel> subSubcategories;

  CategoryInitialized(
      {this.categories, this.subcategories, this.subSubcategories});
}

class CategoryInsertErrorOccurred extends CategoryState {}

class CategoryNameAdded extends CategoryState {
  final String categoryName;

  CategoryNameAdded(this.categoryName);

  @override
  List<Object> get props => [];
}

class CategoryIconAdded extends CategoryState {
  final String iconName;
  final String iconType;

  CategoryIconAdded({this.iconName, this.iconType});

  @override
  List<Object> get props => [];
}

class Cleared extends CategoryState {}

class CategoryTypeAdded extends CategoryState {
  final String categoryType;

  CategoryTypeAdded({this.categoryType});

  @override
  List<Object> get props => [];
}

class SubcategoryNameAdded extends CategoryState {
  final String subcategoryName;
  final int tempID;
  final int subcategoryID;

  SubcategoryNameAdded({this.subcategoryName, this.tempID, this.subcategoryID});

  @override
  List<Object> get props => [tempID, subcategoryName];
}

class SubcategoryNameAddedForSubSubcategory extends CategoryState {
  final String subcategoryName;
  final int tempID;
  final int subcategoryID;

  SubcategoryNameAddedForSubSubcategory(
      {this.subcategoryName, this.tempID, this.subcategoryID});

  @override
  List<Object> get props => [tempID, subcategoryName];
}

class SubcategoryIconAdded extends CategoryState {
  final String subcategoryIcon;
  final String subcategoryName;
  final int subcategoryID;
  final int tempID;

  SubcategoryIconAdded(
      {this.subcategoryIcon,
      this.tempID,
      this.subcategoryName,
      this.subcategoryID});

  @override
  List<Object> get props => [tempID, subcategoryIcon];
}

class SubSubcategoryNameAdded extends CategoryState {
  final String subSubcategoryName;
  final int tempID;
  final int tempCategoryID;
  final int subCategoryID;

  SubSubcategoryNameAdded(
      {this.subSubcategoryName,
      this.tempID,
      this.tempCategoryID,
      this.subCategoryID});

  @override
  List<Object> get props => [subCategoryID, subSubcategoryName];
}

class SubSubcategoryIconAdded extends CategoryState {
  final String subSubcategoryIcon;
  final int tempID;
  final int categoryID;

  SubSubcategoryIconAdded(
      {this.subSubcategoryIcon, this.tempID, this.categoryID});

  @override
  List<Object> get props => [];
}

class SubcategoryRemoved extends CategoryState {
  final int id;

  SubcategoryRemoved(this.id);

  @override
  List<Object> get props => [];
}

class SubSubcategoryRemoved extends CategoryState {
  final int id;
  final int categoryID;

  SubSubcategoryRemoved({this.id, this.categoryID});

  @override
  List<Object> get props => [];
}

class SubSubcategoryAdded extends CategoryState {
  final List<IncomeAndExpenseSubSubCategoryModel> subcategories;
  final int categoryID;
  final bool isUpdate;

  SubSubcategoryAdded({this.subcategories, this.categoryID, this.isUpdate});

  @override
  List<Object> get props => [];
}

class CategoryInserted extends CategoryState {
  const CategoryInserted();

  @override
  List<Object> get props => [];
}
