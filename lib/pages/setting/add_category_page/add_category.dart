import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remindme/pages/setting/add_category_page/add_subcategory.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../../getx_controller/category/add_category_controller.dart';
import '../../../models/add_category_model.dart';

class AddCategory extends StatefulWidget {
  bool hasDeleteCategoryButton = false;
  final AddCategoryModel addCategoryModel;

  AddCategory({Key key, this.hasDeleteCategoryButton, this.addCategoryModel})
      : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  String categoryName;
  TextEditingController categoryNameController = TextEditingController();
  FocusNode categoryNameFocusNode = FocusNode();
  final AddCategoryController addCategoryController = Get.find();
  final List<String> categoryTypes = [
    'Income',
    'Expense',
    'Both',
  ];

  String selectedValue;

  void onCategoryNameFocusChange() {
    if (!categoryNameFocusNode.hasFocus) {
      addCategoryController.changeCategoryName(
          categoryId: widget.addCategoryModel.id, categoryName: categoryName);
    }
  }

  Future<void> showIconListAlertDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Select Icon for ${addCategoryController.addCategoryModels.firstWhere((element) => element.id == widget.addCategoryModel.id).categoryName ?? 'your category'}',
              textAlign: TextAlign.center),
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          content: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ResponsiveGridList(
              minItemsPerRow: 4,
              minItemWidth: 40,
              children: addCategoryController.iconList,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    categoryNameFocusNode.addListener(onCategoryNameFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    categoryNameController.value = categoryNameController.value.copyWith(
      text: widget.addCategoryModel.categoryName,
    );
    if (widget.addCategoryModel.requestFocus) {
      categoryNameFocusNode.requestFocus();
    }
    // reason = widget.categoryModel.reason;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(top: 5),
                  child: TextField(
                    focusNode: categoryNameFocusNode,
                    controller: categoryNameController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 0.75),
                      ),
                      isDense: true,
                      labelText: 'Category name',
                      labelStyle: TextStyle(
                        // fontSize: 16,
                        color: Colors.green,
                      ),
                      // contentPadding: EdgeInsets.only(left: 20)
                    ),
                    onChanged: (giveCategoryName) {
                      categoryName =
                          giveCategoryName == '' ? null : giveCategoryName;
                      addCategoryController.changeCategoryName(
                          categoryId: widget.addCategoryModel.id,
                          categoryName: categoryName);
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                if (widget.hasDeleteCategoryButton)
                  Expanded(
                      child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 0.1,
                      color: Colors.red,
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        addCategoryController.deleteCategory(
                            categoryId: widget.addCategoryModel.id);
                        // FocusScope.of(context).unfocus();
                      },
                    ),
                  ))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Text('Icon'),
                  // SizedBox(width: 10,),
                  // categoryIcon ?? Container(),
                  // if (categoryIcon != null) categoryIcon,
                  TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      addCategoryController.setCategoryIconData(
                          categoryId: widget.addCategoryModel.id);
                      showIconListAlertDialog();
                      // _showMyDialog();
                    },
                    child: Text(
                      '${addCategoryController.addCategoryModels.firstWhere((element) => element.id == widget.addCategoryModel.id).iconName != null ? 'Change' : 'Choose'} Icon',
                      style: TextStyle(color: Colors.green),
                    ),
                    style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  if (widget.addCategoryModel.icon != null)
                    widget.addCategoryModel.icon
                ],
              ),
            ),
            SizedBox(
              width: Get.width / 2,
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 0.5),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 0.75),
                  ),
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Category Type',
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.green,
                ),
                iconSize: 25,
                // buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                items: categoryTypes
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // SizedBox(width: 20,),
                              if (item == 'Expense')
                                const Expanded(
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_downward_rounded,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              if (item == 'Income')
                                const Expanded(
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_upward_rounded,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              if (item == 'Both')
                                const Expanded(
                                  child: Center(
                                    child: Icon(
                                      Icons.import_export_rounded,
                                      size: 26,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                },
                onChanged: (value) {
                  addCategoryController.setCategoryType(
                      categoryId: widget.addCategoryModel.id,
                      categoryType: value);
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            if (widget.addCategoryModel.subcategoryModels.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => AddSubcategory(
                  addSubcategoryModel:
                      widget.addCategoryModel.subcategoryModels[index],
                ),
                itemCount: widget.addCategoryModel.subcategoryModels.length,
              ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  // FocusScope.of(context).unfocus();
                  addCategoryController.addSubcategory(
                    categoryId: widget.addCategoryModel.id,
                  );
                },
                child: Text(
                  'Add Subcategory for ${widget.addCategoryModel.categoryName ?? 'your category'}',
                  textAlign: TextAlign.center,
                ),
                // style: ButtonStyle(
                //     backgroundColor:
                //     MaterialStateProperty.all<Color>(
                //         Colors.green),
                //     foregroundColor:
                //     MaterialStateProperty.all<Color>(
                //         Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
