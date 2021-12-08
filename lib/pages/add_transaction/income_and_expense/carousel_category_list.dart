import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hive/hive.dart';
import 'package:remindme/database_models/category/category_model.dart';
import 'package:remindme/database_models/income_and_expense/income_and_expense_model.dart';
import 'package:remindme/database_operations/income_and_expense_operation.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/category_card_model.dart';

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
                            child: const Text(
                              'Save',
                            ),
                            style: ButtonStyle(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              IncomeAndExpenseOperation
                                  incomeAndExpenseInstance =
                                  IncomeAndExpenseOperation();
                              incomeAndExpenseInstance.insertIncomeAndExpense();
                              Get.back();
                              // await Hive.openBox<IncomeAndExpenseModel>(
                              //     'income_and_expense');
                              // List<IncomeAndExpenseModel>
                              //     databaseIncomeAndExpenseModel = [];
                              // for (int i = 0;
                              //     i <
                              //         incomeAndExpenseController
                              //             .categoryModels.length;
                              //     i++) {
                              //   List<CategoryCardModel> categoryCardModels =
                              //       incomeAndExpenseController
                              //           .categoryModels[i].categoryCardModels;
                              //   for (int j = 0;
                              //       j < categoryCardModels.length;
                              //       j++) {
                              //     int id =
                              //         await Hive.box<IncomeAndExpenseModel>(
                              //                 'income_and_expense')
                              //             .add(
                              //       IncomeAndExpenseModel(),
                              //     );
                              //     Hive.box<IncomeAndExpenseModel>(
                              //             'income_and_expense')
                              //         .put(
                              //       id,
                              //       IncomeAndExpenseModel(
                              //         id: id,
                              //         name: categoryCardModels[j].reason,
                              //         categoryId:
                              //             categoryCardModels[j].categoryId,
                              //         subcategoryId:
                              //             categoryCardModels[j].subcategoryId,
                              //         subSubcategoryId: categoryCardModels[j]
                              //             .subSubCategoryId,
                              //         dateAndTimeAdded: DateTime.now(),
                              //         selectedDateAndTime:
                              //             categoryCardModels[j].date,
                              //         userId: 0,
                              //         frequency:
                              //             categoryCardModels[j].frequency,
                              //         netAmount: double.parse(
                              //             categoryCardModels[j].netAmount),
                              //         categoryName:
                              //             categoryCardModels[j].categoryName,
                              //         subcategoryName:
                              //             categoryCardModels[j].subcategoryName,
                              //         subSubcategoryName: categoryCardModels[j]
                              //             .subSubcategoryName,
                              //         location: categoryCardModels[j].location,
                              //         dateType: 'gr',
                              //       ),
                              //     );
                              //   }
                              // }
                              // int id =
                              //     await Hive.box<CategoryModel>('category').add(
                              //   CategoryModel(),
                              // );
                              // Hive.box<CategoryModel>('category').put(
                              //   id,
                              //   CategoryModel(
                              //       id: id,
                              //       categoryName: 'test $id',
                              //       dateAndTimeAdded: DateTime.now(),
                              //       iconName: 'account_balance'),
                              // );
                              // Hive.box<CategoryModel>('category').keys.last;
                              // Hive.box<CategoryModel>('category').add(
                              //   CategoryModel(
                              //     categoryName: 'test 4',
                              //     dateAndTimeAdded: DateTime.now(),
                              //     iconName: 'icon name 4'
                              //   ),
                              // );
                              // Hive.box<CategoryModel>('category').delete(-1);
                              // DateTime now = DateTime.now();
                              //
                              // Hive.box<CategoryModel>('category')
                              //     .values
                              //     .forEach((element) {
                              //   print(
                              //       'key: ${element.key}  id: ${element.id} name: ${element.categoryName} icon: ${element.iconName} date: ${element.dateAndTimeAdded} mod: ${element.lastModifiedDateAndTime}');
                              // });
                              // Hive.box<CategoryModel>('category').clear();
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
