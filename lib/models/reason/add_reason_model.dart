class AddReasonModel {
  final int id;
  final int userId;
  int categoryId;
  int subcategoryId;
  int subSubcategoryId;
  String name;
  String dateAndTimeAdded;
  String lastModifiedDateAndTime;
  String location;
  double amount;
  String dateType;
  bool requestFocus = false;

  AddReasonModel({
    this.lastModifiedDateAndTime,
    this.name,
    this.dateAndTimeAdded,
    this.id,
    this.categoryId,
    this.subcategoryId,
    this.subSubcategoryId,
    this.location,
    this.userId,
    this.dateType,
    this.requestFocus,
    this.amount,
  });
}
