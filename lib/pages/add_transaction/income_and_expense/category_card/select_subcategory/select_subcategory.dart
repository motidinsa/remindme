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

import 'empty_subcategory_select.dart';

class SelectSubcategory extends StatelessWidget {
  final int categoryId;
  final int categoryCardId;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  SelectSubcategory({Key key, this.categoryId, this.categoryCardId})
      : super(key: key);

  // final List<IncomeAndExpenseCategoryModel> categories = [
  //   IncomeAndExpenseCategoryModel(
  //       categoryType: 'Expense',
  //       id: 1,
  //       categoryName: 'Transport',
  //       iconType: 'material',
  //       iconName: 'account_balance',
  //       subcategoryCount: 3),
  //   IncomeAndExpenseCategoryModel(
  //       categoryType: 'Expense',
  //       id: 2,
  //       categoryName: 'Food',
  //       iconType: 'material',
  //       iconName: 'account_balance'),
  //   IncomeAndExpenseCategoryModel(
  //       categoryType: 'Expense',
  //       id: 3,
  //       categoryName: 'Other',
  //       iconType: 'material',
  //       iconName: 'account_balance'),
  // ];
  // List<IncomeAndExpenseSubCategoryModel> subcategories = [
  //   IncomeAndExpenseSubCategoryModel(
  //     subcategoryType: 'Expense',
  //     id: 1,
  //     categoryID: 1,
  //     subcategoryName: 'Bus',
  //     iconType: 'material',
  //     iconName: 'account_balance',
  //     subSubcategoryCount: 3,
  //     isSelected: false,
  //   ),
  //   IncomeAndExpenseSubCategoryModel(
  //     subcategoryType: 'Expense',
  //     id: 2,
  //     categoryID: 1,
  //     subcategoryName: 'Taxi',
  //     iconType: 'material',
  //     iconName: 'account_balance',
  //     subSubcategoryCount: 3,
  //     isSelected: false,
  //   ),
  //   IncomeAndExpenseSubCategoryModel(
  //     subcategoryType: 'Expense',
  //     id: 3,
  //     categoryID: 1,
  //     subcategoryName: 'Bajaj',
  //     iconType: 'material',
  //     iconName: 'account_balance',
  //     subSubcategoryCount: 3,
  //     isSelected: false,
  //   )
  // ];
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
    // var allSubcategories =
    //     subcategories.where((element) => element.categoryID == categoryId);
    return incomeAndExpenseController.subcategories.isNotEmpty
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
                init: incomeAndExpenseController,
                builder: (controller) => WidgetSize(
                  onChange: (Size size) {
                    incomeAndExpenseController
                        .updateSubcategoryHeight(size.height);
                  },
                  child: SizedBox(
                    height:
                        incomeAndExpenseController.subcategorySelectPageHeight,
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
                                  subcategoryModel: incomeAndExpenseController
                                      .subcategories
                                      .elementAt(index),
                                  categoryCardId: categoryCardId,
                                ),
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.green.shade100,
                                  height: 10,
                                ),
                                itemCount: incomeAndExpenseController
                                    .subcategories.length,
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
                                  subSubcategoryModel:
                                      incomeAndExpenseController
                                          .selectedSubSubcategories
                                          .elementAt(index),
                                  categoryCardId: categoryCardId,
                                ),
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.green.shade100,
                                  height: 10,
                                ),
                                itemCount: incomeAndExpenseController
                                    .selectedSubSubcategories.length,
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
