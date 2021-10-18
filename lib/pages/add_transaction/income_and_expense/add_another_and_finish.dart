import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';

class AddAnotherAnfFinish extends StatefulWidget {
  final String categoryName;
  final int categoryId;

  const AddAnotherAnfFinish({Key key, this.categoryId, this.categoryName})
      : super(key: key);

  @override
  _AddAnotherAndFinishState createState() => _AddAnotherAndFinishState();
}

class _AddAnotherAndFinishState extends State<AddAnotherAnfFinish> {
  bool isLastItem = true;
  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return isLastItem
        ? Row(
            children: [
              Expanded(child: Container()),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // isLastItem = false;
                    incomeAndExpenseController.addAnotherItemToTheSameCategory(
                        widget.categoryName, widget.categoryId);
                    setState(() {
                      isLastItem = false;
                    });
                    // expenseController.addAnotherItem(widget.id);
                    // BlocProvider.of<ExpenseBloc>(context)
                    //     .add(AddAnotherItem(widget.categoryID));
                  },
                  child: const Text(
                    'Add another',
                    style: TextStyle(color: Colors.green),
                  ),
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  // style: ButtonStyle(
                  //   foregroundColor:
                  //       MaterialStateProperty.all<Color>(Colors.green),
                  // ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // expenseController.finishCategory(widget.id);
                    // BlocProvider.of<ExpenseBloc>(context)
                    //     .add(FinishCategory(widget.categoryID));
                  },
                  child: const Text('Finish'),
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
