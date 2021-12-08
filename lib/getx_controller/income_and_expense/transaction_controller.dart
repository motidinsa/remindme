// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// class TransactionController extends GetxController {
//
//   void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is DateTime) {
//       // _selectedDate = args.value;
//       // date =
//       //     '${DateTime.parse(_selectedDate).day > 9 ? DateTime.parse(_selectedDate).day : '0${DateTime.parse(_selectedDate).day}'}-${DateTime.parse(_selectedDate).month > 9 ? DateTime.parse(_selectedDate).month : '0${DateTime.parse(_selectedDate).month}'}-${DateTime.parse(_selectedDate).year}';
//       date = DateFormat("dd-MM-yy").format(args.value);
//       print(date);
//
//       print(date);
//     } else if (args.value is List<DateTime>) {
//       _dateCount = args.value.length.toString();
//     } else {
//       _rangeCount = args.value.length.toString();
//     }
//   }
//
//   void updateFrequencyWidgetHeight(double givenHeight) {
//     height = givenHeight - 10;
//     isHeightSet = true;
//     update();
//   }
//
//   void updateCategoryCardHeight(double givenHeight) {
//     categoryHeight = givenHeight;
//     isCategoryHeightSet = true;
//     update();
//   }
// }
