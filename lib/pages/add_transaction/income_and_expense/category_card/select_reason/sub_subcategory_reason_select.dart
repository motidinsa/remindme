import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/reason.dart';

class SubSubcategoryReasonSelect extends StatelessWidget {
  final List<Reason> reason;
  final int categoryCardId;
  final String subSubcategoryName;
  final int subSubcategoryId;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  SubSubcategoryReasonSelect(
      {Key key,
      this.subSubcategoryName,
      this.reason,
      this.categoryCardId,
      this.subSubcategoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 5, bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subSubcategoryName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green),
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) => InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(reason[i].name),
                                  if (reason[i].location != null)
                                    Row(
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
                                          reason[i].location,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                reason[i].amount.toString(),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        incomeAndExpenseController
                            .insertSubSubCategoryReasonValues(reason[i],
                                categoryId: reason[i].categoryId,
                                categoryCardId: categoryCardId,
                                subcategoryId: reason[i].subcategoryId,
                                subSubcategoryId: reason[i].subSubcategoryId);
                        Get.back();
                        Get.back();
                      },
                    ),
                    itemCount: reason.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
