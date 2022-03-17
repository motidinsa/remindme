class CategoryCardModel {
  final String categoryName;
  final int id;
  String subcategoryName;
  String subSubcategoryName;
  final int categoryId;
  int subcategoryId;
  int subSubCategoryId;
  DateTime date;
  String netAmount;
  int frequency;
  String reason;
  String location;
  bool isLastItem;
  bool requestFocusOnAmount;
  final String categoryType;
  int accountId;
  int subAccountId;

  CategoryCardModel(
      {this.categoryName,
      this.categoryId,
      this.isLastItem,
      this.date,
      this.subcategoryName,
      this.subSubcategoryName,
      this.reason,
      this.netAmount,
      this.frequency,
      this.location,
      this.subcategoryId,
      this.subSubCategoryId,
      this.id,
      this.requestFocusOnAmount,
      this.categoryType,
      this.subAccountId,
      this.accountId});
}
