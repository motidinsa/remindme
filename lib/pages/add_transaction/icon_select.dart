import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/category/add_category_controller.dart';

class IconSelect extends StatelessWidget {
  final Icon icon;
  final String name;
  final String subcategoryName;
  final int subcategoryID;
  final String type;
  final int id;

  const IconSelect(
      {Key key,
      this.icon,
      this.name,
      this.type,
      this.id,
      this.subcategoryName,
      this.subcategoryID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashRadius: 20,
      onPressed: () {
        final AddCategoryController addCategoryController = Get.find();
        if (addCategoryController.iconCategoryId != null &&
            addCategoryController.iconSubcategoryId == null) {
          addCategoryController.addIcon(
              categoryId: addCategoryController.iconCategoryId,
              iconName: name,
              icon: icon);
        } else if ((addCategoryController.iconCategoryId != null &&
            addCategoryController.iconSubcategoryId != null)) {
          addCategoryController.addIcon(
              categoryId: addCategoryController.iconCategoryId,
              subcategoryId: addCategoryController.iconSubcategoryId,
              iconName: name,
              icon: icon);
        }
        Get.back();
      },
    );
  }
}
