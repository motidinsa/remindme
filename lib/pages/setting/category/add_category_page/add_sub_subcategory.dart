import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindme/models/add_sub_subcategory_model.dart';

import '../../../../getx_controller/category/add_category_controller.dart';
import '../../../../models/add_subcategory_model.dart';

class AddSubSubcategory extends StatefulWidget {
  final AddSubSubcategoryModel addSubSubcategoryModel;

  const AddSubSubcategory({Key key, this.addSubSubcategoryModel})
      : super(key: key);

  @override
  State<AddSubSubcategory> createState() => _AddSubSubcategoryState();
}

class _AddSubSubcategoryState extends State<AddSubSubcategory> {
  String subSubcategoryName;
  TextEditingController subSubcategoryNameController = TextEditingController();
  FocusNode subSubcategoryNameFocusNode = FocusNode();
  final AddCategoryController addCategoryController = Get.find();

  void onSubSubcategoryNameFocusChange() {
    if (!subSubcategoryNameFocusNode.hasFocus) {
      addCategoryController.changeSubSubcategoryName(
          categoryId: widget.addSubSubcategoryModel.categoryId,
          subcategoryId: widget.addSubSubcategoryModel.subcategoryId,
          id: widget.addSubSubcategoryModel.id,
          subSubcategoryName: subSubcategoryName);
    }
  }

  @override
  void initState() {
    super.initState();
    subSubcategoryNameFocusNode.addListener(onSubSubcategoryNameFocusChange);
    subSubcategoryName = widget.addSubSubcategoryModel.subSubcategoryName;
  }

  @override
  Widget build(BuildContext context) {
    subSubcategoryNameController.value =
        subSubcategoryNameController.value.copyWith(
      text: widget.addSubSubcategoryModel.subSubcategoryName,
    );
    if (widget.addSubSubcategoryModel.requestFocus == true) {
      subSubcategoryNameFocusNode.requestFocus();
    }
    AddSubcategoryModel parentSubcategory = addCategoryController
        .addCategoryModels
        .firstWhere(
            (element) => element.id == widget.addSubSubcategoryModel.categoryId)
        .subcategoryModels
        .firstWhere((element) =>
            element.id == widget.addSubSubcategoryModel.subcategoryId);
    return Container(
      color: Colors.green.shade100.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subcategory for ${parentSubcategory.subcategoryName ?? 'your subcategory'}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green),
            ),
            Row(
              children: [
                Container(
                  width: Get.width / 2,
                  padding: const EdgeInsets.only(top: 5),
                  child: TextField(
                    focusNode: subSubcategoryNameFocusNode,
                    controller: subSubcategoryNameController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 0.75),
                      ),
                      isDense: true,
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    onChanged: (giveSubSubcategoryName) {
                      subSubcategoryName = giveSubSubcategoryName == ''
                          ? null
                          : giveSubSubcategoryName;
                      addCategoryController.changeSubSubcategoryName(
                          categoryId: widget.addSubSubcategoryModel.categoryId,
                          subcategoryId:
                              widget.addSubSubcategoryModel.subcategoryId,
                          id: widget.addSubSubcategoryModel.id,
                          subSubcategoryName: subSubcategoryName);
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        splashRadius: 0.1,
                        color: Colors.red.shade300,
                        icon: Icon(addCategoryController.isEditCategory
                            ? Icons.delete
                            : Icons.cancel),
                        onPressed: () {
                          addCategoryController.deleteSubSubcategory(
                            categoryId:
                                widget.addSubSubcategoryModel.categoryId,
                            subcategoryId:
                                widget.addSubSubcategoryModel.subcategoryId,
                            subSubcategoryId: widget.addSubSubcategoryModel.id,
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
