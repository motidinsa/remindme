import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/category_card_controller.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/category_card_model.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/add_another_and_finish.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/category_card_account_select.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/category_card_user_input.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/reason_and_subategory_select.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_subcategory/select_subcategory.dart';

import 'category_date_select.dart';
import 'category_header.dart';

class CategoryCard extends StatelessWidget {
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();
  final CategoryCardController categoryCardController =
      Get.put(CategoryCardController());
  final CategoryCardModel categoryModel;

  CategoryCard({
    Key key,
    this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 3,
            ),
            CategoryHeader(
              categoryName: categoryModel.categoryName,
              subcategoryName: categoryModel.subcategoryName,
              subSubcategoryName: categoryModel.subSubcategoryName,
            ),
            CategoryDateSelect(
              date: categoryModel.date,
              categoryId: categoryModel.categoryId,
              categoryCardId: categoryModel.id,
            ),
            const CategoryAccountSelect(),
            ReasonAndSubcategorySelect(
              categoryId: categoryModel.categoryId,
              categoryCardId: categoryModel.id,
            ),
            const SizedBox(
              height: 5,
            ),
            CategoryUserInput(
              categoryModel: categoryModel,
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.minF,
            //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     GetBuilder(
            //       init: categoryCardController,
            //       builder: (value) => SizedBox(
            //         width: 100,
            //         height: categoryCardController.isHeightSet
            //             ? categoryCardController.height - 10
            //             : categoryCardController.height,
            //         child: TextField(
            //           focusNode: categoryCardController.amountFocusNode,
            //           keyboardType: TextInputType.number,
            //           controller:
            //               categoryCardController.expenseAmountController,
            //           decoration: const InputDecoration(
            //             enabledBorder: OutlineInputBorder(
            //               borderSide:
            //                   BorderSide(color: Colors.green, width: 0.5),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderSide:
            //                   BorderSide(color: Colors.green, width: 0.75),
            //             ),
            //             labelText: 'Amount',
            //             labelStyle: TextStyle(
            //               fontSize: 16,
            //               color: Colors.green,
            //             ),
            //             contentPadding: EdgeInsets.only(left: 20, bottom: 20),
            //           ),
            //           onChanged: (newValue) {
            //             categoryCardController.amount = newValue;
            //           },
            //           onEditingComplete: () {
            //             // BlocProvider.of<ExpenseBloc>(context).add(AddExpenseAmount(
            //             //     widget.categoryID, widget.index, amount));
            //           },
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 50,
            //     ),
            //     GetBuilder(
            //         init: categoryCardController,
            //         builder: (value) => SizedBox(
            //               width: 100,
            //               height: categoryCardController.isHeightSet
            //                   ? categoryCardController.height - 10
            //                   : categoryCardController.height,
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                     border:
            //                         Border.all(color: Colors.green.shade100),
            //                     borderRadius: BorderRadius.circular(5)),
            //                 child: Row(
            //                   children: [
            //                     Expanded(
            //                       // flex: 2,
            //                       child: WidgetSize(
            //                         onChange: (Size size) {
            //                           if (categoryCardController.height ==
            //                               null) {
            //                             // categoryCardController.height = size.height;
            //                             // categoryCardController.isHeightSet = true;
            //                             categoryCardController
            //                                 .updateFrequencyWidgetHeight(
            //                                     size.height);
            //                             // setState(() {
            //                             //   height = size.height;
            //                             //   isHeightSet = true;
            //                             // });
            //                           }
            //                         },
            //                         child: TextButton(
            //                           child: const Icon(
            //                             Icons.remove,
            //                           ),
            //                           style: TextButton.styleFrom(
            //                             padding: EdgeInsets.zero,
            //                           ),
            //                           onPressed: () {},
            //                         ),
            //                       ),
            //                     ),
            //                     Expanded(
            //                       flex: 2,
            //                       child: TextField(
            //                         // focusNode: amountFocusNode,
            //                         keyboardType: TextInputType.number,
            //                         controller: categoryCardController
            //                             .expenseNumberOfTimesController,
            //                         textAlign: TextAlign.center,
            //                         decoration: const InputDecoration(
            //                           enabledBorder: OutlineInputBorder(
            //                             borderSide: BorderSide(
            //                                 color: Colors.green, width: 0.5),
            //                           ),
            //                           focusedBorder: OutlineInputBorder(
            //                             borderSide: BorderSide(
            //                                 color: Colors.green, width: 0.75),
            //                           ),
            //                           contentPadding:
            //                               EdgeInsets.only(bottom: 20),
            //                         ),
            //                         onChanged: (newValue) {
            //                           categoryCardController.amount =
            //                               newValue;
            //                         },
            //                         onEditingComplete: () {
            //                           // BlocProvider.of<ExpenseBloc>(context).add(AddExpenseAmount(
            //                           //     widget.categoryID, widget.index, amount));
            //                         },
            //                       ),
            //                     ),
            //                     Expanded(
            //                       // flex: 2,
            //                       child: TextButton(
            //                         child: const Center(
            //                           child: Icon(Icons.add),
            //                         ),
            //                         style: OutlinedButton.styleFrom(
            //                             padding: EdgeInsets.zero),
            //                         onPressed: () {},
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ))
            //   ],
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       flex: 2,
            //       child: GetBuilder(
            //           init: categoryCardController,
            //           builder: (value) => SizedBox(
            //                 height: categoryCardController.isHeightSet
            //                     ? categoryCardController.height - 10
            //                     : categoryCardController.height,
            //                 child: TextField(
            //                     focusNode:
            //                         categoryCardController.reasonFocusNode,
            //                     // cursorHeight: 30,
            //                     controller: categoryCardController
            //                         .expenseReasonController,
            //                     decoration: const InputDecoration(
            //                       enabledBorder: OutlineInputBorder(
            //                         borderSide: BorderSide(
            //                             color: Colors.green, width: 0.5),
            //                       ),
            //                       focusedBorder: OutlineInputBorder(
            //                         borderSide: BorderSide(
            //                             color: Colors.green, width: 0.75),
            //                       ),
            //                       labelText: 'Reason (Optional)',
            //                       labelStyle: TextStyle(
            //                         // fontSize: 18,
            //                         color: Colors.green,
            //                       ),
            //                       contentPadding: EdgeInsets.only(left: 20),
            //                     ),
            //                     onChanged: (newValue) =>
            //                         categoryCardController.reason = newValue,
            //                     onEditingComplete: () {
            //                       //   expenseController.addReason(
            //                       //   widget.id,
            //                       //   widget.index,
            //                       //   reason,
            //                       // );
            //                       // BlocProvider.of<ExpenseBloc>(context).add(
            //                       //     AddExpenseReason(
            //                       //         widget.categoryID, widget.index, reason));
            //                     }),
            //               )),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Expanded(
            //       // flex: 2,
            //       child: Row(
            //         children: [
            //           const Expanded(
            //               child: Text(
            //             'Save reason',
            //           )),
            //           Expanded(
            //             child: Switch(
            //               onChanged: (value) {
            //                 // setState(() {
            //                 //   saveReason = value;
            //                 // });
            //               },
            //               value: categoryCardController.saveReason,
            //             ),
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       flex: 2,
            //       child: GetBuilder(
            //         init: categoryCardController,
            //         builder: (value) => SizedBox(
            //           height: categoryCardController.isHeightSet
            //               ? categoryCardController.height - 10
            //               : categoryCardController.height,
            //           child: TextField(
            //               focusNode: categoryCardController.locationFocusNode,
            //               // cursorHeight: 30,
            //               controller: categoryCardController
            //                   .expenseLocationController,
            //               decoration: const InputDecoration(
            //                 enabledBorder: OutlineInputBorder(
            //                   borderSide:
            //                       BorderSide(color: Colors.green, width: 0.5),
            //                 ),
            //                 focusedBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: Colors.green, width: 0.75),
            //                 ),
            //                 labelText: 'Location (Optional)',
            //                 labelStyle: TextStyle(
            //                   // fontSize: 18,
            //                   color: Colors.green,
            //                 ),
            //                 contentPadding: EdgeInsets.only(left: 20),
            //               ),
            //               onChanged: (newValue) =>
            //                   categoryCardController.reason = newValue,
            //               onEditingComplete: () {
            //                 //   expenseController.addReason(
            //                 //   widget.id,
            //                 //   widget.index,
            //                 //   reason,
            //                 // );
            //                 // BlocProvider.of<ExpenseBloc>(context).add(
            //                 //     AddExpenseReason(
            //                 //         widget.categoryID, widget.index, reason));
            //               }),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     const Spacer()
            //   ],
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            if (categoryModel.isLastItem == true)
              Center(
                child: InkWell(
                  child: Container(
                    child: Icon(
                      Icons.add,
                      color: Colors.green.shade400,
                    ),
                    // padding:  EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      // color: isSelected ? Colors.green.shade50 : null,
                      border: Border.all(color: Colors.green, width: 0.5),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    incomeAndExpenseController.addAnotherItem(
                        categoryModel.categoryId, categoryModel.id);
                    // incomeAndExpenseController.makeScrollable(true);
                  },
                ),
              ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
