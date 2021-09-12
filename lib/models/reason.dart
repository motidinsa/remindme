class Reason {
  String name;
  String amount;
  final int record;
  final int id;

  // final int previousReasonID;
  int categoryID;
  int subcategoryID;
  int subSubcategoryID;
  String time;
  String date;
  final String changedDate;
  final String changedTime;

  Reason(
      {this.amount,
      this.name,
      this.record,
      this.time,
      this.date,
      this.id,
      this.categoryID,
      this.changedDate,
      this.changedTime,
      this.subcategoryID,
      this.subSubcategoryID});

  Map<String, dynamic> toMap() {
    return {
      'user_id': 001,
      'name': name,
      'category_id': categoryID,
      'subcategory_id': subcategoryID,
      'sub_subcategory_id': subSubcategoryID,
      'date': date,
      'time': time,
      'current_amount': amount,
      'date_type': 'gr',
      // 'previous_reason_id': previousReasonID,
    };
  }
}
