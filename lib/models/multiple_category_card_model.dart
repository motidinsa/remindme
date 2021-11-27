import 'package:remindme/models/category_card_model.dart';

class MultipleCategoryCardModel {
  List<CategoryCardModel> categoryCardModels;
  final int categoryId;
  int id;

  MultipleCategoryCardModel(
      {this.categoryCardModels, this.categoryId, this.id});
}
