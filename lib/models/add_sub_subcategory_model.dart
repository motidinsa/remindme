import 'package:flutter/material.dart';

class AddSubSubcategoryModel {
  final int id;
  final int categoryId;
  final int subcategoryId;
  String subSubcategoryName;
  Icon icon;
  bool requestFocus;

  AddSubSubcategoryModel(
      {this.subSubcategoryName,
      this.id,
      this.icon,
      this.subcategoryId,
      this.categoryId,
      this.requestFocus});
}
