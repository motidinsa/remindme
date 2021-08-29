class ExpenseAndIncomeSubSubCategoryModel {
  String subSubcategoryName;
  final String iconName;
  final String iconType;
  final String dateAdded;
  final String timeAdded;
  final String changedDate;
  final String changedTime;
  final String dateType;
  final int id;
  final int userID;
  int subcategoryID;
  int categoryID;
  final String subSubcategoryType;

  ExpenseAndIncomeSubSubCategoryModel(
      {this.subSubcategoryName,
      this.dateAdded,
      this.subSubcategoryType,
      this.changedDate,
      this.dateType,
      this.id,
      this.changedTime,
      this.iconName,
      this.iconType,
      this.timeAdded,
      this.categoryID,
      this.subcategoryID,
      this.userID});

  Map<String, dynamic> toMap() {
    return {
      // 'user_id':userID,
      'name': subSubcategoryName,
      'icon_name': iconName,
      'icon_type': iconType,
      'date': dateAdded,
      'time': timeAdded,
      'category_id': categoryID,
      'sub_category_id': subcategoryID,
      'changed_date': changedDate,
      'changed_time': changedTime,
      'date_type': dateType,
      'sub_subcategory_type': subSubcategoryType,
    };
  }
}
