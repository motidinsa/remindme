class ExpenseTobeAdded {
  int categoryID;
  int subcategoryID;
  String reason;
  String categoryName;
  String subcategoryName;
  String date;
  String dateType;
  String time;
  String changedDate;
  String changedTime;
  String netAmount;
  String totalAmount;
  int id;
  int userID;
  int numberOfTimes;
  int reasonID;
  String categoryType;

  ExpenseTobeAdded(
      {this.categoryID,
      this.categoryName,
      this.subcategoryName,
      this.date,
      this.netAmount,
      this.totalAmount,
      this.changedDate,
      this.reason,
      this.id,
      this.time,
      this.subcategoryID,
      this.dateType,
      this.numberOfTimes,
      this.reasonID,
      this.changedTime,
      this.categoryType,
      this.userID});

  Map<String, dynamic> toMap() {
    return {
      'user_id': userID,
      'category_id': categoryID,
      'subcategory_id': subcategoryID,
      'category_name': categoryName,
      'subcategory_name': subcategoryName,
      'reason': reason,
      'date': date,
      'time': time,
      'changed_date': changedDate,
      'changed_time': changedTime,
      'net_amount': netAmount,
      'total_amount': totalAmount,
      'date_type': dateType,
      'number_of_times': numberOfTimes,
      'reason_id': reasonID,
      'category_type': categoryType,
    };
  }
}
