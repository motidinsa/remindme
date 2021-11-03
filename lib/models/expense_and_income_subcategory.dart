import 'package:remindme/models/expense_and_income_subsubcategory.dart';

class IncomeAndExpenseSubCategoryModel {
  String subcategoryName;
  String iconName;
  String iconType;
  String dateAdded;
  String timeAdded;
  String changedDate;
  String changedTime;
  String dateType;
  final int id;
  final int userID;
  int categoryID;
  String subcategoryType;
  int subSubcategoryCount;

  // List<ExpenseAndIncomeSubSubCategoryModel> subcategories =[];

  IncomeAndExpenseSubCategoryModel({
    this.subcategoryName,
    this.dateAdded,
    this.subcategoryType,
    this.changedDate,
    this.dateType,
    this.id,
    this.changedTime,
    this.iconName,
    this.iconType,
    this.timeAdded,
    this.categoryID,
    this.userID,
    this.subSubcategoryCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userID,
      'name': subcategoryName,
      'icon_name': iconName,
      'icon_type': iconType,
      'date': dateAdded,
      'time': timeAdded,
      'category_id': categoryID,
      'changed_date': changedDate,
      'changed_time': changedTime,
      'date_type': dateType,
      'subcategory_type': subcategoryType,
    };
  }
}
