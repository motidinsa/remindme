import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/reason.dart';

import 'category_reason_select.dart';
import 'empty_reason.dart';
import 'subcategory_reason_select.dart';

class SelectReason extends StatelessWidget {
  final int categoryId;
  final int categoryCardId;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  SelectReason({
    Key key,
    this.categoryId,
    this.categoryCardId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      'Select Reason',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    OutlinedButton(
                      child: const Text('Add Reason'),
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
                builder: (controller) {
                  List<Reason> categoryReasons = incomeAndExpenseController
                      .reasons
                      .where((element) => element.categoryId == categoryId)
                      .toList();
                  List<Reason> allSubcategoryReasons = categoryReasons
                      .where((element) => element.subcategoryId != null)
                      .toList();
                  List<Reason> subcategoryReasons = [];

                  for (Reason reason in allSubcategoryReasons) {
                    if (subcategoryReasons.isEmpty) {
                      subcategoryReasons.add(reason);
                    } else {
                      int categorySimilarityFrequency = 0;
                      List<Reason> tempSubcategory = [];
                      for (Reason item in subcategoryReasons) {
                        if (item.subcategoryId != reason.subcategoryId) {
                          tempSubcategory.add(reason);
                        } else {
                          categorySimilarityFrequency++;
                        }
                      }
                      if (categorySimilarityFrequency == 0) {
                        subcategoryReasons.add(tempSubcategory.first);
                      }
                    }
                  }
                  subcategoryReasons.addAll(
                    categoryReasons
                        .where((element) => element.subcategoryId == null)
                        .toList(),
                  );
                  categoryReasons = subcategoryReasons;
                  return WidgetSize(
                    onChange: (Size size) {
                      incomeAndExpenseController
                          .updateReasonHeight(size.height);
                    },
                    child: SizedBox(
                      height: incomeAndExpenseController.reasonSelectPageHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Card(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      CategoryReasonSelect(
                                    reason: categoryReasons.elementAt(index),
                                    subcategoryModel: categoryReasons
                                                .elementAt(index)
                                                .subcategoryId !=
                                            null
                                        ? incomeAndExpenseController
                                            .subcategories
                                            .firstWhere((element) =>
                                                element.id ==
                                                    categoryReasons
                                                        .elementAt(index)
                                                        .subcategoryId &&
                                                element.categoryID ==
                                                    categoryReasons
                                                        .elementAt(index)
                                                        .categoryId)
                                        : null,
                                    categoryCardId: categoryCardId,
                                  ),
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.green.shade100,
                                    height: 10,
                                  ),
                                  itemCount: categoryReasons.length,
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
                                      SubcategoryReasonSelect(
                                    reason: incomeAndExpenseController
                                        .subcategoryReasons
                                        .elementAt(index),
                                    subSubcategoryModel: incomeAndExpenseController
                                                .subcategoryReasons
                                                .elementAt(index)
                                                .subSubcategoryId !=
                                            null
                                        ? incomeAndExpenseController
                                            .subSubcategories
                                            .firstWhere((element) =>
                                                element.id ==
                                                    incomeAndExpenseController
                                                        .subcategoryReasons
                                                        .elementAt(index)
                                                        .subSubcategoryId &&
                                                element.subcategoryID ==
                                                    incomeAndExpenseController
                                                        .subcategoryReasons
                                                        .elementAt(index)
                                                        .subcategoryId &&
                                                element.categoryID ==
                                                    incomeAndExpenseController
                                                        .subcategoryReasons
                                                        .elementAt(index)
                                                        .categoryId)
                                        : null,
                                    categoryCardId: categoryCardId,
                                  ),
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.green.shade100,
                                    height: 10,
                                  ),
                                  itemCount: incomeAndExpenseController
                                      .subcategoryReasons.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        : const EmptyReason();
  }
}
