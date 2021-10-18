import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/models/income_and_expense_category_select_model.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/added_expense_list.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_list.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/multiple_category_card.dart';

import 'income_and_expense_category.dart';
import 'expense_detail_list.dart';

import 'package:intl/src/intl/date_format.dart';

class SelectedCategoryInsertItem extends StatefulWidget {
  // final List<Widget> categories;

  final List<Widget> categories;
  List<FinishedCategory> finishedCategories;
  final List<Widget> categoryList;

  SelectedCategoryInsertItem(
      {this.categoryList, this.categories, this.finishedCategories});

  @override
  _SelectedCategoryInsertItemState createState() =>
      _SelectedCategoryInsertItemState();
}

class _SelectedCategoryInsertItemState
    extends State<SelectedCategoryInsertItem> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final IncomeAndExpenseController incomeAndExpenseController =
        Get.put(IncomeAndExpenseController());

    // print('detailll ${incomeAndExpenseController.categoryHeight}');
    return Column(
      // physics: const NeverScrollableScrollPhysics(),
      // key: UniqueKey(),
      // shrinkWrap: true,
      children: [
        // if (widget.finishedCategories.length > 1)
        CategoryList(UniqueKey(), incomeAndExpenseController.categoryList),
        // AddedExpenseList(incomeAndExpenseController.finishedCategories),
        // if(incomeAndExpenseController.carouselLists.isNotEmpty)
        GetBuilder(
          init: incomeAndExpenseController,
          builder: (_) => incomeAndExpenseController.carouselLists.isEmpty
              ? Container()
              : Column(
                  children: [
                    CarouselSlider(
                      items: incomeAndExpenseController.carouselLists,
                      options: CarouselOptions(
                          height: incomeAndExpenseController.categoryHeight,
                          enableInfiniteScroll:
                              incomeAndExpenseController.carouselLists.length ==
                                      1
                                  ? false
                                  : true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            incomeAndExpenseController
                                .setCurrentPosition(index);
                          }),
                    ),
                    if (incomeAndExpenseController.isCategoryHeightSet)
                      Container(
                        margin: const EdgeInsets.only(right: 20, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                              onPressed: () {
                                // DateTime now = DateTime.now();
                                //
                                // DateFormat dateFormat = DateFormat("dd-MM-yy");
                                // DateFormat timeFormat = DateFormat("HH:mm:ss");
                                // String currentDate = dateFormat.format(now);
                                // String currentTime = timeFormat.format(now);
                                // finishedCategoryList.forEach((element) {
                                //   element.expenseDetail.forEach((element) {
                                //     element.expense.addedDate = currentDate;
                                //     element.expense.addedTime = currentTime;
                                //   });
                                // });
                                // expenseDetailList.forEach((element) {
                                //   element.forEach((element) {
                                //     element.expense.addedDate = currentDate;
                                //     element.expense.addedTime = currentTime;
                                //   });
                                // });
                                // BlocProvider.of<ExpenseAndIncomeBloc>(context).add(
                                //   AddExpense(
                                //       finishedCategories: finishedCategoryList,
                                //       expenseDetails: expenseDetailList,
                                //       type: widget.type),
                                // );
                                //
                                // Navigator.pop(context);
                                // Navigator.pop(context);
                                // context.read<ExpenseBloc>().add(
                                //       AddExpense(finishedCategoryList, expenseDetailList),
                                //     );
                              },
                              child: Text(
                                'Save',
                              ),
                            ),
                          ],
                        ),
                      )
                    // const SizedBox(height: 1,),
                    // // if(incomeAndExpenseController.isCategoryHeightSet)
                    //   Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: incomeAndExpenseController.carouselLists.map(
                    //     (url) {
                    //       int index = incomeAndExpenseController.carouselLists
                    //           .indexOf(url);
                    //       return  Container(
                    //         width: 6.0,
                    //         height: 6.0,
                    //         margin:
                    //             const EdgeInsets.symmetric(horizontal: 2.0),
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: incomeAndExpenseController
                    //                           .currentCarouselPosition ==
                    //                       index ||
                    //                   incomeAndExpenseController
                    //                           .carouselLists.length ==
                    //                       1
                    //               ? Colors.green
                    //               : Colors.grey,
                    //         ),
                    //       );
                    //     },
                    //   ).toList(),
                    // )
                  ],
                ),
        )

        // GetBuilder(
        //   init: incomeAndExpenseController,
        //   builder: (controller) {
        //     return incomeAndExpenseController.carouselLists.isNotEmpty
        //         ? Column(
        //       children: [
        //         CarouselSlider(
        //           items: incomeAndExpenseController.carouselLists,
        //           options: CarouselOptions(
        //               height:
        //               incomeAndExpenseController.categoryHeight,
        //               viewportFraction: 1,
        //               onPageChanged: (index, reason) {
        //                 incomeAndExpenseController
        //                     .setCurrentPosition(index);
        //               }),
        //         ),
        //         if (incomeAndExpenseController.isCategoryHeightSet)Container(
        //           margin: const EdgeInsets.only(right: 20, bottom: 5),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [
        //               ElevatedButton(
        //                 style: ButtonStyle(
        //                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //                     backgroundColor:
        //                     MaterialStateProperty.all<Color>(Colors.green),
        //                     foregroundColor:
        //                     MaterialStateProperty.all<Color>(Colors.white)),
        //                 onPressed: () {
        //                   // DateTime now = DateTime.now();
        //                   //
        //                   // DateFormat dateFormat = DateFormat("dd-MM-yy");
        //                   // DateFormat timeFormat = DateFormat("HH:mm:ss");
        //                   // String currentDate = dateFormat.format(now);
        //                   // String currentTime = timeFormat.format(now);
        //                   // finishedCategoryList.forEach((element) {
        //                   //   element.expenseDetail.forEach((element) {
        //                   //     element.expense.addedDate = currentDate;
        //                   //     element.expense.addedTime = currentTime;
        //                   //   });
        //                   // });
        //                   // expenseDetailList.forEach((element) {
        //                   //   element.forEach((element) {
        //                   //     element.expense.addedDate = currentDate;
        //                   //     element.expense.addedTime = currentTime;
        //                   //   });
        //                   // });
        //                   // BlocProvider.of<ExpenseAndIncomeBloc>(context).add(
        //                   //   AddExpense(
        //                   //       finishedCategories: finishedCategoryList,
        //                   //       expenseDetails: expenseDetailList,
        //                   //       type: widget.type),
        //                   // );
        //                   //
        //                   // Navigator.pop(context);
        //                   // Navigator.pop(context);
        //                   // context.read<ExpenseBloc>().add(
        //                   //       AddExpense(finishedCategoryList, expenseDetailList),
        //                   //     );
        //                 },
        //                 child: Text(
        //                   'Save',
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //         // const SizedBox(height: 1,),
        //         // // if(incomeAndExpenseController.isCategoryHeightSet)
        //         //   Row(
        //         //   mainAxisAlignment: MainAxisAlignment.center,
        //         //   mainAxisSize: MainAxisSize.max,
        //         //   children: incomeAndExpenseController.carouselLists.map(
        //         //     (url) {
        //         //       int index = incomeAndExpenseController.carouselLists
        //         //           .indexOf(url);
        //         //       return  Container(
        //         //         width: 6.0,
        //         //         height: 6.0,
        //         //         margin:
        //         //             const EdgeInsets.symmetric(horizontal: 2.0),
        //         //         decoration: BoxDecoration(
        //         //           shape: BoxShape.circle,
        //         //           color: incomeAndExpenseController
        //         //                           .currentCarouselPosition ==
        //         //                       index ||
        //         //                   incomeAndExpenseController
        //         //                           .carouselLists.length ==
        //         //                       1
        //         //               ? Colors.green
        //         //               : Colors.grey,
        //         //         ),
        //         //       );
        //         //     },
        //         //   ).toList(),
        //         // )
        //       ],
        //     )
        //         : Container();
        //   },
        // ),
      ],
    );
  }
}
