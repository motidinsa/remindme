// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:remindme/bloc/reason/reason_bloc.dart';
// import 'package:remindme/bloc/reason/reason_event.dart';
// import 'package:remindme/bloc/reason/reason_state.dart';
// import 'package:remindme/models/expense_and_income_category.dart';
// import 'package:remindme/models/reason.dart';
// import 'package:remindme/pages/add_transaction/icon_select.dart';
// import 'package:remindme/pages/setting/add_category_page/expense_category.dart';
// import 'package:remindme/pages/setting/add_category_page/single_row_category_icon_list.dart';
// import 'package:remindme/pages/setting/add_reason/sub_subcategory_reason_page.dart';
// import 'package:remindme/pages/setting/add_reason/subcategory_reason_page.dart';
// import 'package:remindme/helper/icons_helper.dart';
// import 'package:intl/src/intl/date_format.dart';
// import 'category_reason.dart';
//
// class ReasonPage extends StatefulWidget {
//   @override
//   _ReasonPageState createState() => _ReasonPageState();
// }
//
// class _ReasonPageState extends State<ReasonPage> {
//   int tempCategoryID = 0;
//   int tempSubCategoryID = 0;
//   String subCategoryName;
//   TextEditingController reasonNameController = TextEditingController();
//   bool isCategorySelected = false;
//   bool isSubCategorySelected = false;
//   String categoryName;
//   int categoryID;
//   List<IncomeAndExpenseCategoryModel> categoryModels = [];
//
//   // List<Widget> categoryAndSubcategoryReasonList = [];
//   List<Widget> categoryList = [];
//   List<Reason> categoryReasonModelList = [];
//   List<List<Reason>> subsubcategoryReasonModelList = [];
//
//   List<CategoryReason> categoryReasonList = [];
//   List<SubCategoryReasonPage> subcategoryReasonPage = [];
//   List<List<SubSubCategoryReasonPage>> subsubcategoryReasonPage = [];
//
//   // List<SubCategoryReasonPage> subcategoryWidgets = [];
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> _showMyDialog() async {
//     List<IncomeAndExpenseCategoryModel> categories = [];
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Icon for category'),
//           contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
//           content: BlocBuilder<ReasonBloc, ReasonState>(
//             builder: (_, state) {
//               int itemCount = categoryList.length % 5 == 0
//                   ? (categoryList.length ~/ 5)
//                   : (categoryList.length ~/ 5) + 1;
//               if (state is CategoryFetchError) {
//                 return Center(child: Text('Some error happened'));
//               }
//               if (state is AllCategoriesFetched) {
//                 categoryList = [];
//                 categoryModels = state.categories;
//                 for (int i = 0; i < state.categories.length; i++) {
//                   categoryList.add(
//                     Column(
//                       children: [
//                         IconSelect(
//                             icon: Icon(
//                               IconsHelper.getIconGuessFavorMaterial(
//                                   name: state.categories[i].iconName),
//                             ),
//                             name: state.categories[i].categoryName,
//                             type: 'add_reason',
//                             id: state.categories[i].id),
//                         Text(categoryModels[i].categoryName)
//                       ],
//                     ),
//                   );
//                 }
//
//                 print(categoryList.length.toString() + ' llllllllllllllllll');
//
//                 BlocProvider.of<ReasonBloc>(context).add(ClearReason());
//               }
//
//               // print(state.toString() + 'stateeeeeeeeee');
//               return Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: ListView.separated(
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) =>
//                       index == (categoryList.length ~/ 5)
//                           ? SingleRowIconList(categoryList.sublist(
//                               5 * index, 5 * index + (categoryList.length % 5)))
//                           : SingleRowIconList(
//                               categoryList.sublist(5 * index, 5 * index + 5)),
//                   itemCount: itemCount,
//                   separatorBuilder: (context, index) => SizedBox(
//                     height: 5,
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Add Reason'),
//         ),
//         body: BlocBuilder<ReasonBloc, ReasonState>(
//           builder: (_, state) {
//             if (state is AllCategoriesFetched) {
//               categoryModels = state.categories;
//               BlocProvider.of<ReasonBloc>(context).add(ClearReason());
//             }
//             if (state is ReasonCategoryAdded) {
//               categoryName = categoryModels
//                   .firstWhere((element) => element.id == state.categoryID)
//                   .categoryName;
//               categoryID = state.categoryID;
//               categoryReasonModelList.forEach((element) {
//                 element.categoryId = categoryID;
//               });
//               categoryReasonList.forEach((element) {
//                 element.categoryName = categoryName;
//                 print(element.categoryName);
//               });
//
//               BlocProvider.of<ReasonBloc>(context).add(ClearReason());
//             }
//             if (state is CategoryReasonAdded) {
//               print(state.categoryReason.toString() + ' sssssssssssssss');
//               categoryReasonModelList
//                   .firstWhere((element) => element.id == state.id)
//                   .name = state.categoryReason;
//               BlocProvider.of<ReasonBloc>(context).add(ClearReason());
//             }
//             if (state is CategoryAmountAdded) {
//               categoryReasonModelList
//                   .firstWhere((element) => element.id == state.id)
//                   .amount = state.categoryAmount;
//               BlocProvider.of<ReasonBloc>(context).add(ClearReason());
//             }
//             if (state is CategoryReasonRemoved) {
//               categoryReasonModelList
//                   .removeWhere((element) => element.id == state.id);
//               categoryReasonList
//                   .removeWhere((element) => element.id == state.id);
//               BlocProvider.of<ReasonBloc>(context).add(ClearReason());
//             }
//             return ListView(
//               // shrinkWrap: true,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15, top: 20),
//                   child: Center(
//                     child: OutlinedButton(
//                       onPressed: () {
//                         BlocProvider.of<ReasonBloc>(context)
//                             .add(GetAllCategories());
//                         _showMyDialog();
//                       },
//                       child: Text(
//                         'Select category',
//                         style: TextStyle(color: Colors.green),
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (categoryName != null)
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25),
//                     child: Text('Selected category: $categoryName'),
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15, top: 10),
//                   child: Row(
//                     children: [
//                       TextButton(
//                           style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<Color>(
//                                   Colors.green),
//                               foregroundColor: MaterialStateProperty.all<Color>(
//                                   Colors.white)),
//                           onPressed: () {
//                             setState(() {
//                               categoryReasonList.add(CategoryReason(
//                                 type: 'Category',
//                                 categoryName: categoryName,
//                                 key: UniqueKey(),
//                                 categoryID: categoryID,
//                                 id: tempCategoryID,
//                               ));
//                               categoryReasonModelList.add(Reason(
//                                   categoryId: categoryID, id: tempCategoryID));
//                             });
//                             tempCategoryID++;
//                           },
//                           child: Text('Add category reason')),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       OutlinedButton(
//                           onPressed: () {
//                             // _showMyDialog();
//                             setState(() {
//                               subcategoryReasonPage.add(
//                                 SubCategoryReasonPage(
//                                   categoryID: categoryID,
//                                   id: tempSubCategoryID,
//                                 ),
//                               );
//                             });
//                             tempSubCategoryID++;
//                           },
//                           child: Text(
//                             'Add subcategory reason',
//                             style: TextStyle(color: Colors.green),
//                           )),
//                     ],
//                   ),
//                 ),
//                 // if (categoryAndSubcategoryReasonList.length > 0)
//                 //   Column(
//                 //     children: categoryAndSubcategoryReasonList,
//                 //   ),
//                 if (categoryReasonList.length > 0)
//                   Column(
//                     children: categoryReasonList,
//                   ),
//                 if (subcategoryReasonPage.length > 0)
//                   Column(
//                     children: subcategoryReasonPage,
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 15, top: 10),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Container(),
//                       ),
//                       Expanded(
//                         child: Align(
//                           // alignment: Alignment.centerRight,
//                           child: OutlinedButton(
//                             child: Text(
//                               'Save',
//                               style: TextStyle(color: Colors.green),
//                             ),
//                             onPressed: () {
//                               DateTime now = DateTime.now();
//
//                               DateFormat dateFormat = DateFormat("dd-MM-yy");
//                               DateFormat timeFormat = DateFormat("HH:mm:ss");
//                               String currentDate = dateFormat.format(now);
//                               String currentTime = timeFormat.format(now);
//                               categoryReasonModelList.forEach((element) {
//                                 element.dateAdded = currentDate;
//                                 element.timeAdded = currentTime;
//                               });
//                               subcategoryReasonPage.forEach((element) {
//                                 element.subcategoryReasonModelList
//                                     .forEach((element) {
//                                   element.dateAdded = currentDate;
//                                   element.timeAdded = currentTime;
//                                 });
//                               });
//                               // subcategoryReasonPage.forEach(
//                               //   (element) {
//                               //     element.subsubcategoryReasonPage.forEach(
//                               //       (element) {
//                               //         element.subsubcategoryReasonModelList
//                               //             .forEach(
//                               //           (element) {
//                               //             element.date = currentDate;
//                               //             element.time = currentTime;
//                               //           },
//                               //         );
//                               //       },
//                               //     );
//                               //   },
//                               // );
//                               // subcategoryReasonPage.forEach((element) {
//                               //   subsubcategoryReasonPage
//                               //       .add(element.subsubcategoryReasonPage);
//                               // });
//                               subcategoryReasonPage.forEach((element) {
//                                 element.subsubcategoryReasonPage
//                                     .forEach((element) {
//                                   element.subsubcategoryReasonModelList
//                                       .forEach((element) {
//                                     element.dateAdded = currentDate;
//                                     element.timeAdded = currentTime;
//                                   });
//                                   subsubcategoryReasonModelList.add(
//                                       element.subsubcategoryReasonModelList);
//                                 });
//                               });
//                               BlocProvider.of<ReasonBloc>(context).add(
//                                   InsertCategoryReason(
//                                       categoryReason: categoryReasonModelList));
//                               BlocProvider.of<ReasonBloc>(context).add(
//                                   InsertSubCategoryReason(
//                                       subcategoryReason:
//                                           subcategoryReasonPage));
//                               BlocProvider.of<ReasonBloc>(context).add(
//                                   InsertSubSubCategoryReason(
//                                       subsubcategoryReason:
//                                           subsubcategoryReasonModelList));
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
