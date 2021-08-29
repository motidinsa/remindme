// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mytask/models/expense_and_income.dart';
// import 'package:mytask/pages/add_transaction/expense/selected_category.dart';
//
// import 'expense_category.dart';
// import 'expense_detail.dart';
//
// class ExpenseController extends GetxController {
//   List<ExpenseCategoryy> categoryList = [
//     ExpenseCategoryy(
//         'Transportation',
//         Icon(
//           Icons.phonelink_setup,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         1),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.star,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         2),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.assignment,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         3),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.wysiwyg,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         4),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.app_settings_alt,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         5),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.star,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         6),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.assignment,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         7),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.wysiwyg,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         8),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.wysiwyg,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         9),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.wysiwyg,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         10),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.wysiwyg,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         11),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.wysiwyg,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         12),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.wysiwyg,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         13),
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.wysiwyg,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         13),
//   ].obs;
//
//   List<List<Card>> cardItems = [
//     [Card()]
//   ].obs;
//   List<ExpenseCategoryy> selectedCategories = [
//     ExpenseCategoryy(
//         'Food',
//         Icon(
//           Icons.wysiwyg,
//           size: 30,
//           color: Colors.black54,
//         ),
//         false,
//         13)
//   ].obs;
//   List<List<ExpenseDetail>> expenseDetailList = [
//     [ExpenseDetail()]
//   ].obs;
//   List<List<ExpenseDetail>> finishedCategory = [
//     [ExpenseDetail()]
//   ].obs;
//   String dateSet =
//       '${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().year}';
//
//   addSelectedCategory(int categoryID) {
//     selectedCategories.add(categoryList[categoryID - 1]);
//     // categoryList[categoryID - 1].isSelected = true;
//     List<ExpenseDetail> singleCategoryMultipleItems = [];
//     singleCategoryMultipleItems.add(ExpenseDetail(
//         id: categoryID,
//         expense: Expense(id: categoryID, date: dateSet),
//         isLastItem: true));
//     expenseDetailList.add(singleCategoryMultipleItems);
//     if (cardItems.length > 1) {
//       cardItems.removeLast();
//       cardItems.add(convertToCategoryCard(
//           selectedCategories.sublist(1), expenseDetailList.sublist(1)));
//     } else {
//       cardItems.add(convertToCategoryCard(
//           selectedCategories.sublist(1), expenseDetailList.sublist(1)));
//     }
//     print(expenseDetailList.length.toString()+' expense length');
//     // cardItems = convertToCategoryCard(selectedCategories, expenseDetailList);
//   }
//
//   removeSelectedCategory(int categoryID) {
//     int index = selectedCategories.indexOf(
//         selectedCategories.where((element) => element.id == categoryID).first);
//     print(index.toString() + ' iiiiiiiiiiiiii');
//     if (selectedCategories.length == 2) {
//       selectedCategories = [
//         ExpenseCategoryy(
//             'Food',
//             Icon(
//               Icons.wysiwyg,
//               size: 30,
//               color: Colors.black54,
//             ),
//             false,
//             -1)
//       ].obs;
//       expenseDetailList = [
//         [ExpenseDetail()]
//       ].obs;
//     } else {
//       selectedCategories.removeAt(index);
//       expenseDetailList.removeAt(index);
//     }
//     cardItems.removeLast();
//     cardItems.add(convertToCategoryCard(
//         selectedCategories.sublist(1), expenseDetailList.sublist(1)));
//   }
//
//   addAmount(int categoryID, int index, double amount) {
//     int categoryIndex = selectedCategories.indexOf(
//         selectedCategories.where((element) => element.id == categoryID).first);
//     expenseDetailList[categoryIndex][index].expense.amount = amount;
//     cardItems[categoryIndex] = convertToCategoryCard(
//         selectedCategories.sublist(1), expenseDetailList.sublist(1));
//   }
//
//   addReason(int categoryID, int index, String reason) {
//     int categoryIndex = selectedCategories.indexOf(
//         selectedCategories.where((element) => element.id == categoryID).first);
//     expenseDetailList[categoryIndex][index].expense.reason = reason;
//     cardItems[categoryIndex] = convertToCategoryCard(
//         selectedCategories.sublist(1), expenseDetailList.sublist(1));
//   }
//
//   addDate(int categoryID, int index, String date) {
//     int categoryIndex = selectedCategories.indexOf(
//         selectedCategories.where((element) => element.id == categoryID).first);
//     expenseDetailList[categoryIndex][index].expense.date = date;
//     cardItems[categoryIndex] = convertToCategoryCard(
//         selectedCategories.sublist(1), expenseDetailList.sublist(1));
//   }
//
//   addAnotherItem(int id) {
//     int categoryIndex = selectedCategories
//         .indexOf(selectedCategories.where((element) => element.id == id).first);
//     print(categoryIndex.toString()+' cattttt index');
//     print(expenseDetailList.length.toString()+' cattttt len');
//     expenseDetailList[categoryIndex].add(ExpenseDetail(
//         id: id, expense: Expense(id: id, date: dateSet), isLastItem: true));
//     cardItems[categoryIndex] = convertToCategoryCard(
//         selectedCategories.sublist(1), expenseDetailList.sublist(1));
//     print(id.toString() + ' another id');
//   }
//
//   finishCategory(int id) {
//     int index = selectedCategories
//         .indexOf(selectedCategories.where((element) => element.id == id).first);
//     finishedCategory.add(expenseDetailList[index]);
//     // removeSelectedCategory(id);
//   }
//
//   List<Card> convertToCategoryCard(List<ExpenseCategoryy> expenses,
//       List<List<ExpenseDetail>> expenseDetail) {
//     List<Card> toBeReturned = [];
//     for (int i = 0; i < expenses.length; i++) {
//       toBeReturned.add(
//         Card(
//           key: UniqueKey(),
//           child: multipleItems(expenses[i].categoryName, expenseDetail[i]),
//         ),
//       );
//     }
//     return toBeReturned;
//   }
//
//   Widget multipleItems(
//     String categoryName,
//     List<ExpenseDetail> multipleExpenses,
//   ) {
//     return multipleExpenses.length == 0
//         ? Container()
//         : ListView.separated(
//             itemBuilder: (context, index) =>
//                 index == multipleExpenses.length - 1
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(left: 20, top: 10),
//                             child: Text(
//                               categoryName,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.brown,
//                               ),
//                             ),
//                           ),
//                           ExpenseDetail(
//                               id: multipleExpenses.first.id,
//                               index: index,
//                               expense: multipleExpenses[index].expense,
//                               isLastItem: true),
//                         ],
//                       )
//                     : Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(left: 20, top: 10),
//                             child: Text(
//                               categoryName,
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.brown),
//                             ),
//                           ),
//                           ExpenseDetail(
//                               id: multipleExpenses.first.id,
//                               index: index,
//                               expense: multipleExpenses[index].expense,
//                               isLastItem: false),
//                         ],
//                       ),
//             separatorBuilder: (context, index) => Divider(
//                   color: Colors.grey,
//                 ),
//             itemCount: multipleExpenses.length);
//   }
// }
