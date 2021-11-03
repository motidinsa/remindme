import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

import 'package:intl/src/intl/date_format.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CategoryCardController extends GetxController {
  final TextEditingController expenseReasonController = TextEditingController();
  final TextEditingController expenseAmountController = TextEditingController();
  final TextEditingController expenseNumberOfTimesController =
      TextEditingController();
  final TextEditingController expenseLocationController =
      TextEditingController();
  String dropdown;
  String date = DateFormat("dd-MM-yy").format(DateTime.now());
  String _selectedDate;
  String amount;
  String reason;
  int numberOfTimes;
  String _dateCount;
  String _rangeCount;
  String dateSet = DateFormat("dd-MM-yy").format(DateTime.now());
  FocusNode amountFocusNode = FocusNode();
  FocusNode reasonFocusNode = FocusNode();
  FocusNode numberOfTimesFocusNode = FocusNode();
  FocusNode locationFocusNode = FocusNode();
  double height;
  double categoryHeight;
  bool isHeightSet = false;
  bool isCategoryHeightSet = false;
  bool saveReason = true;

  void onAmountFocusChange() {}

  void onReasonFocusChange() {}

  void onNumberOfTimesFocusChange() {}

  @override
  void onInit() {
    super.onInit();
    amountFocusNode.addListener(onAmountFocusChange);
    reasonFocusNode.addListener(onReasonFocusChange);
    numberOfTimesFocusNode.addListener(onNumberOfTimesFocusChange);
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      // _selectedDate = args.value;
      // date =
      //     '${DateTime.parse(_selectedDate).day > 9 ? DateTime.parse(_selectedDate).day : '0${DateTime.parse(_selectedDate).day}'}-${DateTime.parse(_selectedDate).month > 9 ? DateTime.parse(_selectedDate).month : '0${DateTime.parse(_selectedDate).month}'}-${DateTime.parse(_selectedDate).year}';
      date = DateFormat("dd-MM-yy").format(args.value);
      print(date);

      print(date);
    } else if (args.value is List<DateTime>) {
      _dateCount = args.value.length.toString();
    } else {
      _rangeCount = args.value.length.toString();
    }
  }

  void updateFrequencyWidgetHeight(double givenHeight) {
    height = givenHeight - 10;
    isHeightSet = true;
    update();
  }

  void updateCategoryCardHeight(double givenHeight) {
    categoryHeight = givenHeight;
    isCategoryHeightSet = true;
    update();
  }
}
