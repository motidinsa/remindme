import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindme/getx_controller/reason/reason_controller.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/category_header.dart';
import '../../../../models/reason/multiple_reason_model.dart';
import 'add_reason_input.dart';
import 'category_and_subcategory_reason_add_button.dart';

class AddReason extends StatelessWidget {
  final MultipleReasonModel multipleReasonModel;

  final ReasonController reasonController = Get.find();

  AddReason({Key key, this.multipleReasonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              if (reasonController.getCategoryReasonLength(
                      multipleReasonModel.categoryId) ==
                  0)
                CategoryHeader(
                  categoryName: reasonController.categories
                      .firstWhere((element) =>
                          element.id == multipleReasonModel.categoryId)
                      .categoryName,
                  categoryId: multipleReasonModel.categoryId,
                  type: 'reason',
                ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => AddReasonInput(
                    addReasonModel: multipleReasonModel.reasonModels[index]),
                itemCount: reasonController
                    .getCategoryReasonLength(multipleReasonModel.categoryId),
              ),
              ReasonCategoryAndSubcategorySelect(
                  categoryId: multipleReasonModel.categoryId,
                  categoryName: reasonController.categories
                      .firstWhere((element) =>
                          element.id == multipleReasonModel.categoryId)
                      .categoryName)
            ],
          ),
        ),
      ),
    );
  }
}
