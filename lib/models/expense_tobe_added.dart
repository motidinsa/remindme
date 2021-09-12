class ExpenseTobeAdded {
  int categoryID;
  int subcategoryID;
  int subsubcategoryID;
  String reason;
  String categoryName;
  String subcategoryName;
  String date;
  String addedDate;
  String dateType;
  String addedTime;
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
      this.addedDate,
      this.subcategoryID,
      this.dateType,
      this.numberOfTimes,
      this.reasonID,
      this.changedTime,
      this.categoryType,
      this.userID,
      this.subsubcategoryID,
      this.addedTime});

  Map<String, dynamic> toMap() {
    return {
      'user_id': userID,
      'category_id': categoryID,
      'subcategory_id': subcategoryID,
      'sub_subcategory_id': subsubcategoryID,
      'category_name': categoryName,
      'reason': reason,
      'date': date,
      'added_time': addedTime,
      'added_date': addedDate,
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
