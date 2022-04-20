import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remindme/getx_controller/reason/reason_controller.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/category_header.dart';

import '../../../add_transaction/income_and_expense/category_card/reason_and_subategory_select.dart';
import 'add_reason_input.dart';
import 'category_and_subcategory_reason_add_button.dart';

class AddReason extends StatelessWidget {
  final int categoryId;

  // final String categoryName;
  final ReasonController reasonController = Get.find();

  AddReason({Key key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              const CategoryHeader(
                categoryName: 'cat name',
                // subcategoryName: 'subcat name',
                // subSubcategoryName: 'subsubcat name',
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const AddReasonInput(),
                itemCount: reasonController.getCategoryReasonLength(categoryId),
              ),
              ReasonCategoryAndSubcategorySelect(
                categoryId: categoryId,
              )
            ],
          ),
        ),
      ),
    );
  }
}
