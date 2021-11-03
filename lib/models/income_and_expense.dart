class IncomeAndExpenseModel {
  String categoryName;
  String subcategoryName;
  String date;
  String addedDate;
  String dateType;
  String changedDate;
  String changedTime;
  String addedTime;
  String reason;
  String categoryType;
  String netAmount;
  String totalAmount;
  int id;
  int userID;
  int categoryID;
  int subcategoryID;
  int subSubCategoryId;
  int numberOfTimes;
  int reasonID;

  IncomeAndExpenseModel(
      {this.categoryName,
      this.subcategoryName,
      this.date,
      this.netAmount,
      this.totalAmount,
      this.reason,
      this.id,
      this.categoryID,
      this.subcategoryID,
      this.addedDate,
      this.changedDate,
      this.changedTime,
      this.dateType,
      this.categoryType,
      this.numberOfTimes,
      this.reasonID,
      this.userID,
      this.subSubCategoryId,
      this.addedTime});
}
