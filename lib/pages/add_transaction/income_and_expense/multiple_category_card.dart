import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  ScrollController listScrollController = ScrollController();
  ScrollController childScrollController = ScrollController();

  _scrollListener() {
    if (listScrollController.offset ==
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      print('at bottom');
      incomeAndExpenseController.makeScrollable(false);
    } else if (listScrollController.offset ==
            listScrollController.position.minScrollExtent &&
        !listScrollController.position.outOfRange) {
      print('at top');
      incomeAndExpenseController.makeScrollable(false);
    }
  }

  MultipleCategoryCard(
      {Key key, this.categoryId, this.isInitialCategory, this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // listScrollController.addListener(_scrollListener);
    // final position = listScrollController.position.maxScrollExtent;
    // listScrollController.position.

    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            print('Reached the bottom');
            incomeAndExpenseController.scrollUp();
          } else if (notification.metrics.pixels ==
              notification.metrics.minScrollExtent) {
            print('Reached the top');
            incomeAndExpenseController.scrollDown();
          }
        }
        return true;
      },
      // onNotification: (OverscrollNotification value) {
      //   if (value.overscroll < 0 &&
      //       listScrollController.offset + value.overscroll <= 0) {
      //     if (listScrollController.offset != 0) listScrollController.jumpTo(0);
      //     return true;
      //   }
      //   if (listScrollController.offset + value.overscroll >=
      //       listScrollController.position.maxScrollExtent) {
      //     if (listScrollController.offset !=
      //         listScrollController.position.maxScrollExtent)
      //       listScrollController
      //           .jumpTo(listScrollController.position.maxScrollExtent);
      //     return true;
      //   }
      //   listScrollController
      //       .jumpTo(listScrollController.offset + value.overscroll);
      //   return true;
      // },
      // onNotification: (ScrollStartNotification value) {
      //   final ScrollMetrics metrics = value.metrics;
      //   if (!metrics.atEdge || metrics.pixels == 0) return true;
      //   print("Your callback here");
      //   return true;
      // },
      child: ListView.builder(
        controller: childScrollController,
        shrinkWrap: true,
        physics: incomeAndExpenseController.isScrollable
            ? const ClampingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
