import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';

import 'multiple_category_card.dart';

class CarouselCategoryList extends StatelessWidget {
  final IncomeAndExpenseController incomeAndExpenseController =
      Get.put(IncomeAndExpenseController());

  static final _formKey = GlobalKey<FormState>();

  CarouselCategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: incomeAndExpenseController,
      builder: (_) {
        return incomeAndExpenseController.categoryModels.isEmpty
            ? Container()
            : Column(
                children: [
                  CarouselSlider(
                    items: incomeAndExpenseController.categoryModels
                        .map(
                          (model) => MultipleCategoryCard(
                            model: model,
                          ),
                        )
                        .toList(),
                    carouselController:
                        incomeAndExpenseController.buttonCarouselController,
                    options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: incomeAndExpenseController.categoryHeight,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          FocusScope.of(context).unfocus();
                          incomeAndExpenseController.setCurrentPosition(index);
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
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                            child: const Text(
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
              );
      },
    );
  }
}
