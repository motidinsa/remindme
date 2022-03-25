import 'package:flutter/material.dart';

import 'add_sub_subcategory_model.dart';

class AddSubcategoryModel {
  final int id;
  final int categoryId;
  String subcategoryName;
  String iconName;
  Icon icon;
  List<AddSubSubcategoryModel> subSubcategoryModels;
  bool requestFocus;

  AddSubcategoryModel(
      {this.subcategoryName,
      this.id,
      this.icon,
      this.subSubcategoryModels,
      this.categoryId,
      this.requestFocus,
      this.iconName});
}
