import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_subcategory/sub_subcategory_select_item.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_subcategory/subcategory_select_item.dart';

import '../../../../../getx_controller/reason/reason_controller.dart';
import 'empty_subcategory_select.dart';

class SelectSubcategory extends StatelessWidget {
  final int categoryId;
  final int categoryCardId;
  final String type;
  final controller;
  final int id;

  SelectSubcategory({
    Key key,
    this.categoryId,
    this.categoryCardId,
    this.type,
    this.controller,
    this.id,
  }) : super(key: key);

  final List<IncomeAndExpenseSubSubCategoryModel> subSubcategories = [
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 1,
      categoryID: 1,
      subcategoryID: 1,
      subSubcategoryName: 'Anbessa',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 2,
      categoryID: 1,
      subcategoryID: 1,
      subSubcategoryName: 'Sheger',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return controller.subcategories.isNotEmpty
        ? ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Select Subcategory',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    OutlinedButton(
                      child: const Text('Add Subcategory'),
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                  ],
                ),
              ),
              GetBuilder(
                init: type == 'reason'
                    ? controller as ReasonController
                    : controller as IncomeAndExpenseController,
                builder: (_) => WidgetSize(
                  onChange: (Size size) {
                    controller.updateSubcategoryHeight(size.height);
                  },
                  child: SizedBox(
                    height: controller.subcategorySelectPageHeight,
                    child: Padding(
                      padding: Get.context.isLandscape
                          ? const EdgeInsets.fromLTRB(20, 0, 20, 10)
                          : const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Card(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    SubcategorySelectItem(
                                  subcategoryModel:
                                      controller.subcategories.elementAt(index),
                                  categoryCardId: categoryCardId,
                                  controller: controller,
                                  type: type,
                                  id: id,
                                ),
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.green.shade100,
                                  height: 10,
                                ),
                                itemCount: controller.subcategories.length,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Card(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    SubSubcategorySelectItem(
                                  controller: controller,
                                  subSubcategoryModel: controller
                                      .selectedSubSubcategories
                                      .elementAt(index),
                                  categoryCardId: categoryCardId,
                                  type: type,
                                  id: id,
                                ),
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.green.shade100,
                                  height: 10,
                                ),
                                itemCount:
                                    controller.selectedSubSubcategories.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : const EmptySubcategorySelect();
  }
}
