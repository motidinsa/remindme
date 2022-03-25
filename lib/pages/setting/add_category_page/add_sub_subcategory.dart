import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remindme/models/add_sub_subcategory_model.dart';

import '../../../getx_controller/category/add_category_controller.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    subSubcategoryNameController.value =
        subSubcategoryNameController.value.copyWith(
      text: widget.addSubSubcategoryModel.subSubcategoryName,
    );
    if (widget.addSubSubcategoryModel.requestFocus) {
      subSubcategoryNameFocusNode.requestFocus();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          'Subcategory for ${addCategoryController.addCategoryModels.firstWhere((element) => element.id == widget.addSubSubcategoryModel.categoryId).subcategoryModels.firstWhere((element) => element.id == widget.addSubSubcategoryModel.subcategoryId).subcategoryName ?? 'your subcategory'}',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
        ),
        Row(
          children: [
            Container(
              // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(top: 5),
              child: TextField(
                focusNode: subSubcategoryNameFocusNode,
                controller: subSubcategoryNameController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 0.75),
                  ),
                  isDense: true,
                  // labelText: 'Sub Subcategory name',
                  labelStyle: TextStyle(
                    // fontSize: 16,
                    color: Colors.green,
                  ),
                  // contentPadding: EdgeInsets.only(left: 20)
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
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      // FocusScope.of(context).unfocus();
                      addCategoryController.deleteSubSubcategory(
                        categoryId: widget.addSubSubcategoryModel.categoryId,
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
    );
  }
}
