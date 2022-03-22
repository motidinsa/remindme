class Reason {
  final int id;
  final int categoryId;
  final int subcategoryId;
  final int subSubcategoryId;
  final String name;
  final double amount;
  final String location;
  final String timeAdded;
  final String dateAdded;
  final String changedDate;
  final String changedTime;
  bool isSubcategorySelected = false;
  bool isSubSubcategorySelected = false;

  Reason({
    this.amount,
    this.name,
    this.timeAdded,
    this.dateAdded,
    this.id,
    this.categoryId,
    this.changedDate,
    this.changedTime,
    this.subcategoryId,
    this.subSubcategoryId,
    this.location,
    // this.isSelected,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': 001,
      'name': name,
      'category_id': categoryId,
      'subcategory_id': subcategoryId,
      'sub_subcategory_id': subSubcategoryId,
      'date': dateAdded,
      'time': timeAdded,
      'current_amount': amount,
      'date_type': 'gr',
      // 'previous_reason_id': previousReasonID,
    };
  }
}
