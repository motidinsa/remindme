import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remindme/pages/setting/add_category_page/add_sub_subcategory.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../../getx_controller/category/add_category_controller.dart';
import '../../../models/add_subcategory_model.dart';

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
  }

  Future<void> showIconListAlertDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Icon for ${addCategoryController.addCategoryModels.firstWhere((element) => element.id == widget.addSubcategoryModel.categoryId).subcategoryModels.firstWhere((element) => element.id == widget.addSubcategoryModel.id).subcategoryName ?? 'your category'}',
            textAlign: TextAlign.center,
          ),
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
  Widget build(BuildContext context) {
    // subcategoryNameFocusNode.requestFocus();
    subcategoryNameController.value = subcategoryNameController.value.copyWith(
      text: widget.addSubcategoryModel.subcategoryName,
    );
    if (widget.addSubcategoryModel.requestFocus) {
      subcategoryNameFocusNode.requestFocus();
    }
    return Card(
      child: Container(
        color: Colors.green.shade100.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Subcategory for ${addCategoryController.addCategoryModels.firstWhere((element) => element.id == widget.addSubcategoryModel.categoryId).categoryName ?? 'your category'}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green),
              ),
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.only(top: 5),
                    child: TextField(
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
                        // labelText: 'Subcategory name',
                        labelStyle: TextStyle(
                          // fontSize: 16,
                          color: Colors.green,
                        ),
                        // contentPadding: EdgeInsets.only(left: 20)
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
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          // FocusScope.of(context).unfocus();
                          addCategoryController.deleteSubcategory(
                              categoryId: widget.addSubcategoryModel.categoryId,
                              subcategoryId: widget.addSubcategoryModel.id);
                        },
                      ),
                    ),
                  )
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
                        addCategoryController.setSubcategoryIconData(
                            categoryId: widget.addSubcategoryModel.categoryId,
                            subcategoryId: widget.addSubcategoryModel.id);
                        showIconListAlertDialog();
                      },
                      child: Text(
                        '${addCategoryController.addCategoryModels.firstWhere((element) => element.id == widget.addSubcategoryModel.categoryId).subcategoryModels.firstWhere((element) => element.id == widget.addSubcategoryModel.id).iconName != null || addCategoryController.addCategoryModels.firstWhere((element) => element.id == widget.addSubcategoryModel.categoryId).iconName != null ? 'Change' : 'Choose'} Icon',
                        style: const TextStyle(color: Colors.green),
                      ),
                      style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    // if (widget.addSubcategoryModel.icon != null)
                    //   widget.addSubcategoryModel.icon,
                    addCategoryController.addCategoryModels
                            .firstWhere((element) =>
                                element.id ==
                                widget.addSubcategoryModel.categoryId)
                            .subcategoryModels
                            .firstWhere((element) =>
                                element.id == widget.addSubcategoryModel.id)
                            .icon ??
                        addCategoryController.addCategoryModels
                            .firstWhere((element) =>
                                element.id ==
                                widget.addSubcategoryModel.categoryId)
                            .icon ??
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
              SizedBox(
                height: 10,
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    // FocusScope.of(context).unfocus();
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
