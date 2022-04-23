import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remindme/getx_controller/reason/reason_controller.dart';

import '../../../../models/reason/add_reason_model.dart';
import '../../../add_transaction/income_and_expense/category_card/category_header.dart';

class AddReasonInput extends StatefulWidget {
  final AddReasonModel addReasonModel;

  const AddReasonInput({Key key, this.addReasonModel}) : super(key: key);

  @override
  State<AddReasonInput> createState() => _AddReasonInputState();
}

class _AddReasonInputState extends State<AddReasonInput> {
  final FocusNode reasonNameFocusNode = FocusNode();
  final FocusNode amountFocusNode = FocusNode();
  final FocusNode locationNameFocusNode = FocusNode();
  final ReasonController reasonController = Get.find();
  TextEditingController reasonNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController locationNameController = TextEditingController();
  String reasonName;
  String amount;
  String location;

  void onReasonNameFocusChange() {
    if (!reasonNameFocusNode.hasFocus) {
      reasonController.changeReasonName(
        categoryId: widget.addReasonModel.categoryId,
        id: widget.addReasonModel.id,
        reasonName: reasonName,
      );
      reasonController.removeFocus();
    }
  }

  void onAmountFocusChange() {
    if (!amountFocusNode.hasFocus) {
      reasonController.changeAmount(
        categoryId: widget.addReasonModel.categoryId,
        id: widget.addReasonModel.id,
        amount: double.parse(amount),
      );
      reasonController.removeFocus();
    }
  }

  void onLocationNameFocusChange() {
    if (!reasonNameFocusNode.hasFocus) {
      reasonController.changeLocationName(
        categoryId: widget.addReasonModel.categoryId,
        id: widget.addReasonModel.id,
        locationName: location,
      );
      reasonController.removeFocus();
    }
  }

  @override
  void initState() {
    super.initState();
    reasonNameFocusNode.addListener(onReasonNameFocusChange);
    amountFocusNode.addListener(onAmountFocusChange);
    locationNameFocusNode.addListener(onLocationNameFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    reasonNameController.value = reasonNameController.value.copyWith(
      text: widget.addReasonModel.name,
    );
    amountController.value = amountController.value.copyWith(
      text: widget.addReasonModel.amount != null
          ? widget.addReasonModel.amount % 1 == 0
              ? widget.addReasonModel.amount.toInt().toString()
              : widget.addReasonModel.amount.toString()
          : null,
    );
    locationNameController.value = locationNameController.value.copyWith(
      text: widget.addReasonModel.location,
    );
    if (widget.addReasonModel.requestFocus == true) {
      reasonNameFocusNode.requestFocus();
    }
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15,
          bottom: 10,
        ),
        child: Column(
          children: [
            CategoryHeader(
              id: widget.addReasonModel.id,
              categoryId: widget.addReasonModel.categoryId,
              categoryName: reasonController.categories
                  .firstWhere((element) =>
                      element.id == widget.addReasonModel.categoryId)
                  .categoryName,
              subcategoryName: widget.addReasonModel.subcategoryId != null
                  ? reasonController.subcategories
                      .firstWhere((element) =>
                          element.id == widget.addReasonModel.subcategoryId)
                      .subcategoryName
                  : null,
              subSubcategoryName: widget.addReasonModel.subSubcategoryId != null
                  ? reasonController.subSubcategories
                      .firstWhere((element) =>
                          element.id == widget.addReasonModel.subSubcategoryId)
                      .subSubcategoryName
                  : null,
              type: 'reason',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  focusNode: reasonNameFocusNode,
                  controller: reasonNameController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.75),
                    ),
                    isDense: true,
                    labelText: 'Reason name',
                    labelStyle: TextStyle(
                      // fontSize: 16,
                      color: Colors.green,
                    ),
                    // contentPadding: EdgeInsets.only(left: 20)
                  ),
                  onChanged: (giveReasonName) {
                    reasonName = giveReasonName == '' ? null : giveReasonName;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  focusNode: amountFocusNode,
                  controller: amountController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.75),
                    ),
                    isDense: true,
                    labelText: 'Amount (optional)',
                    labelStyle: TextStyle(
                      // fontSize: 16,
                      color: Colors.green,
                    ),
                    // contentPadding: EdgeInsets.only(left: 20)
                  ),
                  onChanged: (givenAmount) {
                    amount = givenAmount == '' ? null : givenAmount;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  focusNode: locationNameFocusNode,
                  controller: locationNameController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.75),
                    ),
                    isDense: true,
                    labelText: 'Location (optional)',
                    labelStyle: TextStyle(
                      // fontSize: 16,
                      color: Colors.green,
                    ),
                    // contentPadding: EdgeInsets.only(left: 20)
                  ),
                  onChanged: (giveLocationName) {
                    location = giveLocationName == '' ? null : giveLocationName;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
