import 'package:remindme/pages/add_transaction/income_and_expense/category_card/category_card_user_input.dart';

class CategoryCardModel {
  final String categoryName;
  final int id;
  String subcategoryName;
  String subSubcategoryName;
  final int categoryId;
  int subcategoryId;
  int subSubCategoryId;
  String date;
  String netAmount;
  int frequency;
  String reason;
  String location;
  bool isLastItem;
  bool requestFocusOnAmount;
  CategoryUserInput userInput;

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
      this.userInput});
}
