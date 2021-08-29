class ExpenseAndIncome {
  String categoryName;
  String subcategoryName;
  String date;
  String dateType;
  String changedDate;
  String changedTime;
  String time;
  String reason;
  String categoryType;
  double netAmount;
  double totalAmount;
  int id;
  int userID;
  int categoryID;
  int subcategoryID;
  int numberOfTimes;
  int reasonID;

  ExpenseAndIncome(
      {this.categoryName,
      this.subcategoryName,
      this.date,
      this.netAmount,
      this.totalAmount,
      this.reason,
      this.id,
      this.categoryID,
      this.subcategoryID,
      this.time,
      this.changedDate,
      this.changedTime,
      this.dateType,
      this.categoryType,
      this.numberOfTimes,
      this.reasonID,
      this.userID});
}
