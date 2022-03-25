import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../getx_controller/category/add_category_controller.dart';
import 'add_category.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({Key key}) : super(key: key);

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  @override
  Widget build(BuildContext context) {
    final AddCategoryController addCategoryController =
        Get.put(AddCategoryController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: GetBuilder(
            init: addCategoryController,
            builder: (_) => ListView.builder(
              // shrinkWrap: true,
              itemBuilder: (context, index) => index ==
                      addCategoryController.addCategoryModels.length - 1
                  ? Column(
                      children: [
                        AddCategory(
                          addCategoryModel:
                              addCategoryController.addCategoryModels[index],
                          hasDeleteCategoryButton:
                              addCategoryController.addCategoryModels.length > 1
                                  ? true
                                  : false,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // FocusScope.of(context).unfocus();
                                    addCategoryController.addCategory();
                                  },
                                  child: const Text('Add another category'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green.shade500),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  child: Text(
                                    'Save',
                                    // style: TextStyle(color: Colors.green),
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    // DateTime now = DateTime.now();
                                    //
                                    // DateFormat dateFormat = DateFormat("dd-MM-yy");
                                    // DateFormat timeFormat = DateFormat("HH:mm:ss");
                                    // String currentDate = dateFormat.format(now);
                                    // String currentTime = timeFormat.format(now);
                                    // subSubcategories.forEach((element) {
                                    //   element.forEach((element) {
                                    //     element.timeAdded = currentTime;
                                    //     element.dateAdded = currentDate;
                                    //     element.dateType = 'gr';
                                    //     element.subSubcategoryType = categoryType;
                                    //   });
                                    // });
                                    // subcategories.forEach((element) {
                                    //   element.dateAdded = currentDate;
                                    //   element.timeAdded = currentTime;
                                    //   element.dateType = 'gr';
                                    //   element.subcategoryType = categoryType;
                                    // });
                                    // BlocProvider.of<CategoryBloc>(context).add(
                                    //   InsertCategory(
                                    //       category: IncomeAndExpenseCategoryModel(
                                    //           categoryType: categoryType,
                                    //           dateType: 'gr',
                                    //           timeAdded: currentTime,
                                    //           dateAdded: currentDate,
                                    //           iconName: categoryIconName,
                                    //           iconType: 'material',
                                    //           categoryName: categoryName,
                                    //           userID: 001),
                                    //       subcategories: subcategories,
                                    //       subSubcategories: subSubcategories),
                                    // );
                                    // BlocProvider.of<CategoryBloc>(context)
                                    //     .add(CheckInitialization());
                                    // Navigator.pop(context);
                                    // Navigator.pop(context) ;
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => HomePage(
                                    //                 tabController: TabController(
                                    //               length: 2,
                                    //             ))));
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : AddCategory(
                      addCategoryModel:
                          addCategoryController.addCategoryModels[index],
                      hasDeleteCategoryButton:
                          addCategoryController.addCategoryModels.length > 1
                              ? true
                              : false,
                    ),
              itemCount: addCategoryController.addCategoryModels.length,
            ),
          )

          // BlocBuilder<CategoryBloc, CategoryState>(
          //   builder: (_, state) {
          //     // if (state is CategoryNameAdded) {
          //     //   categoryName = state.categoryName;
          //     // }
          //     // if (state is CategoryIconAdded) {
          //     //   categoryIcon =
          //     //       Icon(IconsHelper.getIconUsingPrefix(name: state.iconName));
          //     //   print(state.iconName);
          //     //   categoryIconName = state.iconName;
          //     //   categoryIconType = 'material';
          //     //   BlocProvider.of<CategoryBloc>(context).add(ClearCategory());
          //     // }
          //     // if (state is SubcategoryIconAdded) {
          //     //   print('sub icccccccccccccccccccccc');
          //     //   subcategories[state.tempID].iconName = state.subcategoryIcon;
          //     //   subcategoryWidgets[state.tempID].icon = Icon(
          //     //       IconsHelper.getIconUsingPrefix(name: state.subcategoryIcon));
          //     //
          //     //   BlocProvider.of<CategoryBloc>(context).add(ClearCategory());
          //     // }
          //     // if (state is SubcategoryNameAdded) {
          //     //   subcategories[state.tempID].subcategoryName =
          //     //       state.subcategoryName;
          //     //   print(subcategories[state.tempID].subcategoryName);
          //     //   BlocProvider.of<CategoryBloc>(context).add(ClearCategory());
          //     //   // print(state.tempID);
          //     // }
          //     // if (state is SubSubcategoryAdded) {
          //     //   // subcategories[state.categoryID].subcategories.add(
          //     //   //     ExpenseAndIncomeSubSubCategoryModel(
          //     //   //         dateAdded: 'now',
          //     //   //         timeAdded: 'now',
          //     //   //         dateType: 'gr',
          //     //   //         categoryID: state.categoryID,
          //     //   //         id: state.id,
          //     //   //         subSubcategoryType: categoryType));
          //     //   // subSubcategories.add(
          //     //   //   ExpenseAndIncomeSubSubCategoryModel(
          //     //   //       id: state.id,
          //     //   //       dateAdded: 'now',
          //     //   //       timeAdded: 'now',
          //     //   //       dateType: 'gr',
          //     //   //       // categoryID: state.categoryID,
          //     //   //       subcategoryID: state.categoryID,
          //     //   //       subSubcategoryType: categoryType),
          //     //   state.isUpdate
          //     //       ? subSubcategories[state.categoryID] = state.subcategories
          //     //       : subSubcategories.add(state.subcategories);
          //     //   // if (subSubcategories.length == 0) {
          //     //   //   subSubcategories.add(state.subcategories);
          //     //   // } else {
          //     //   //   subSubcategories[state.categoryID] = state.subcategories;
          //     //   // }
          //     //
          //     //   BlocProvider.of<CategoryBloc>(context).add(ClearCategory());
          //     //   // print(state.tempID);
          //     // }
          //     // if (state is SubcategoryRemoved) {
          //     //   int index = subcategoryWidgets.indexOf(subcategoryWidgets
          //     //       .where((element) => element.id == state.id)
          //     //       .first);
          //     //   print(index.toString() + ' r');
          //     //
          //     //   subcategories.removeAt(index);
          //     //   subcategoryWidgets.removeAt(index);
          //     //   // BlocProvider.of<CategoryBloc>(context).add(Clear());
          //     //   for (int i = 0; i < subcategories.length; i++) {
          //     //     // subcategories[i].id = i;
          //     //     subcategoryWidgets[i].id = i;
          //     //   }
          //     //   tempSubcategoryID = subcategoryWidgets.length;
          //     //   BlocProvider.of<CategoryBloc>(context).add(ClearCategory());
          //     //   // print(state.tempID);
          //     //   // print(subcategories[0].subcategoryName);
          //     // }
          //     // if (state is SubSubcategoryRemoved) {
          //     //   // int index = subSubcategories.indexOf(subSubcategories
          //     //   //     .where((element) =>
          //     //   //         element.subcategoryID == state.id &&
          //     //   //         element.categoryID == state.categoryID)
          //     //   //     .first);
          //     //   // subcategories[state.categoryID].subcategories.removeAt(index);
          //     //   subSubcategories[state.categoryID].removeAt(state.id);
          //     //   // subSubcategories.removeAt(index);
          //     //   BlocProvider.of<CategoryBloc>(context).add(ClearCategory());
          //     // }
          //     // if (state is SubSubcategoryNameAdded) {
          //     //   print(' sub r0');
          //     //   // int index = subSubcategories.indexOf(subSubcategories
          //     //   //     .where((element) =>
          //     //   //         element.id == state.tempID &&
          //     //   //         element.subcategoryID == state.tempCategoryID)
          //     //   //     .first);
          //     //   // print(len.toString()+' len r');
          //     //   // print(state.tempCategoryID.toString()+' cat');
          //     //   // print(state.tempID.toString()+' idd');
          //     //   // subSubcategories[state.tempCategoryID][state.tempID]
          //     //   //     .subSubcategoryName =
          //     //   //     state.subSubcategoryName;
          //     //   print('temp id ${state.tempID}');
          //     //   print('temp catid ${state.tempCategoryID}');
          //     //   print(subSubcategories.length);
          //     //   print(subSubcategories[state.tempCategoryID].length);
          //     //
          //     //   subSubcategories[state.tempCategoryID][state.tempID]
          //     //       .subSubcategoryName = state.subSubcategoryName;
          //     //   // subSubcategories[index].subSubcategoryName =
          //     //   //     state.subSubcategoryName;
          //     //   BlocProvider.of<CategoryBloc>(context).add(ClearCategory());
          //     // }
          //     print(tempSubcategoryID);
          //     return ListView(
          //       children: [
          //         Card(
          //           child: Padding(
          //             padding: const EdgeInsets.only(left: 20, top: 10),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
          //                   width: MediaQuery.of(context).size.width / 2,
          //                   padding: EdgeInsets.only(top: 5),
          //                   child: TextField(
          //                     // readOnly: true,
          //                     // enabled: false,
          //                     cursorHeight: 25,
          //                     controller: nameController,
          //                     decoration: InputDecoration(
          //                         border: OutlineInputBorder(),
          //                         labelText: 'Category name',
          //                         labelStyle: TextStyle(
          //                           fontSize: 17,
          //                           color: Colors.green,
          //                         ),
          //                         contentPadding: EdgeInsets.only(left: 20)),
          //                     onChanged: (text) => categoryName = text,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 10,
          //                 ),
          //                 Container(
          //                   // key: UniqueKey(),
          //                   width: MediaQuery.of(context).size.width / 2,
          //                   margin: EdgeInsets.only(left: 10),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                     children: [
          //                       Text('Icon'), categoryIcon ?? Container(),
          //                       // if (categoryIcon != null) categoryIcon,
          //                       OutlinedButton(
          //                         onPressed: () {
          //                           _showMyDialog();
          //                         },
          //                         child: Text(
          //                           'Choose',
          //                           style: TextStyle(color: Colors.green),
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 // Row(
          //                 //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                 //   children: [
          //                 //     Text('Add sub category to the above category'),
          //                 //     Switch(
          //                 //       value: switchValue,
          //                 //       onChanged: (value) {
          //                 //         setState(
          //                 //           () {
          //                 //             switchValue = value;
          //                 //           },
          //                 //         );
          //                 //       },
          //                 //     )
          //                 //   ],
          //                 // ),
          //                 Container(
          //                   // width: MediaQuery.of(context).size.width / 2,
          //                   margin: EdgeInsets.only(left: 10),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                     children: [
          //                       Text('Category type'),
          //                       Text(categoryType ?? 'Not selected'),
          //                       DropdownButton<String>(
          //                         // value: 'select',
          //                         // icon: const Icon(Icons.arrow_downward),
          //                         // iconSize: 24,
          //                         // elevation: 16,
          //                         style:
          //                             const TextStyle(color: Colors.deepPurple),
          //                         // underline: Container(
          //                         //   height: 2,
          //                         //   color: Colors.deepPurpleAccent,
          //                         // ),
          //                         onChanged: (String newValue) {
          //                           setState(() {
          //                             categoryType = newValue;
          //                           });
          //                         },
          //                         items: <String>['Expense', 'Income', 'both']
          //                             .map((String value) {
          //                           return DropdownMenuItem<String>(
          //                             value: value,
          //                             child: Text(value),
          //                           );
          //                         }).toList(),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //
          //                 Center(
          //                   child: ElevatedButton(
          //                     onPressed: () {
          //                       print(tempSubcategoryID.toString() + ' before');
          //                       setState(() {
          //                         subcategories.add(
          //                           IncomeAndExpenseSubCategoryModel(
          //                             userID: 1,
          //                             id: tempSubcategoryID,
          //                             dateType: 'gr',
          //                             iconType: 'material',
          //                             subcategoryType: categoryType,
          //                             iconName: categoryIconName,
          //                           ),
          //                         );
          //                         subcategoryIconList = IconsHelper
          //                             .iconsMap.entries
          //                             .map((e) => IconSelect(
          //                                 icon: Icon(e.value),
          //                                 name: e.key,
          //                                 type: 'subcategory',
          //                                 id: tempSubcategoryID))
          //                             .toList();
          //                         subcategoryWidgets.add(Subcategory(
          //                           id: tempSubcategoryID,
          //                           key: UniqueKey(),
          //                           iconList: subcategoryIconList,
          //                         ));
          //                       });
          //                       tempSubcategoryID++;
          //                     },
          //                     child: Text('Add Subcategory'),
          //                     style: ButtonStyle(
          //                         backgroundColor:
          //                         MaterialStateProperty.all<Color>(
          //                             Colors.green),
          //                         foregroundColor:
          //                         MaterialStateProperty.all<Color>(
          //                             Colors.white)),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         if (subcategories.length > 0)
          //           Column(
          //             children: subcategoryWidgets,
          //           ),
          //         Padding(
          //           padding: const EdgeInsets.only(right: 10),
          //           child: Align(
          //             alignment: Alignment.centerRight,
          //             child: OutlinedButton(
          //               child: Text(
          //                 'Save',
          //                 style: TextStyle(color: Colors.green),
          //               ),
          //               onPressed: () {
          //                 DateTime now = DateTime.now();
          //
          //                 DateFormat dateFormat = DateFormat("dd-MM-yy");
          //                 DateFormat timeFormat = DateFormat("HH:mm:ss");
          //                 String currentDate = dateFormat.format(now);
          //                 String currentTime = timeFormat.format(now);
          //                 subSubcategories.forEach((element) {
          //                   element.forEach((element) {
          //                     element.timeAdded = currentTime;
          //                     element.dateAdded = currentDate;
          //                     element.dateType = 'gr';
          //                     element.subSubcategoryType = categoryType;
          //                   });
          //                 });
          //                 subcategories.forEach((element) {
          //                   element.dateAdded = currentDate;
          //                   element.timeAdded = currentTime;
          //                   element.dateType = 'gr';
          //                   element.subcategoryType = categoryType;
          //                 });
          //                 BlocProvider.of<CategoryBloc>(context).add(
          //                   InsertCategory(
          //                       category: IncomeAndExpenseCategoryModel(
          //                           categoryType: categoryType,
          //                           dateType: 'gr',
          //                           timeAdded: currentTime,
          //                           dateAdded: currentDate,
          //                           iconName: categoryIconName,
          //                           iconType: 'material',
          //                           categoryName: categoryName,
          //                           userID: 001),
          //                       subcategories: subcategories,
          //                       subSubcategories: subSubcategories),
          //                 );
          //                 BlocProvider.of<CategoryBloc>(context)
          //                     .add(CheckInitialization());
          //                 Navigator.pop(context);
          //                 // Navigator.pop(context) ;
          //                 // Navigator.pushReplacement(
          //                 //     context,
          //                 //     MaterialPageRoute(
          //                 //         builder: (context) => HomePage(
          //                 //                 tabController: TabController(
          //                 //               length: 2,
          //                 //             ))));
          //               },
          //             ),
          //           ),
          //         )
          //       ],
          //     );
          //   },
          // ),
          ),
    );
  }
}
