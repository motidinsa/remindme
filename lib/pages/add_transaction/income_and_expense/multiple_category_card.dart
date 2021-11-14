import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/multiple_category_card_model.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/category_card.dart';

import 'category_card/category_card_user_input.dart';

class MultipleCategoryCard extends StatelessWidget {
  final bool isInitialCategory;

  // final List<Widget> cardList;

  // final List<MultipleCategoryCard> multipleCategoryCard;

  final MultipleCategoryCardModel model;
  final int categoryId;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  MultipleCategoryCard(
      {Key key, this.categoryId, this.isInitialCategory, this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: model.categoryCardModels.length == 1
          ? const NeverScrollableScrollPhysics()
          : const ClampingScrollPhysics(),
      itemBuilder: (context, index) => model.categoryCardModels.length > 1
          ? CategoryCard(
              categoryModel: model.categoryCardModels[index],
              // key: UniqueKey(),
            )
          : WidgetSize(
              onChange: (Size size) {
                incomeAndExpenseController.updateCategoryCardHeight(
                  size.height,
                );
              },
              child: CategoryCard(
                categoryModel: model.categoryCardModels[index],
                // key: UniqueKey(),
              ),
            ),
      itemCount: model.categoryCardModels.length,
    );
  }
}
