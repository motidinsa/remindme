import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/database_models/income_and_expense/income_and_expense_model.dart';
import 'package:intl/intl.dart';
import 'package:remindme/getx_controller/income_and_expense/transaction_controller.dart';
import 'package:remindme/helper/widget_size.dart';

class SingleTransaction extends StatelessWidget {
  final List<IncomeAndExpenseModel> incomeAndExpenseModel;
  final DateTime date;
  double accountSize = 0;
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
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        date != null ? DateFormat('dd-MM-yy').format(date) : '',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w600),
                        // textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: Wrap(
                          children: [
                            Text(
                              "${incomeAndExpenseModel[index].categoryName}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold),
                              // textAlign: TextAlign.center,
                            ),
                            if (incomeAndExpenseModel[index].subcategoryId !=
                                null)
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.navigate_next_rounded,
                                    size: 18,
                                    color: Colors.brown,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "${incomeAndExpenseModel[index].subcategoryName}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold),
                                    // textAlign: TextAlign.center,
                                  ),
                                  if (incomeAndExpenseModel[index]
                                          .subSubcategoryId !=
                                      null)
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.navigate_next_rounded,
                                          size: 18,
                                          color: Colors.brown,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "${incomeAndExpenseModel[index].subSubcategoryName}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.brown,
                                              fontWeight: FontWeight.bold),
                                          // textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                ],
                              ),
                          ],
                        ),
                      ),
                      // Text(
                      //     'id ${incomeAndExpenseModel[index].id}  order ${incomeAndExpenseModel[index].orderNumber}'),
                      // Text(
                      //   incomeAndExpenseModel.categoryName ?? '',
                      //   style: TextStyle(
                      //       color: Colors.green,
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.w800),
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // if (incomeAndExpenseModel.subcategoryId != null)
                      //   Text(
                      //     '->  ${incomeAndExpenseModel.subcategoryName}',
                      //     style: TextStyle(
                      //         color: Colors.lightGreen,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w400),
                      //   ),
                      // SizedBox(
                      //   width: 5,
                      // ),
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
                  const SizedBox(
                    height: 5,
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.remove,
                        color: Colors.red,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Expanded(flex: 3,
                      //   child: Wrap(
                      //     children: [
                      //       Text(
                      //         ' bkjjb jbj ',
                      //         style: TextStyle(color: Colors.red.shade200),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //       // SizedBox(
                      //       //   width: 2,
                      //       // ),
                      //       // Icon(
                      //       //   Icons.navigate_next_rounded,
                      //       //   size: 18,
                      //       //   color: Colors.red.shade200,
                      //       // ),
                      //       // SizedBox(
                      //       //   width: 2,
                      //       // ),
                      //       // Text(
                      //       //   '${incomeAndExpenseModel[index].subAccountName} abyb bank vuyuvuy',
                      //       //   style: TextStyle(color: Colors.red.shade200),
                      //       // )
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 120,
                      //     child: Text('bvjbfdjbvjdf vdhfbvd vdfvkbdf vdjfvkdfvjd fvkdh vkdjfv')),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      if (incomeAndExpenseModel[index].name != null)
                        Expanded(
                          flex: 3,
                          child: Text(
                            '${incomeAndExpenseModel[index].name}',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      if (incomeAndExpenseModel[index].name == null)
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Text(
                                '${incomeAndExpenseModel[index].accountName}',
                                style: TextStyle(color: Colors.red.shade200),
                              ),
                              if (incomeAndExpenseModel[index].subAccountId !=
                                  null)
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.navigate_next_rounded,
                                      size: 18,
                                      color: Colors.red.shade200,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '${incomeAndExpenseModel[index].subAccountName}',
                                      style:
                                          TextStyle(color: Colors.red.shade200),
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${incomeAndExpenseModel[index].totalAmount}',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  // Divider(color: Colors.grey,
                  //   // height: 5,
                  // ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      if (incomeAndExpenseModel[index].name != null)
                        Row(
                          children: [
                            Text(
                              '${incomeAndExpenseModel[index].accountName}',
                              style: TextStyle(color: Colors.red.shade200),
                            ),
                            if (incomeAndExpenseModel[index].subAccountId !=
                                null)
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.navigate_next_rounded,
                                    size: 18,
                                    color: Colors.red.shade200,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '${incomeAndExpenseModel[index].subAccountName}',
                                    style:
                                        TextStyle(color: Colors.red.shade200),
                                  )
                                ],
                              )
                          ],
                        ),
                      SizedBox(
                        width: 20,
                      ),
                      if (incomeAndExpenseModel[index].location != null)
                        Expanded(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.room_outlined,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  '${incomeAndExpenseModel[index].location}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                        )
                    ],
                  ),

                  // SizedBox(
                  //   height: 2,
                  // ),
                ],
              ),
            ),
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
  }
}
