import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_event.dart';
import 'package:remindme/bloc/category/category_state.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/pages/add_transaction/icon_select.dart';
import 'package:remindme/pages/home/homepage/homepage.dart';
import 'package:remindme/pages/setting/category/add_category_page/single_row_category_icon_list.dart';
import 'package:remindme/pages/setting/category/add_category_page/sub_subcategory.dart';
import 'package:remindme/pages/setting/add_subcategory/subcategory.dart';
import 'package:remindme/helper/icons_helper.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class ExpenseAndIncomeCategoryInsert extends StatefulWidget {
  static const routeName = 'CategoryInsert';

  @override
  _ExpenseAndIncomeCategoryInsertState createState() =>
      _ExpenseAndIncomeCategoryInsertState();
}

class _ExpenseAndIncomeCategoryInsertState
    extends State<ExpenseAndIncomeCategoryInsert> {
  // int subcategoryID = 1;
  // int subSubcategoryID = 1;
  String categoryName;

  // String categoryType;
  String categoryIconName;
  String categoryIconType;
  Color selectedCategoryColor;
  TextEditingController nameController = TextEditingController();
  bool switchValue = false;
  bool iconSwitchValue = false;
  Widget subCategoryWidget;
  Widget iconSubcategoryWidget;
  Icon categoryIcon;
  Icon subCategoryIcon;

  // List<ExpenseAndIncomeCategoryModel> categories = [];
  List<IncomeAndExpenseSubCategoryModel> subcategories = [];
  List<List<IncomeAndExpenseSubSubCategoryModel>> subSubcategories = [];
  String categoryType;
  List<Subcategory> subcategoryWidgets = [];

  // List<SubSubcategory> subSubcategoryWidgets = [];
  List<IconSelect> iconList;
  List<IconSelect> subcategoryIconList;
  int tempSubcategoryID = 0;

  @override
  void initState() {
    super.initState();
    iconList = IconsHelper.iconsMap.entries
        .map((e) => IconSelect(
            icon: Icon(e.value), name: e.key, type: 'category', id: -1))
        .toList();

    // subcategoryIconList = [...iconList];
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        int itemCount = iconList.length % 5 == 0
            ? (iconList.length ~/ 5)
            : (iconList.length ~/ 5) + 1;
        return AlertDialog(
          title: Text('Select Icon for category'),
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          content: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ResponsiveGridList(
                minItemsPerRow: 4,
                minItemWidth: 40,
                children: iconList,
              )
              // ListView.separated(
              //   itemBuilder: (context, index) => index == (iconList.length ~/ 5)
              //       ? SingleRowIconList(iconList.sublist(
              //           5 * index, 5 * index + (iconList.length % 5)))
              //       : SingleRowIconList(
              //           iconList.sublist(5 * index, 5 * index + 5)),
              //   itemCount: itemCount,
              //   separatorBuilder: (context, index) => SizedBox(
              //     height: 5,
              //   ),
              // ),
              ),
          // actions: <Widget>[
          //   TextButton(
          //     child: Text(
          //       'Ok',
          //       style: TextStyle(color: Colors.green),
          //     ),
          //     onPressed: () {
          //       setState(() {});
          //       Navigator.of(context).pop();
          //     },
          //     style: ButtonStyle(
          //       tapTargetSize:
          //       MaterialTapTargetSize.shrinkWrap,
          //     ),
          //   ),
          // ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Add another category'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green.shade500),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.green),
                            ),
                            Row(
                              children: [
                                Container(
                                  // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.only(top: 5),
                                  child: TextField(
                                    // readOnly: true,
                                    // enabled: false,
                                    // cursorHeight: 25,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.green, width: 0.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.green, width: 0.75),
                                        ),
                                        // labelText: 'Category name',
                                        labelStyle: TextStyle(
                                          // fontSize: 16,
                                          color: Colors.green,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(left: 20)),
                                    onChanged: (text) => categoryName = text,
                                  ),
                                ),
                                Expanded(
                                    child: Center(
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    splashRadius: 0.1,
                                    color: Colors.red,
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {},
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  // Text('Icon'),
                                  // SizedBox(width: 10,),
                                  // categoryIcon ?? Container(),
                                  // if (categoryIcon != null) categoryIcon,
                                  TextButton(
                                    onPressed: () {
                                      _showMyDialog();
                                    },
                                    child: Text(
                                      'Choose Icon',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    style: ButtonStyle(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Text('Add sub category to the above category'),
                            //     Switch(
                            //       value: switchValue,
                            //       onChanged: (value) {
                            //         setState(
                            //           () {
                            //             switchValue = value;
                            //           },
                            //         );
                            //       },
                            //     )
                            //   ],
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      _showMyDialog();
                                    },
                                    child: Text(
                                      'Choose category type',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    style: ButtonStyle(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ),
                                  // Text('Category type'),
                                  // Text(categoryType ?? 'Not selected'),
                                  // DropdownButton<String>(
                                  //   // value: 'select',
                                  //   // icon: const Icon(Icons.arrow_downward),
                                  //   // iconSize: 24,
                                  //   // elevation: 16,
                                  //   style:
                                  //       const TextStyle(color: Colors.deepPurple),
                                  //   // underline: Container(
                                  //   //   height: 2,
                                  //   //   color: Colors.deepPurpleAccent,
                                  //   // ),
                                  //   onChanged: (String newValue) {
                                  //     setState(() {
                                  //       categoryType = newValue;
                                  //     });
                                  //   },
                                  //   items: <String>['Expense', 'Income', 'both']
                                  //       .map((String value) {
                                  //     return DropdownMenuItem<String>(
                                  //       value: value,
                                  //       child: Text(value),
                                  //     );
                                  //   }).toList(),
                                  // )
                                ],
                              ),
                            ),
                            // Divider(
                            //   height: 1,
                            //   color: Colors.grey,thickness: 0.5,
                            // ),
                            Card(
                              // elevation: 2,
                              child: Container(
                                color: Colors.green.shade50.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Subcategory for category',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.green),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            padding: EdgeInsets.only(top: 5),
                                            child: TextField(
                                              // readOnly: true,
                                              // enabled: false,
                                              // cursorHeight: 25,
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.green,
                                                        width: 0.5),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.green,
                                                        width: 0.75),
                                                  ),
                                                  // labelText: 'Subcategory name',
                                                  labelStyle: TextStyle(
                                                    // fontSize: 16,
                                                    color: Colors.green,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 20)),
                                              onChanged: (text) =>
                                                  categoryName = text,
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: IconButton(
                                                padding: EdgeInsets.zero,
                                                splashRadius: 0.1,
                                                color: Colors.red.shade300,
                                                icon: Icon(Icons.cancel),
                                                onPressed: () {},
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            // Text('Icon'),
                                            // SizedBox(width: 10,),
                                            // categoryIcon ?? Container(),
                                            // if (categoryIcon != null) categoryIcon,
                                            TextButton(
                                              onPressed: () {
                                                _showMyDialog();
                                              },
                                              child: Text(
                                                'Change Icon',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                              style: ButtonStyle(
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Subcategory for subcategory',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.green),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            padding: EdgeInsets.only(top: 5),
                                            child: TextField(
                                              // readOnly: true,
                                              // enabled: false,
                                              // cursorHeight: 25,
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.green,
                                                        width: 0.5),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.green,
                                                        width: 0.75),
                                                  ),
                                                  // labelText: 'Sub Subcategory name',
                                                  labelStyle: TextStyle(
                                                    // fontSize: 16,
                                                    color: Colors.green,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 20)),
                                              onChanged: (text) =>
                                                  categoryName = text,
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Center(
                                                  child: IconButton(
                                                padding: EdgeInsets.zero,
                                                splashRadius: 0.1,
                                                color: Colors.red.shade300,
                                                icon: Icon(Icons.cancel),
                                                onPressed: () {},
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            // Text('Icon'),
                                            // SizedBox(width: 10,),
                                            // categoryIcon ?? Container(),
                                            // if (categoryIcon != null) categoryIcon,
                                            TextButton(
                                              onPressed: () {
                                                _showMyDialog();
                                              },
                                              child: Text(
                                                'Change Icon',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                              style: ButtonStyle(
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: OutlinedButton(
                                          onPressed: () {
                                            print(tempSubcategoryID.toString() +
                                                ' before');
                                            setState(() {
                                              subcategories.add(
                                                IncomeAndExpenseSubCategoryModel(
                                                  userID: 1,
                                                  id: tempSubcategoryID,
                                                  dateType: 'gr',
                                                  iconType: 'material',
                                                  subcategoryType: categoryType,
                                                  iconName: categoryIconName,
                                                ),
                                              );
                                              subcategoryIconList = IconsHelper
                                                  .iconsMap.entries
                                                  .map((e) => IconSelect(
                                                      icon: Icon(e.value),
                                                      name: e.key,
                                                      type: 'subcategory',
                                                      id: tempSubcategoryID))
                                                  .toList();
                                              subcategoryWidgets
                                                  .add(Subcategory(
                                                id: tempSubcategoryID,
                                                key: UniqueKey(),
                                                iconList: subcategoryIconList,
                                              ));
                                            });
                                            tempSubcategoryID++;
                                          },
                                          child: Text(
                                              'Add Subcategory for subcategory'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Center(
                              child: OutlinedButton(
                                onPressed: () {
                                  print(
                                      tempSubcategoryID.toString() + ' before');
                                  setState(() {
                                    subcategories.add(
                                      IncomeAndExpenseSubCategoryModel(
                                        userID: 1,
                                        id: tempSubcategoryID,
                                        dateType: 'gr',
                                        iconType: 'material',
                                        subcategoryType: categoryType,
                                        iconName: categoryIconName,
                                      ),
                                    );
                                    subcategoryIconList = IconsHelper
                                        .iconsMap.entries
                                        .map((e) => IconSelect(
                                            icon: Icon(e.value),
                                            name: e.key,
                                            type: 'subcategory',
                                            id: tempSubcategoryID))
                                        .toList();
                                    subcategoryWidgets.add(Subcategory(
                                      id: tempSubcategoryID,
                                      key: UniqueKey(),
                                      iconList: subcategoryIconList,
                                    ));
                                  });
                                  tempSubcategoryID++;
                                },
                                child: Text('Add Subcategory for category'),
                                // style: ButtonStyle(
                                //     backgroundColor:
                                //     MaterialStateProperty.all<Color>(
                                //         Colors.green),
                                //     foregroundColor:
                                //     MaterialStateProperty.all<Color>(
                                //         Colors.white)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    if (subcategories.length > 0)
                      Column(
                        children: subcategoryWidgets,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          child: Text(
                            'Save',
                            // style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () {
                            DateTime now = DateTime.now();

                            DateFormat dateFormat = DateFormat("dd-MM-yy");
                            DateFormat timeFormat = DateFormat("HH:mm:ss");
                            String currentDate = dateFormat.format(now);
                            String currentTime = timeFormat.format(now);
                            subSubcategories.forEach((element) {
                              element.forEach((element) {
                                element.timeAdded = currentTime;
                                element.dateAdded = currentDate;
                                element.dateType = 'gr';
                                element.subSubcategoryType = categoryType;
                              });
                            });
                            subcategories.forEach((element) {
                              element.dateAdded = currentDate;
                              element.timeAdded = currentTime;
                              element.dateType = 'gr';
                              element.subcategoryType = categoryType;
                            });
                            BlocProvider.of<CategoryBloc>(context).add(
                              InsertCategory(
                                  category: IncomeAndExpenseCategoryModel(
                                      categoryType: categoryType,
                                      dateType: 'gr',
                                      timeAdded: currentTime,
                                      dateAdded: currentDate,
                                      iconName: categoryIconName,
                                      iconType: 'material',
                                      categoryName: categoryName,
                                      userID: 001),
                                  subcategories: subcategories,
                                  subSubcategories: subSubcategories),
                            );
                            BlocProvider.of<CategoryBloc>(context)
                                .add(CheckInitialization());
                            Navigator.pop(context);
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
                    )
                  ],
                ),
              ),
            ],
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
