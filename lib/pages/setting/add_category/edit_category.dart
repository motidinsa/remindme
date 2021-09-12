import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_event.dart';
import 'package:remindme/bloc/reason/reason_bloc.dart';
import 'package:remindme/bloc/reason/reason_event.dart';
import 'package:remindme/bloc/reason/reason_state.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/icon_select.dart';
import 'package:remindme/pages/setting/add_category/expense_category.dart';
import 'package:remindme/pages/setting/add_category/single_row_category_icon_list.dart';
import 'package:remindme/pages/setting/add_reason/sub_subcategory_reason_page.dart';
import 'package:remindme/pages/setting/add_reason/subcategory_reason_page.dart';
import 'package:remindme/utility/icons_helper.dart';
import 'package:intl/src/intl/date_format.dart';

import 'edit_subcategory.dart';

class EditCategory extends StatefulWidget {
  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  int tempCategoryID = 0;
  int tempSubCategoryID = 0;
  String subCategoryName;
  TextEditingController reasonNameController = TextEditingController();
  bool isCategorySelected = false;
  bool isSubCategorySelected = false;
  String categoryName;
  String categoryIconName;
  String categorytype;
  int categoryID;
  List<ExpenseAndIncomeCategoryModel> categoryModels = [];

  // List<Widget> categoryAndSubcategoryReasonList = [];
  List<Widget> categoryList = [];

  // List<Reason> categoryReasonModelList = [];
  List<List<Reason>> subsubcategoryReasonModelList = [];

  // List<CategoryReason> categoryReasonList = [];
  List<SubCategoryEditPage> subcategoryEditPage = [];
  List<List<SubSubCategoryReasonPage>> subsubcategoryReasonPage = [];
  List<List<ExpenseAndIncomeSubCategoryModel>> allSubcategories = [];
  List<List<ExpenseAndIncomeSubSubCategoryModel>> allSubSubcategories = [];

  // List<SubCategoryReasonPage> subcategoryWidgets = [];
  @override
  void initState() {
    super.initState();
  }

  Future<void> _showMyDialog() async {
    List<ExpenseAndIncomeCategoryModel> categories = [];
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select category'),
          contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
          content: BlocBuilder<ReasonBloc, ReasonState>(
            builder: (_, state) {
              int itemCount = categoryList.length % 5 == 0
                  ? (categoryList.length ~/ 5)
                  : (categoryList.length ~/ 5) + 1;
              if (state is CategoryFetchError) {
                return Center(child: Text('Some error happened'));
              }
              if (state is AllCategoriesFetched) {
                categoryList = [];
                categoryModels = state.categories;
                for (int i = 0; i < state.categories.length; i++) {
                  categoryList.add(
                    Column(
                      children: [
                        IconSelect(
                            icon: Icon(
                              IconsHelper.getIconGuessFavorMaterial(
                                  name: state.categories[i].iconName),
                            ),
                            name: state.categories[i].categoryName,
                            type: 'add_reason',
                            id: state.categories[i].id),
                        Text(categoryModels[i].categoryName)
                      ],
                    ),
                  );
                }

                BlocProvider.of<ReasonBloc>(context).add(ClearReason());
              }

              // print(state.toString() + 'stateeeeeeeeee');
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      index == (categoryList.length ~/ 5)
                          ? SingleRowIconList(categoryList.sublist(
                              5 * index, 5 * index + (categoryList.length % 5)))
                          : SingleRowIconList(
                              categoryList.sublist(5 * index, 5 * index + 5)),
                  itemCount: itemCount,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Category'),
        ),
        body: BlocBuilder<ReasonBloc, ReasonState>(
          builder: (_, state) {
            if (state is ReasonCategoryAdded) {
              categoryName = categoryModels
                  .firstWhere((element) => element.id == state.categoryID)
                  .categoryName;
              categoryID = state.categoryID;
              categoryIconName = categoryModels
                  .firstWhere((element) => element.id == state.categoryID)
                  .iconName;
              categorytype = categoryModels
                  .firstWhere((element) => element.id == state.categoryID)
                  .categoryType;
              subcategoryEditPage.forEach((element) {
                element.categoryID = categoryID;
              });

              BlocProvider.of<ReasonBloc>(context).add(ClearReason());
            }

            return ListView(
              // shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Center(
                    child: OutlinedButton(
                      onPressed: () {
                        BlocProvider.of<ReasonBloc>(context)
                            .add(GetAllCategories());
                        _showMyDialog();
                      },
                      child: Text(
                        'Select category',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                if (categoryName != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text('Selected category: $categoryName'),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Row(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            setState(() {
                              subcategoryEditPage.add(
                                SubCategoryEditPage(
                                  categoryID: categoryID,
                                  id: tempSubCategoryID,
                                  categoryType: categorytype,
                                  categoryIconName: categoryIconName,
                                ),
                              );
                            });
                            tempSubCategoryID++;
                          },
                          child: Text(
                            'Add subcategory',
                            style: TextStyle(color: Colors.green),
                          )),
                    ],
                  ),
                ),
                if (subcategoryEditPage.length > 0)
                  Column(
                    children: subcategoryEditPage,
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        child: Align(
                          // alignment: Alignment.centerRight,
                          child: OutlinedButton(
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.green),
                            ),
                            onPressed: () {
                              DateTime now = DateTime.now();

                              DateFormat dateFormat = DateFormat("dd-MM-yy");
                              DateFormat timeFormat = DateFormat("HH:mm:ss");
                              String currentDate = dateFormat.format(now);
                              String currentTime = timeFormat.format(now);
                              // categoryReasonModelList.forEach((element) {
                              //   element.date = currentDate;
                              //   element.time = currentTime;
                              // });
                              subcategoryEditPage.forEach((element) {
                                element.subcategoryModels.forEach((element) {
                                  element.dateAdded = currentDate;
                                  element.timeAdded = currentTime;
                                });
                                allSubcategories.add(element.subcategoryModels);
                              });
                              subcategoryEditPage.forEach((element) {
                                element.subSubcategoryModels.forEach((element) {
                                  element.dateAdded = currentDate;
                                  element.timeAdded = currentTime;
                                });
                                allSubSubcategories
                                    .add(element.subSubcategoryModels);
                              });

                              BlocProvider.of<CategoryBloc>(context).add(
                                  UpdateCategory(
                                      subcategories: allSubcategories,
                                      subSubcategories: allSubSubcategories));

                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
