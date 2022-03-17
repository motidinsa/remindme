class IncomeAndExpenseCategoryModel {
  final String categoryName;
  final String iconName;
  final String iconType;
  final String dateAdded;
  final String timeAdded;
  final String changedDate;
  final String changedTime;
  final String dateType;
  final int id;
  final int userID;
  final String categoryType;
  final int subcategoryCount;
  final int accountId;
  final int subAccountId;

  IncomeAndExpenseCategoryModel({
    this.categoryType,
    this.dateAdded,
    this.categoryName,
    this.changedDate,
    this.dateType,
    this.id,
    this.changedTime,
    this.iconName,
    this.iconType,
    this.timeAdded,
    this.subcategoryCount,
    this.userID,
    this.accountId,
    this.subAccountId,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userID,
      'name': categoryName,
      'icon_name': iconName,
      'icon_type': iconType,
      'date': dateAdded,
      'time': timeAdded,
      'changed_date': changedDate,
      'changed_time': changedTime,
      'date_type': dateType,
      'category_type': categoryType,
    };
  }
}
