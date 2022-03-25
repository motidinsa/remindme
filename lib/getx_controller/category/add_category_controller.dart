import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:remindme/models/add_sub_subcategory_model.dart';
import 'package:remindme/models/add_subcategory_model.dart';

import '../../helper/icons_helper.dart';
import '../../models/add_category_model.dart';
import '../../pages/add_transaction/icon_select.dart';

class AddCategoryController extends GetxController {
  int currentCategoryId = 1;
  int currentSubcategoryId = 1;
  int currentSubSubcategoryId = 1;

  // bool manyCategories = false;
  // bool categoryHasSubcategory = false;

  List<IconSelect> iconList;
  List<AddCategoryModel> addCategoryModels = [];

  // String iconType = 'category';
  int iconCategoryId;
  int iconSubcategoryId;

  @override
  void onInit() {
    super.onInit();
    addCategoryModels.add(AddCategoryModel(
        id: currentCategoryId++, subcategoryModels: [], requestFocus: true));

    iconList = IconsHelper.iconsMap.entries
        .map((e) => IconSelect(
            icon: Icon(e.value), name: e.key, type: 'category', id: -1))
        .toList();
  }

  void addCategory() {
    for (var element in addCategoryModels) {
      element.requestFocus = false;
    }
    addCategoryModels.add(AddCategoryModel(
        id: currentCategoryId++, subcategoryModels: [], requestFocus: true));

    update();
  }

  void deleteCategory({int categoryId}) {
    addCategoryModels.removeWhere((element) => element.id == categoryId);
    update();
  }

  void deleteSubcategory({int categoryId, int subcategoryId}) {
    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .subcategoryModels
        .removeWhere((element) => element.id == subcategoryId);

    update();
  }

  void deleteSubSubcategory(
      {int categoryId, int subcategoryId, int subSubcategoryId}) {
    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .subcategoryModels
        .firstWhere((element) => element.id == subcategoryId)
        .subSubcategoryModels
        .removeWhere((element) => element.id == subSubcategoryId);

    update();
  }

  void changeCategoryName({int categoryId, String categoryName}) {
    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .categoryName = categoryName;
    for (var element in addCategoryModels) {
      element.requestFocus = false;
    }
    update();
  }

  void changeSubcategoryName(
      {int categoryId, int subcategoryId, String subcategoryName}) {
    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .subcategoryModels
        .firstWhere((element) => element.id == subcategoryId)
        .subcategoryName = subcategoryName;

    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .subcategoryModels
        .forEach((element) {
      element.requestFocus = false;
    });

    update();
  }

  void changeSubSubcategoryName(
      {int categoryId, int subcategoryId, int id, String subSubcategoryName}) {
    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .subcategoryModels
        .firstWhere((element) => element.id == subcategoryId)
        .subSubcategoryModels
        .firstWhere((element) => element.id == id)
        .subSubcategoryName = subSubcategoryName;

    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .subcategoryModels
        .firstWhere((element) => element.id == subcategoryId)
        .subSubcategoryModels
        .forEach((element) {
      element.requestFocus = false;
    });

    update();
  }

  void addSubcategory({int categoryId}) {
    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .subcategoryModels
        .forEach((element) {
      element.requestFocus = false;
    });

    AddCategoryModel currentAddCategoryModel =
        addCategoryModels.firstWhere((element) => element.id == categoryId);
    currentAddCategoryModel.subcategoryModels.add(
      AddSubcategoryModel(
          categoryId: categoryId,
          id: currentSubcategoryId++,
          subSubcategoryModels: [],
          requestFocus: true,
          icon: currentAddCategoryModel.icon,
          iconName: currentAddCategoryModel.iconName),
    );
    update();
  }

  void addSubSubcategory({int categoryId, int subcategoryId}) {
    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .subcategoryModels
        .firstWhere((element) => element.id == subcategoryId)
        .subSubcategoryModels
        .forEach((element) {
      element.requestFocus = false;
    });

    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .subcategoryModels
        .firstWhere((element) => element.id == subcategoryId)
        .subSubcategoryModels
        .add(
          AddSubSubcategoryModel(
              id: currentSubSubcategoryId++,
              categoryId: categoryId,
              subcategoryId: subcategoryId,
              requestFocus: true),
        );
    update();
  }

  void addIcon(
      {int categoryId, int subcategoryId, String iconName, Icon icon}) {
    if (categoryId != null && subcategoryId == null) {
      addCategoryModels.firstWhere((element) => element.id == categoryId)
        ..iconName = iconName
        ..icon = icon;
    } else if (categoryId != null && subcategoryId != null) {
      addCategoryModels
          .firstWhere((element) => element.id == categoryId)
          .subcategoryModels
          .firstWhere((element) => element.id == subcategoryId)
        ..iconName = iconName
        ..icon = icon;
    }

    update();
  }

  void setCategoryIconData({int categoryId}) {
    // iconType = 'category';
    iconCategoryId = categoryId;
    iconSubcategoryId = null;

    update();
  }

  void setSubcategoryIconData({int categoryId, int subcategoryId}) {
    iconCategoryId = categoryId;
    iconSubcategoryId = subcategoryId;

    update();
  }

  void setCategoryType({int categoryId, String categoryType}) {
    addCategoryModels
        .firstWhere((element) => element.id == categoryId)
        .categoryType = categoryType;

    update();
  }
}
