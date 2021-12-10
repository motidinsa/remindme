import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/database_models/income_and_expense/income_and_expense_model.dart';
import 'package:intl/intl.dart';
import 'package:remindme/getx_controller/income_and_expense/transaction_controller.dart';

class SingleTransaction extends StatelessWidget {
  final List<IncomeAndExpenseModel> incomeAndExpenseModel;
  final DateTime date;

  final TransactionController transactionController = Get.find();

  SingleTransaction({Key key, this.incomeAndExpenseModel, this.date})
      : super(key: key);

  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Material(
          child: child,
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    incomeAndExpenseModel
        .sort((a, b) => b.orderNumber.compareTo(a.orderNumber));
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: ReorderableListView.builder(
        proxyDecorator: _proxyDecorator,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          key: Key(incomeAndExpenseModel[index].id.toString()),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Card(
            elevation: 1,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            DateFormat('dd-MM-yy').format(date),
                            style: const TextStyle(
                              fontSize: 16,
                              // color: Colors.green,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                            'id ${incomeAndExpenseModel[index].id}  order ${incomeAndExpenseModel[index].orderNumber}'),
                        // Text(
                        //   incomeAndExpenseModel.categoryName ?? '',
                        //   style: TextStyle(
                        //       color: Colors.green,
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.w800),
                        // ),
                        SizedBox(
                          width: 5,
                        ),
                        // if (incomeAndExpenseModel.subcategoryId != null)
                        //   Text(
                        //     '->  ${incomeAndExpenseModel.subcategoryName}',
                        //     style: TextStyle(
                        //         color: Colors.lightGreen,
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w400),
                        //   ),
                        SizedBox(
                          width: 5,
                        ),
                        // if (incomeAndExpenseModel.subSubcategoryId != null)
                        //   Text(
                        //     '->  ${incomeAndExpenseModel.subSubcategoryName}',
                        //     style: TextStyle(
                        //         color: Colors.lightGreen,
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w400),
                        //   ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: Align(
                    //           child: Icon(
                    //             widget.expense.categoryType == 'Income'
                    //                 ? Icons.add
                    //                 : Icons.minimize,
                    //             color: widget.expense.categoryType == 'Income'
                    //                 ? Colors.green
                    //                 : Colors.red,
                    //             size: 30,
                    //           ),
                    //           alignment: Alignment.centerLeft,
                    //         )),
                    //     Expanded(
                    //       flex: 7,
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Text(
                    //                 widget.expense.reason,
                    //                 style: TextStyle(
                    //                     color: Colors.grey,
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.w600),
                    //               ),
                    //               SizedBox(
                    //                 width: 25,
                    //               ),
                    //               widget.expense.numberOfTimes == 1
                    //                   ? Text(
                    //                 'amount: ${widget.expense.netAmount.toString()}',
                    //                 style: TextStyle(
                    //                   color: Colors.green,
                    //                   fontSize: 16,
                    //                 ),
                    //               )
                    //                   : Text(
                    //                 'amount: ${widget.expense.numberOfTimes} x ${widget.expense.netAmount} -> ${widget.expense.totalAmount.toString()}',
                    //                 style: TextStyle(
                    //                   color: Colors.green,
                    //                   fontSize: 16,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             height: 10,
                    //           ),
                    //           Text(
                    //             'Time added:  ${widget.expense.addedTime}',
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                )),
          ),
        ),
        itemCount: incomeAndExpenseModel.length,
        // children: transactions
        //     .map((e) => Text(
        //           '${e.selectedDateAndTime.toString()}    ${e.orderNumber}  id ${e.id}',
        //           key: Key(e.id.toString()),
        //         ))
        //     .toList(),
        onReorder: (oldIndex, newIndex) =>
            transactionController.onReorder(oldIndex, newIndex, date),
      ),
    );
    // return ListView.builder(
    //     itemCount: incomeAndExpenseModel.length,
    //     shrinkWrap: true,
    //     physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (context, index) =>
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 5),
    //           child: Card(
    //             elevation: 1,
    //             child: Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     vertical: 10, horizontal: 30),
    //                 child: Column(
    //                   mainAxisSize: MainAxisSize.min,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         Expanded(
    //                           child: Text(
    //                             DateFormat('dd-MM-yy').format(date),
    //                             style: const TextStyle(
    //                               fontSize: 16,
    //                               // color: Colors.green,
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           width: 25,
    //                         ),
    //                         // Text(
    //                         //   incomeAndExpenseModel.categoryName ?? '',
    //                         //   style: TextStyle(
    //                         //       color: Colors.green,
    //                         //       fontSize: 18,
    //                         //       fontWeight: FontWeight.w800),
    //                         // ),
    //                         SizedBox(
    //                           width: 5,
    //                         ),
    //                         // if (incomeAndExpenseModel.subcategoryId != null)
    //                         //   Text(
    //                         //     '->  ${incomeAndExpenseModel.subcategoryName}',
    //                         //     style: TextStyle(
    //                         //         color: Colors.lightGreen,
    //                         //         fontSize: 16,
    //                         //         fontWeight: FontWeight.w400),
    //                         //   ),
    //                         SizedBox(
    //                           width: 5,
    //                         ),
    //                         // if (incomeAndExpenseModel.subSubcategoryId != null)
    //                         //   Text(
    //                         //     '->  ${incomeAndExpenseModel.subSubcategoryName}',
    //                         //     style: TextStyle(
    //                         //         color: Colors.lightGreen,
    //                         //         fontSize: 16,
    //                         //         fontWeight: FontWeight.w400),
    //                         //   ),
    //                       ],
    //                     ),
    //                     SizedBox(
    //                       height: 10,
    //                     ),
    //                     // Row(
    //                     //   children: [
    //                     //     Expanded(
    //                     //         child: Align(
    //                     //           child: Icon(
    //                     //             widget.expense.categoryType == 'Income'
    //                     //                 ? Icons.add
    //                     //                 : Icons.minimize,
    //                     //             color: widget.expense.categoryType == 'Income'
    //                     //                 ? Colors.green
    //                     //                 : Colors.red,
    //                     //             size: 30,
    //                     //           ),
    //                     //           alignment: Alignment.centerLeft,
    //                     //         )),
    //                     //     Expanded(
    //                     //       flex: 7,
    //                     //       child: Column(
    //                     //         crossAxisAlignment: CrossAxisAlignment.start,
    //                     //         children: [
    //                     //           Row(
    //                     //             children: [
    //                     //               Text(
    //                     //                 widget.expense.reason,
    //                     //                 style: TextStyle(
    //                     //                     color: Colors.grey,
    //                     //                     fontSize: 16,
    //                     //                     fontWeight: FontWeight.w600),
    //                     //               ),
    //                     //               SizedBox(
    //                     //                 width: 25,
    //                     //               ),
    //                     //               widget.expense.numberOfTimes == 1
    //                     //                   ? Text(
    //                     //                 'amount: ${widget.expense.netAmount.toString()}',
    //                     //                 style: TextStyle(
    //                     //                   color: Colors.green,
    //                     //                   fontSize: 16,
    //                     //                 ),
    //                     //               )
    //                     //                   : Text(
    //                     //                 'amount: ${widget.expense.numberOfTimes} x ${widget.expense.netAmount} -> ${widget.expense.totalAmount.toString()}',
    //                     //                 style: TextStyle(
    //                     //                   color: Colors.green,
    //                     //                   fontSize: 16,
    //                     //                 ),
    //                     //               ),
    //                     //             ],
    //                     //           ),
    //                     //           SizedBox(
    //                     //             height: 10,
    //                     //           ),
    //                     //           Text(
    //                     //             'Time added:  ${widget.expense.addedTime}',
    //                     //           )
    //                     //         ],
    //                     //       ),
    //                     //     )
    //                     //   ],
    //                     // ),
    //                   ],
    //                 )),
    //           ),
    //         ));
  }
}
