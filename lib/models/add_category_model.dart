import 'package:flutter/material.dart';

import 'add_subcategory_model.dart';

class AddCategoryModel {
  final int id;
  String categoryName;
  String categoryType;
  String type;
  String iconName;
  Icon icon;
  List<AddSubcategoryModel> subcategoryModels = [];
  bool requestFocus;

  AddCategoryModel(
      {this.categoryName,
      this.id,
      this.iconName,
      this.subcategoryModels,
      this.type,
      this.requestFocus,
      this.icon,
      this.categoryType});
}
