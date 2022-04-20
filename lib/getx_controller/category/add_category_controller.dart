import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:remindme/models/add_sub_subcategory_model.dart';
import 'package:remindme/models/add_subcategory_model.dart';

import '../../helper/category_select.dart';
import '../../helper/icons_helper.dart';
import '../../models/add_category_model.dart';
import '../../pages/add_transaction/icon_select.dart';

class AddCategoryController extends GetxController {
  final bool isEditCategory;

  int currentCategoryId = 4;
  int currentSubcategoryId = 4;
  int currentSubSubcategoryId = 4;

  final List<String> categoryTypes = [
    'Income',
    'Expense',
    'Both',
  ];

  List<IconSelect> iconList;
  List<AddCategoryModel> addCategoryModels = [];
  List<AddCategoryModel> tempAddCategoryModels = [
    AddCategoryModel(
      id: 1,
      categoryName: 'Cat 1',
      categoryType: 'Income',
      iconName: 'backup',
      subcategoryModels: [
        AddSubcategoryModel(
          id: 1,
          categoryId: 1,
          subcategoryName: 'Sub 1',
          subSubcategoryModels: [
            AddSubSubcategoryModel(
                categoryId: 1,
                subcategoryId: 1,
                id: 1,
                subSubcategoryName: 'Sub Sub 1'),
          ],
        )
      ],
    ),
    AddCategoryModel(
      id: 2,
      categoryName: 'Cat 2',
      categoryType: 'Income',
      iconName: 'share',
      subcategoryModels: [
        AddSubcategoryModel(
          id: 2,
          categoryId: 2,
          subcategoryName: 'Sub 2',
          subSubcategoryModels: [
            AddSubSubcategoryModel(
                categoryId: 2,
                subcategoryId: 2,
                id: 2,
                subSubcategoryName: 'Sub Sub 2'),
          ],
        )
      ],
    ),
    AddCategoryModel(
      id: 3,
      categoryName: 'Cat 3',
      categoryType: 'Income',
      iconName: 'update',
      subcategoryModels: [
        AddSubcategoryModel(
          id: 3,
          categoryId: 3,
          subcategoryName: 'Sub 3',
          subSubcategoryModels: [
            AddSubSubcategoryModel(
                categoryId: 3,
                subcategoryId: 3,
                id: 3,
                subSubcategoryName: 'Sub Sub 3'),
          ],
        )
      ],
    )
  ];
  List<CategorySelect> categoryList = [];

  int iconCategoryId;
  int iconSubcategoryId;
  int editedCategoryCount = 0;

  AddCategoryController({this.isEditCategory});

  @override
  void onInit() {
    super.onInit();
    if (isEditCategory) {
      for (int i = 0; i < tempAddCategoryModels.length; i++) {
        categoryList.add(
          CategorySelect(
            categoryId: tempAddCategoryModels[i].id,
            categoryName: 'cat ${tempAddCategoryModels[i].id}',
            // icon: Icon(
            //   IconsHelper.getIconGuessFavorFA(name: tempAddCategoryModels[i].iconName),
            //   color: Colors.black54,
            //   size: 20,
            // ),
            icon: Icon(
              IconsHelper.iconsMap[tempAddCategoryModels[i].iconName],
              // color: Colors.black54,
              size: 20,
            ),
          ),
        );
      }
    } else {
      addCategoryModels.add(
        AddCategoryModel(
            id: currentCategoryId++, subcategoryModels: [], requestFocus: true),
      );
    }

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
        id: ++currentCategoryId, subcategoryModels: [], requestFocus: true));

    update();
  }

  void deleteCategory({int categoryId, bool isCancelButton}) {
    addCategoryModels.removeWhere((element) => element.id == categoryId);
    if (isEditCategory) {
      AddCategoryModel deletedCategoryModel = tempAddCategoryModels
          .firstWhere((element) => element.id == categoryId);

      if (isCancelButton) {
        editedCategoryCount--;
        categoryList.insert(
          0,
          CategorySelect(
            categoryId: categoryId,
            categoryName: deletedCategoryModel.categoryName,
            icon: Icon(
              IconsHelper.iconsMap[deletedCategoryModel.iconName],
              size: 20,
            ),
          ),
        );
      }
      if (addCategoryModels.isEmpty) {
        editedCategoryCount = 0;
      }
    }
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
    if (!isEditCategory) {
      for (var element in addCategoryModels) {
        element.requestFocus = false;
      }
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
          id: ++currentSubcategoryId,
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
              id: ++currentSubSubcategoryId,
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

  void addEditCategoryModel(int categoryId) {
    addCategoryModels.add(tempAddCategoryModels
        .firstWhere((element) => element.id == categoryId));
    categoryList.removeWhere((element) => element.categoryId == categoryId);
    editedCategoryCount++;
    update();
  }
}
