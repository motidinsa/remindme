import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:remindme/getx_controller/income_and_expense/category_card_controller.dart';

class CategoryDateSelect extends StatelessWidget {
  final DateTime date;
  final CategoryCardController categoryCardController = Get.find();

  CategoryDateSelect({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Date:',
          style: TextStyle(
              fontSize: 15, color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          DateFormat("dd-MM-yy").format(date),
          // key: UniqueKey(),
          style: const TextStyle(fontSize: 15, color: Colors.green),
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
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  DateTime picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    cancelText: 'Cancel',
                    confirmText: 'OK',
                  );
                  // showDialog(
                  //   // isScrollControlled: true,
                  //   // shape: const RoundedRectangleBorder(
                  //   //   borderRadius: BorderRadius.only(
                  //   //       topLeft: Radius.circular(10),
                  //   //       topRight: Radius.circular(10)),
                  //   // ),
                  //   context: context,
                  //   builder: (context) => Center(
                  //     child: Card(
                  //       child: Container(
                  //         padding: const EdgeInsets.only(top: 20),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             SfDateRangePicker(
                  //               onSelectionChanged:
                  //                   categoryCardController.onSelectionChanged,
                  //               showNavigationArrow: true,
                  //             ),
                  //             Container(
                  //               margin: const EdgeInsets.only(right: 20),
                  //               child: Align(
                  //                 alignment: Alignment.centerRight,
                  //                 child: OutlinedButton(
                  //                   child: const Text(
                  //                     'OK',
                  //                     style: TextStyle(color: Colors.green),
                  //                   ),
                  //                   onPressed: () {
                  //                     // BlocProvider.of<ExpenseBloc>(
                  //                     //     context)
                  //                     //     .add(AddExpenseDate(
                  //                     //     widget.categoryID,
                  //                     //     widget.index,
                  //                     //     date));
                  //                     // setDate(date);
                  //                     Navigator.pop(context);
                  //
                  //                     // DateTime date = Datetime
                  //                   },
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
