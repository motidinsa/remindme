import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/category_card_controller.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/add_another_and_finish.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/add_subcategories.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final int categoryId;
  final CategoryCardController categoryCardController =
      Get.put(CategoryCardController());
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();
  bool isLastItem = true;

  CategoryCard({Key key, this.categoryName, this.categoryId, this.isLastItem})
      : super(key: key);

  // CategoryCard();

  // final TextEditingController _expenseReasonController =
  //     TextEditingController();
  // final TextEditingController _expenseAmountController =
  //     TextEditingController();
  // final TextEditingController _expenseNumberOfTimesController =
  //     TextEditingController();
  // final TextEditingController _expenseLocationController =
  //     TextEditingController();
  // String dropdown;
  // String date = DateFormat("dd-MM-yy").format(DateTime.now());
  // String _selectedDate;
  // String amount;
  // String reason;
  // int numberOfTimes;
  // String _dateCount;
  // String _rangeCount;
  // String dateSet = DateFormat("dd-MM-yy").format(DateTime.now());
  // FocusNode amountFocusNode = FocusNode();
  // FocusNode reasonFocusNode = FocusNode();
  // FocusNode numberOfTimesFocusNode = FocusNode();
  // FocusNode locationFocusNode = FocusNode();
  // double height;
  // double categoryheight;
  // bool isHeightSet = false;
  // bool isCategoryHeightSet = false;
  // bool saveReason = true;
  //
  // void onAmountFocusChange() {}
  //
  // void onReasonFocusChange() {}
  //
  // void onNumberOfTimesFocusChange() {}

  // void setDate(String date) {
  //   setState(() {
  //     dateSet = date ?? dateSet;
  //   });
  // }

  // void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   if (args.value is DateTime) {
  //     // _selectedDate = args.value;
  //     // date =
  //     //     '${DateTime.parse(_selectedDate).day > 9 ? DateTime.parse(_selectedDate).day : '0${DateTime.parse(_selectedDate).day}'}-${DateTime.parse(_selectedDate).month > 9 ? DateTime.parse(_selectedDate).month : '0${DateTime.parse(_selectedDate).month}'}-${DateTime.parse(_selectedDate).year}';
  //     date = DateFormat("dd-MM-yy").format(args.value);
  //     print(date);
  //
  //     print(date);
  //   } else if (args.value is List<DateTime>) {
  //     _dateCount = args.value.length.toString();
  //   } else {
  //     _rangeCount = args.value.length.toString();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // amountFocusNode.addListener(onAmountFocusChange);
    // reasonFocusNode.addListener(onReasonFocusChange);
    // numberOfTimesFocusNode.addListener(onNumberOfTimesFocusChange);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Text(
              categoryName,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Row(
              children: [
                const Text(
                  'Date:',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'expense.date',
                  // key: UniqueKey(),
                  style: TextStyle(fontSize: 15, color: Colors.green),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text(
                          'Change Date',
                          style: TextStyle(color: Colors.green),
                        ),
                        style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            context: context,
                            builder: (context) => StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SfDateRangePicker(
                                        onSelectionChanged:
                                            categoryCardController
                                                .onSelectionChanged,
                                        showNavigationArrow: true,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: OutlinedButton(
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                            onPressed: () {
                                              // BlocProvider.of<ExpenseBloc>(
                                              //     context)
                                              //     .add(AddExpenseDate(
                                              //     widget.categoryID,
                                              //     widget.index,
                                              //     date));
                                              // setDate(date);
                                              Navigator.pop(context);

                                              // DateTime date = Datetime
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Text('Subtract from '),
                const SizedBox(
                  width: 15,
                ),
                Card(
                  elevation: 2,
                  color: Colors.green.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: const [Text('Wallet'), Text('Balance: 100')],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Change'),
                  // style: TextButton.styleFrom(
                  //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  // ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: const Text('Select reason'),
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Select Subcategory'),
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      context: context,
                      builder: (context) => AddSubcategories());
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                Icon(
                  Icons.star_rounded,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Subcategories will be automatically added if you pressed the select reason button',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 5),
            child: Row(
              children: const [
                Text(
                  'Transport',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.chevron_right_rounded, color: Colors.black87),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Bus',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.chevron_right_rounded, color: Colors.black87),
                Text(
                  'Anbessa',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 175),
            child: Text(
              'Frequency',
              style: TextStyle(color: Colors.brown),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GetBuilder(
                  init: categoryCardController,
                  builder: (value) => SizedBox(
                    width: 100,
                    height: categoryCardController.isHeightSet
                        ? categoryCardController.height - 10
                        : categoryCardController.height,
                    child: TextField(
                      focusNode: categoryCardController.amountFocusNode,
                      keyboardType: TextInputType.number,
                      controller:
                          categoryCardController.expenseAmountController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Amount',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                        contentPadding: EdgeInsets.only(left: 20, bottom: 20),
                      ),
                      onChanged: (newValue) {
                        categoryCardController.amount = newValue;
                      },
                      onEditingComplete: () {
                        // BlocProvider.of<ExpenseBloc>(context).add(AddExpenseAmount(
                        //     widget.categoryID, widget.index, amount));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                GetBuilder(
                    init: categoryCardController,
                    builder: (value) => SizedBox(
                          width: 100,
                          height: categoryCardController.isHeightSet
                              ? categoryCardController.height - 10
                              : categoryCardController.height,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green.shade100),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Expanded(
                                  // flex: 2,
                                  child: WidgetSize(
                                    onChange: (Size size) {
                                      if (categoryCardController.height ==
                                          null) {
                                        // categoryCardController.height = size.height;
                                        // categoryCardController.isHeightSet = true;
                                        categoryCardController
                                            .updateFrequencyWidgetHeight(
                                                size.height);
                                        // setState(() {
                                        //   height = size.height;
                                        //   isHeightSet = true;
                                        // });
                                      }
                                    },
                                    child: TextButton(
                                      child: const Icon(
                                        Icons.remove,
                                      ),
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    // focusNode: amountFocusNode,
                                    keyboardType: TextInputType.number,
                                    controller: categoryCardController
                                        .expenseNumberOfTimesController,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                          EdgeInsets.only(bottom: 20),
                                    ),
                                    onChanged: (newValue) {
                                      categoryCardController.amount = newValue;
                                    },
                                    onEditingComplete: () {
                                      // BlocProvider.of<ExpenseBloc>(context).add(AddExpenseAmount(
                                      //     widget.categoryID, widget.index, amount));
                                    },
                                  ),
                                ),
                                Expanded(
                                  // flex: 2,
                                  child: TextButton(
                                    child: const Center(
                                      child: Icon(Icons.add),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.zero),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GetBuilder(
                      init: categoryCardController,
                      builder: (value) => SizedBox(
                            height: categoryCardController.isHeightSet
                                ? categoryCardController.height - 10
                                : categoryCardController.height,
                            child: TextField(
                                focusNode:
                                    categoryCardController.reasonFocusNode,
                                // cursorHeight: 30,
                                controller: categoryCardController
                                    .expenseReasonController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Reason (Optional)',
                                  labelStyle: TextStyle(
                                    // fontSize: 18,
                                    color: Colors.green,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                ),
                                onChanged: (newValue) =>
                                    categoryCardController.reason = newValue,
                                onEditingComplete: () {
                                  //   expenseController.addReason(
                                  //   widget.id,
                                  //   widget.index,
                                  //   reason,
                                  // );
                                  // BlocProvider.of<ExpenseBloc>(context).add(
                                  //     AddExpenseReason(
                                  //         widget.categoryID, widget.index, reason));
                                }),
                          )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  // flex: 2,
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        'Save reason',
                      )),
                      Expanded(
                        child: Switch(
                          onChanged: (value) {
                            // setState(() {
                            //   saveReason = value;
                            // });
                          },
                          value: categoryCardController.saveReason,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GetBuilder(
                      init: categoryCardController,
                      builder: (value) => SizedBox(
                            height: categoryCardController.isHeightSet
                                ? categoryCardController.height - 10
                                : categoryCardController.height,
                            child: TextField(
                                focusNode:
                                    categoryCardController.locationFocusNode,
                                // cursorHeight: 30,
                                controller: categoryCardController
                                    .expenseLocationController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Location (Optional)',
                                  labelStyle: TextStyle(
                                    // fontSize: 18,
                                    color: Colors.green,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                ),
                                onChanged: (newValue) =>
                                    categoryCardController.reason = newValue,
                                onEditingComplete: () {
                                  //   expenseController.addReason(
                                  //   widget.id,
                                  //   widget.index,
                                  //   reason,
                                  // );
                                  // BlocProvider.of<ExpenseBloc>(context).add(
                                  //     AddExpenseReason(
                                  //         widget.categoryID, widget.index, reason));
                                }),
                          )),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Spacer()
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // if (isLastItem == true)
          AddAnotherAnfFinish(
            categoryId: categoryId,
            categoryName: categoryName,
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
