import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_reason/sub_subcategory_reason_select.dart';

class SubcategoryReasonSelect extends StatelessWidget {
  final Reason reason;
  final int categoryCardId;
  final IncomeAndExpenseSubSubCategoryModel subSubcategoryModel;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  SubcategoryReasonSelect(
      {Key key, this.reason, this.categoryCardId, this.subSubcategoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
      color: reason.isSubSubcategorySelected ? Colors.green.shade50 : null,
      child: InkWell(
        onTap: () {
          if (reason.subSubcategoryId != null) {
            showDialog(
              // barrierColor: Colors.green,
              context: context,
              builder: (context) {
                return SubSubcategoryReasonSelect(
                  categoryCardId: categoryCardId,
                  subSubcategoryId: subSubcategoryModel.id,
                  subSubcategoryName: subSubcategoryModel.subSubcategoryName,
                  reason: incomeAndExpenseController.reasons
                      .where((element) =>
                          element.categoryId ==
                              subSubcategoryModel.categoryID &&
                          element.subcategoryId ==
                              subSubcategoryModel.subcategoryID &&
                          element.subSubcategoryId == subSubcategoryModel.id)
                      .toList(),
                );
              },
            ).then((value) {
              incomeAndExpenseController
                  .removeBackgroundColorOfSelectedSubSubCategoryReason();
            });
            incomeAndExpenseController.changeSelectedSubSubcategoryReasonColor(
                subSubcategoryModel.categoryID,
                subSubcategoryModel.subcategoryID,
                subSubcategoryModel.id);
          } else {
            incomeAndExpenseController.insertSubCategoryReasonValues(reason,
                categoryId: reason.categoryId,
                categoryCardId: categoryCardId,
                subcategoryId: reason.subcategoryId);
            Get.back();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  if (reason.subSubcategoryId != null) const Spacer(),
                  if (reason.subSubcategoryId == null)
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Text(
                          reason.name,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          subSubcategoryModel.subSubcategoryName,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: reason.subSubcategoryId != null
                              ? const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.green,
                                )
                              : Text(
                                  reason.amount,
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 16),
                                ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
              if (reason.location != null && reason.subSubcategoryId == null)
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.room_outlined,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          reason.location,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              // Row(
              //   children: [
              //     const Spacer(),
              //     Expanded(
              //       flex: 4,
              //       child: Row(
              //         // mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           const Icon(
              //             Icons.room_outlined,
              //             size: 16,
              //             color: Colors.grey,
              //           ),
              //           const SizedBox(
              //             width: 5,
              //           ),
              //           Text(
              //             reason.location,
              //             style: const TextStyle(
              //                 color: Colors.grey, fontSize: 15),
              //           )
              //         ],
              //       ),
              //     ),
              //     const Spacer(),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
