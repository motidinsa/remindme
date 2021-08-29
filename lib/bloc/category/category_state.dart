import 'package:equatable/equatable.dart';
import 'package:mytask/models/expense_and_income_category.dart';
import 'package:mytask/models/expense_and_income_subcategory.dart';
import 'package:mytask/models/expense_and_income_subsubcategory.dart';

class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class NoCategoryAdded extends CategoryState {}

class CategoryInitialized extends CategoryState {
  final List<ExpenseAndIncomeCategoryModel> categories;
  final List<ExpenseAndIncomeSubCategoryModel> subcategories;
  final List<ExpenseAndIncomeSubSubCategoryModel> subSubcategories;

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

  SubcategoryNameAdded({this.subcategoryName, this.tempID});

  @override
  List<Object> get props => [];
}

class SubcategoryIconAdded extends CategoryState {
  final String subcategoryIcon;
  final int tempID;

  SubcategoryIconAdded({this.subcategoryIcon, this.tempID});

  @override
  List<Object> get props => [tempID];
}

class SubSubcategoryNameAdded extends CategoryState {
  final String subSubcategoryName;
  final int tempID;
  final int tempCategoryID;

  SubSubcategoryNameAdded(
      {this.subSubcategoryName, this.tempID, this.tempCategoryID});

  @override
  List<Object> get props => [];
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
  final List<ExpenseAndIncomeSubSubCategoryModel> subcategories;

  SubSubcategoryAdded({this.subcategories});

  @override
  List<Object> get props => [];
}

class CategoryInserted extends CategoryState {
  const CategoryInserted();

  @override
  List<Object> get props => [];
}
