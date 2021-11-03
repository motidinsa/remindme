import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';

class SelectSubcategory extends StatelessWidget {
  final int categoryId;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  SelectSubcategory({Key key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Select Subcategory for your reason',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Card(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Container(
                                    // color: Colors.green.shade100,
                                    child: InkWell(
                                      onTap: () {},
                                      // color: Colors.green,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            const Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: Text(
                                                  'aees',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                child: Row(
                                              children: const [
                                                Expanded(
                                                  flex: 2,
                                                  child: Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Spacer(),
                                              ],
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.green.shade100,
                                    height: 10,
                                  ),
                                  itemCount: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Card(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Container(
                                    // color: Colors.green.shade100,
                                    child: InkWell(
                                      onTap: () {},
                                      // color: Colors.green,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            const Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: Text(
                                                  'aees',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                child: Row(
                                              children: const [
                                                Expanded(
                                                  flex: 2,
                                                  child: Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Spacer(),
                                              ],
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.green.shade100,
                                    height: 10,
                                  ),
                                  itemCount: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      ],
    );
  }
}
