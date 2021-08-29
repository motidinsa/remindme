import 'package:equatable/equatable.dart';
import 'package:mytask/models/expense_and_income_category.dart';
import 'package:mytask/models/expense_and_income_subcategory.dart';
import 'package:mytask/models/expense_and_income_subsubcategory.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CheckInitialization extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class AddCategoryName extends CategoryEvent {
  final String categoryName;

  AddCategoryName(this.categoryName);

  @override
  List<Object> get props => [];
}

class AddCategoryIcon extends CategoryEvent {
  final String iconName;
  final String iconType;

  AddCategoryIcon({this.iconName, this.iconType});

  @override
  List<Object> get props => [];
}

class Clear extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class AddCategoryType extends CategoryEvent {
  final String categoryType;

  AddCategoryType({this.categoryType});

  @override
  List<Object> get props => [];
}

class AddSubcategoryName extends CategoryEvent {
  final String subcategoryName;
  final int tempID;

  AddSubcategoryName({this.subcategoryName, this.tempID});

  @override
  List<Object> get props => [];
}

class AddSubcategoryIcon extends CategoryEvent {
  final String subcategoryIcon;
  final int tempID;

  AddSubcategoryIcon({this.subcategoryIcon, this.tempID});

  @override
  List<Object> get props => [tempID];
}

class AddSubSubcategoryName extends CategoryEvent {
  final String subSubcategoryName;
  final int tempID;
  final int tempSubCategoryID;

  AddSubSubcategoryName(
      {this.subSubcategoryName, this.tempID, this.tempSubCategoryID});

  @override
  List<Object> get props => [];
}

class AddSubSubcategoryIcon extends CategoryEvent {
  final String subSubcategoryIcon;
  final int tempID;
  final int categoryID;

  AddSubSubcategoryIcon(
      {this.subSubcategoryIcon, this.tempID, this.categoryID});

  @override
  List<Object> get props => [];
}

class RemoveSubcategory extends CategoryEvent {
  final int id;

  RemoveSubcategory(this.id);

  @override
  List<Object> get props => [];
}

class RemoveSubSubcategory extends CategoryEvent {
  final int id;
  final int categoryID;

  RemoveSubSubcategory({this.id, this.categoryID});

  @override
  List<Object> get props => [];
}

class AddSubSubCategory extends CategoryEvent {
  // final int subcategoryID;
  // final int id;
  final List<ExpenseAndIncomeSubSubCategoryModel> subcategories;

  AddSubSubCategory({this.subcategories});

  @override
  List<Object> get props => [];
}

class InsertCategory extends CategoryEvent {
  final ExpenseAndIncomeCategoryModel category;
  final List<ExpenseAndIncomeSubCategoryModel> subcategories;
  final List<List<ExpenseAndIncomeSubSubCategoryModel>> subSubcategories;

  const InsertCategory(
      {this.category, this.subcategories, this.subSubcategories});

  @override
  List<Object> get props => [];
}
