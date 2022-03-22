import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/reason.dart';

class CategoryReasonSelect extends StatelessWidget {
  final Reason reason;
  final int categoryCardId;
  final IncomeAndExpenseSubCategoryModel subcategoryModel;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  CategoryReasonSelect(
      {Key key, this.reason, this.categoryCardId, this.subcategoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: reason.isSubcategorySelected ? Colors.green.shade50 : null,
      child: InkWell(
        onTap: () {
          if (reason.subcategoryId != null) {
            incomeAndExpenseController.fetchSubcategoryReason(
                reason.categoryId, reason.subcategoryId);
            incomeAndExpenseController.changeSelectedSubcategoryReasonColor(
                subcategoryModel.categoryID, subcategoryModel.id);
            incomeAndExpenseController
                .removeBackgroundColorOfSelectedSubSubCategoryReason();
            print('cat id ${reason.categoryId} subcat ${reason.subcategoryId}');
          } else {
            incomeAndExpenseController.insertCategoryReasonValues(reason,
                categoryId: reason.categoryId, categoryCardId: categoryCardId);
            Get.back();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  if (reason.subcategoryId != null) const Spacer(),
                  if (reason.subcategoryId == null)
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            reason.name,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          subcategoryModel.subcategoryName,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  reason.subcategoryId != null
                      ? const Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.green,
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            reason.amount.toString(),
                            style: const TextStyle(
                                color: Colors.green, fontSize: 16),
                          ),
                        )
                  // Row(
                  //   children: [reason.subcategoryId != null
                  //       ? const Icon(
                  //     Icons.chevron_right_rounded,
                  //     color: Colors.green,
                  //   )
                  //       : Text(
                  //     '500000020',
                  //     style: const TextStyle(
                  //         color: Colors.green, fontSize: 16),
                  //   ),
                  //     // Expanded(
                  //     //   flex: 2,
                  //     //   child: reason.subcategoryId != null
                  //     //       ? const Icon(
                  //     //           Icons.chevron_right_rounded,
                  //     //           color: Colors.green,
                  //     //         )
                  //     //       : Text(
                  //     //           '50000',
                  //     //           style: const TextStyle(
                  //     //               color: Colors.green, fontSize: 16),
                  //     //         ),
                  //     // ),
                  //     // const Spacer(),
                  //   ],
                  // ),
                ],
              ),
              if (reason.location != null &&
                  reason.subcategoryId == null &&
                  reason.subSubcategoryId == null)
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 4,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
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
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
