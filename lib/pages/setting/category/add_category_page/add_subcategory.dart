import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindme/pages/setting/category/add_category_page/add_sub_subcategory.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../../../getx_controller/category/add_category_controller.dart';
import '../../../../helper/icons_helper.dart';
import '../../../../models/add_category_model.dart';
import '../../../../models/add_subcategory_model.dart';

class AddSubcategory extends StatefulWidget {
  final AddSubcategoryModel addSubcategoryModel;

  const AddSubcategory({Key key, this.addSubcategoryModel}) : super(key: key);

  @override
  State<AddSubcategory> createState() => _AddSubcategoryState();
}

class _AddSubcategoryState extends State<AddSubcategory> {
  String subcategoryName;
  TextEditingController subcategoryNameController = TextEditingController();
  FocusNode subcategoryNameFocusNode = FocusNode();
  final AddCategoryController addCategoryController = Get.find();

  void onSubcategoryNameFocusChange() {
    if (!subcategoryNameFocusNode.hasFocus) {
      addCategoryController.changeSubcategoryName(
          categoryId: widget.addSubcategoryModel.categoryId,
          subcategoryId: widget.addSubcategoryModel.id,
          subcategoryName: subcategoryName);
    }
  }

  @override
  void initState() {
    super.initState();
    subcategoryNameFocusNode.addListener(onSubcategoryNameFocusChange);
    subcategoryName = widget.addSubcategoryModel.subcategoryName;
  }

  Future<void> showIconListAlertDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Icon for ${widget.addSubcategoryModel.subcategoryName ?? 'your subcategory'}',
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          content: SizedBox(
            height: Get.height,
            width: Get.width,
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
  Widget build(BuildContext context) {
    subcategoryNameController.value = subcategoryNameController.value.copyWith(
      text: widget.addSubcategoryModel.subcategoryName,
    );
    if (widget.addSubcategoryModel.requestFocus == true) {
      subcategoryNameFocusNode.requestFocus();
    }
    AddCategoryModel parentCategory = addCategoryController.addCategoryModels
        .firstWhere(
            (element) => element.id == widget.addSubcategoryModel.categoryId);
    return Card(
      child: Container(
        color: Colors.green.shade100.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                'Subcategory for ${parentCategory.categoryName ?? 'your category'}',
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
                      // key: UniqueKey(),
                      focusNode: subcategoryNameFocusNode,
                      controller: subcategoryNameController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 0.5),
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
                      onChanged: (giveSubcategoryName) {
                        subcategoryName = giveSubcategoryName == ''
                            ? null
                            : giveSubcategoryName;
                        addCategoryController.changeSubcategoryName(
                            categoryId: widget.addSubcategoryModel.categoryId,
                            subcategoryId: widget.addSubcategoryModel.id,
                            subcategoryName: subcategoryName);
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        splashRadius: 0.1,
                        color: Colors.red.shade300,
                        icon: Icon(addCategoryController.isEditCategory
                            ? Icons.delete
                            : Icons.cancel),
                        onPressed: () {
                          addCategoryController.deleteSubcategory(
                              categoryId: widget.addSubcategoryModel.categoryId,
                              subcategoryId: widget.addSubcategoryModel.id);
                        },
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        addCategoryController.setSubcategoryIconData(
                            categoryId: widget.addSubcategoryModel.categoryId,
                            subcategoryId: widget.addSubcategoryModel.id);
                        showIconListAlertDialog();
                      },
                      child: Text(
                        '${widget.addSubcategoryModel.iconName != null || parentCategory.iconName != null ? 'Change' : 'Choose'} Icon',
                        style: const TextStyle(color: Colors.green),
                      ),
                      style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    addCategoryController.isEditCategory
                        ? Icon(IconsHelper.iconsMap[
                            widget.addSubcategoryModel.icon != null
                                ? widget.addSubcategoryModel.iconName
                                : parentCategory.iconName])
                        : widget.addSubcategoryModel.icon ??
                            parentCategory.icon ??
                            Container()
                  ],
                ),
              ),
              if (widget.addSubcategoryModel.subSubcategoryModels.isNotEmpty)
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => AddSubSubcategory(
                    addSubSubcategoryModel:
                        widget.addSubcategoryModel.subSubcategoryModels[index],
                  ),
                  itemCount:
                      widget.addSubcategoryModel.subSubcategoryModels.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    addCategoryController.addSubSubcategory(
                      categoryId: widget.addSubcategoryModel.categoryId,
                      subcategoryId: widget.addSubcategoryModel.id,
                    );
                  },
                  child: Text(
                    'Add Subcategory for ${widget.addSubcategoryModel.subcategoryName ?? 'your subcategory'}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
