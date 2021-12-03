import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/one_row_category.dart';
import 'package:flutter/rendering.dart';

class CategoryList extends StatelessWidget {
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  CategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('cl ${incomeAndExpenseController.categoryList.length}');
    return GetBuilder(
      init: incomeAndExpenseController,
      builder: (_) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Center(
            child: SizedBox(
              height: incomeAndExpenseController.categoryListHeight,
              child: WidgetSize(
                onChange: (Size size) {
                  incomeAndExpenseController
                          .updateCategoryListHeight(size.height);
                    },
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 5,
                          runSpacing: 5,
                          children: incomeAndExpenseController.categoryList,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
