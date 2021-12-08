import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:remindme/getx_controller/income_and_expense/category_card_controller.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/category_card_model.dart';

class CategoryUserInput extends StatefulWidget {
  final CategoryCardModel categoryModel;

  const CategoryUserInput({Key key, this.categoryModel}) : super(key: key);

  @override
  _CategoryUserInputState createState() => _CategoryUserInputState();
}

class _CategoryUserInputState extends State<CategoryUserInput> {
  final CategoryCardController categoryCardController = Get.find();

  final IncomeAndExpenseController incomeAndExpenseController = Get.find();

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String amountValue;
  String frequency;
  String reason;
  String location;

  FocusNode amountFocusNode = FocusNode();
  FocusNode reasonFocusNode = FocusNode();
  FocusNode frequencyFocusNode = FocusNode();
  FocusNode locationFocusNode = FocusNode();

  @override
  void initState() {
    amountFocusNode.addListener(onAmountFocusChange);
    reasonFocusNode.addListener(onReasonFocusChange);
    frequencyFocusNode.addListener(onFrequencyFocusChange);
    locationFocusNode.addListener(onLocationFocusChange);

    super.initState();
  }

  void onAmountFocusChange() {
    if (!amountFocusNode.hasFocus) {
      incomeAndExpenseController.changeAmountValue(widget.categoryModel.id,
          widget.categoryModel.categoryId, amountValue);
    }
  }

  void onReasonFocusChange() {
    if (!reasonFocusNode.hasFocus) {
      incomeAndExpenseController.changeReason(
          widget.categoryModel.id, widget.categoryModel.categoryId, reason);
    }
  }

  void onFrequencyFocusChange() {
    if (!frequencyFocusNode.hasFocus) {
      incomeAndExpenseController.changeFrequency(
          widget.categoryModel.id, widget.categoryModel.categoryId, frequency);
    }
  }

  void onLocationFocusChange() {
    if (!locationFocusNode.hasFocus) {
      incomeAndExpenseController.changeLocation(
          widget.categoryModel.id, widget.categoryModel.categoryId, location);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.categoryModel.requestFocusOnAmount == true) {
      amountFocusNode.requestFocus();
    }
    _amountController.value = _amountController.value.copyWith(
      text: widget.categoryModel.netAmount,
    );
    _reasonController.value = _reasonController.value.copyWith(
      text: widget.categoryModel.reason,
    );
    _frequencyController.value = _frequencyController.value.copyWith(
      text: widget.categoryModel.frequency.toString(),
    );
    if (widget.categoryModel.location == null) {
      _locationController.value = _locationController.value.copyWith(
        text: '',
      );
    } else {
      _locationController.value = _locationController.value.copyWith(
        text: widget.categoryModel.location,
      );
    }

    return Column(
      children: [
        Row(
          children: const [
            SizedBox(
              width: 170,
            ),
            Text(
              'Frequency',
              style: TextStyle(color: Colors.brown),
            ),
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              height: categoryCardController.height,
              child: TextField(
                focusNode: amountFocusNode,
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 0.75),
                  ),
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                  contentPadding: EdgeInsets.only(left: 20, bottom: 20),
                ),
                onChanged: (amount) {
                  amountValue = amount;
                },
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                  incomeAndExpenseController.changeAmountValue(
                    widget.categoryModel.id,
                    widget.categoryModel.categoryId,
                    amountValue,
                  );
                },
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            SizedBox(
              width: 100,
              height: categoryCardController.height,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade100),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Expanded(
                      child: WidgetSize(
                        onChange: (Size size) {
                          if (!categoryCardController.isHeightSet) {
                            categoryCardController
                                .updateFrequencyWidgetHeight(size.height);
                          }
                        },
                        child: TextButton(
                          child: const Icon(
                            Icons.remove,
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () async {
                            await FocusScope.of(context).unfocus();
                            incomeAndExpenseController.decreaseFrequencyValue(
                                widget.categoryModel.id,
                                widget.categoryModel.categoryId);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        onTap: () {
                          frequency = widget.categoryModel.frequency.toString();
                        },
                        focusNode: frequencyFocusNode,
                        keyboardType: TextInputType.number,
                        controller: _frequencyController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 0.75),
                          ),
                          contentPadding: EdgeInsets.only(bottom: 20),
                        ),
                        onChanged: (givenFrequency) {
                          print('given $givenFrequency');
                          frequency = givenFrequency;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: TextButton(
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                        style:
                            OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          await FocusScope.of(context).unfocus();
                          incomeAndExpenseController.increaseFrequencyValue(
                              widget.categoryModel.id,
                              widget.categoryModel.categoryId);
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: categoryCardController.height,
                child: TextField(
                    focusNode: reasonFocusNode,
                    controller: _reasonController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 0.75),
                      ),
                      labelText: 'Reason (Optional)',
                      labelStyle: TextStyle(
                        // fontSize: 18,
                        color: Colors.green,
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                    ),
                    onChanged: (givenReason) => reason = givenReason,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    }),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Spacer()
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: categoryCardController.height,
                child: TextField(
                    focusNode: locationFocusNode,
                    // cursorHeight: 30,
                    controller: _locationController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 0.75),
                      ),
                      labelText: 'Location (Optional)',
                      labelStyle: TextStyle(
                        // fontSize: 18,
                        color: Colors.green,
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                    ),
                    onChanged: (givenLocation) => location = givenLocation,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    }),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Spacer()
          ],
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
