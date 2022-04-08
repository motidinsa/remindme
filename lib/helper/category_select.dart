import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx_controller/category/add_category_controller.dart';

class CategorySelect extends StatelessWidget {
  final String categoryName;
  final Icon icon;
  final int categoryId;

  const CategorySelect({Key key, this.categoryName, this.icon, this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddCategoryController addCategoryController = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: Container(
            child: icon,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey),
            ),
          ),
          borderRadius: BorderRadius.circular(60),
          onTap: () {
            addCategoryController.addEditCategoryModel(categoryId);
            Get.back();
          },
        ),
        Text(
          categoryName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
