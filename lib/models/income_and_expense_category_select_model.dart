import 'package:flutter/material.dart';

class IncomeAndExpenseCategorySelectModel {
  final String categoryName;
  final Icon icon;
  bool isSelected;
  bool finishedCategory;
  final int categoryID;

  IncomeAndExpenseCategorySelectModel({
    this.categoryName,
    this.icon,
    this.isSelected,
    this.categoryID,
    this.finishedCategory,
  });
}
