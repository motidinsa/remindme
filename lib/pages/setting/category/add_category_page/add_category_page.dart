import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../../../getx_controller/category/add_category_controller.dart';
import 'add_category.dart';

class AddCategoryPage extends StatelessWidget {
  final bool isEditCategory;
  AddCategoryController addCategoryController;

  AddCategoryPage({Key key, this.isEditCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> showCategoryListAlertDialog() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Category List', textAlign: TextAlign.center),
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10),
              child: ResponsiveGridList(
                rowMainAxisAlignment: MainAxisAlignment.center,
                horizontalGridMargin: 5,
                minItemsPerRow: 3,
                minItemWidth: 60,
                children: addCategoryController.categoryList,
                // verticalGridMargin: 10,
              ),
            ),
          );
        },
      );
    }

    addCategoryController =
        Get.put(AddCategoryController(isEditCategory: isEditCategory));
    return Scaffold(
      appBar: AppBar(
        title: Text('${isEditCategory ? 'Edit' : 'Add'} Category'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: GetBuilder(
          init: addCategoryController,
          builder: (_) {
            return addCategoryController.isEditCategory &&
                    addCategoryController.editedCategoryCount == 0
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showCategoryListAlertDialog();
                          },
                          child: const Text('Select category to be edited'),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => index ==
                            addCategoryController.addCategoryModels.length - 1
                        ? Column(
                            children: [
                              AddCategory(
                                addCategoryModel: addCategoryController
                                    .addCategoryModels[index],
                                hasDeleteCategoryButton: isEditCategory
                                    ? true
                                    : addCategoryController
                                                .addCategoryModels.length >
                                            1
                                        ? true
                                        : false,
                              ),
                              Row(
                                children: [
                                  addCategoryController.editedCategoryCount !=
                                          addCategoryController
                                              .tempAddCategoryModels.length
                                      ? Expanded(
                                          child: Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (addCategoryController
                                                    .isEditCategory) {
                                                  showCategoryListAlertDialog();
                                                } else {
                                                  addCategoryController
                                                      .addCategory();
                                                }
                                              },
                                              child: Text(
                                                  '${isEditCategory ? 'Edit' : 'Add'} another category'),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Colors.green.shade500),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Spacer(),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        child: const Text(
                                          'Save',
                                        ),
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : AddCategory(
                            addCategoryModel:
                                addCategoryController.addCategoryModels[index],
                      hasDeleteCategoryButton: isEditCategory
                                ? true
                                : addCategoryController
                                            .addCategoryModels.length >
                                        1
                                    ? true
                                    : false,
                          ),
                    itemCount: addCategoryController.addCategoryModels.length,
                  );
          },
        ),
      ),
    );
  }
}
