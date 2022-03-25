import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_state.dart';
import 'package:remindme/bloc/reason/reason_bloc.dart';
import 'package:remindme/bloc/reason/reason_event.dart';
import 'package:remindme/bloc/reason/reason_state.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/icon_select.dart';
import 'package:remindme/pages/setting/add_category_page/single_row_category_icon_list.dart';
import 'package:remindme/pages/setting/add_category_page/single_sub_subcategory.dart';
import 'package:remindme/pages/setting/add_category_page/single_subcategory.dart';
import 'package:remindme/pages/setting/add_reason/category_reason.dart';
import 'package:remindme/pages/setting/add_reason/sub_subcategory_reason_page.dart';
import 'package:remindme/helper/icons_helper.dart';

class SubCategoryEditPage extends StatefulWidget {
  int id;
  int categoryID;
  String categoryType;
  String categoryIconName;
  List<SingleSubcategory> subcategoryEditList = [];
  List<IncomeAndExpenseSubCategoryModel> subcategoryModels = [];
  List<IncomeAndExpenseSubSubCategoryModel> subSubcategoryModels = [];
  List<Reason> subcategoryReasonModelList = [];
  List<SingleSubSubcategory> subsubcategoryEditPage = [];
  final IncomeAndExpenseCategoryModel category;

  SubCategoryEditPage(
      {this.id,
      this.category,
      this.categoryID,
      this.categoryType,
      this.categoryIconName});

  @override
  _SubCategoryEditPageState createState() => _SubCategoryEditPageState();
}

class _SubCategoryEditPageState extends State<SubCategoryEditPage> {
  String subCategoryName;
  String subCategoryIconName;
  int subcategoryID;
  List<IconSelect> subcategoryIconList;
  Icon subCategoryIcon;

  // List<SubSubCategoryReasonPage> subSubcategoryReasonList = [];
  List<Widget> subcategoryList = [];
  List<IncomeAndExpenseSubCategoryModel> subcategoryModels = [];
  int tempSubSubCategoryID = 0;
  int tempSubCategoryID = 0;

  @override
  void initState() {
    super.initState();
    subCategoryIcon = Icon(
      IconsHelper.getIconGuessFavorMaterial(name: widget.categoryIconName),
    );
  }

  Future<void> _showMyDialog() async {
    List<IncomeAndExpenseCategoryModel> categories = [];
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Sub category'),
          contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
          content: BlocBuilder<ReasonBloc, ReasonState>(
            builder: (_, state) {
              int itemCount = subcategoryList.length % 5 == 0
                  ? (subcategoryList.length ~/ 5)
                  : (subcategoryList.length ~/ 5) + 1;
              if (state is CategoryFetchError) {
                return Center(child: Text('Some error happened'));
              }
              if (state is AllSubCategoriesWithCategoryIDFetched) {
                subcategoryList = [];
                subcategoryModels = state.subcategories;
                for (int i = 0; i < state.subcategories.length; i++) {
                  subcategoryList.add(
                    Column(
                      children: [
                        IconSelect(
                          icon: Icon(
                            IconsHelper.getIconGuessFavorMaterial(
                                name: state.subcategories[i].iconName),
                          ),
                          name: state.subcategories[i].iconName,
                          type: 'sub_subcategory_add',
                          id: state.subcategories[i].id,
                          subcategoryName:
                              state.subcategories[i].subcategoryName,
                          subcategoryID: state.subcategories[i].id,
                        ),
                        Text(subcategoryModels[i].subcategoryName)
                      ],
                    ),
                  );
                }

                // BlocProvider.of<ReasonBloc>(context).add(ClearReason());
              }

              // print(state.toString() + 'stateeeeeeeeee');
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => index ==
                          (subcategoryList.length ~/ 5)
                      ? SingleRowIconList(subcategoryList.sublist(
                          5 * index, 5 * index + (subcategoryList.length % 5)))
                      : SingleRowIconList(
                          subcategoryList.sublist(5 * index, 5 * index + 5)),
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
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (_, state) {
        if (state is SubcategoryIconAdded) {
          // subcategoryModels = state.subcategories;
          print('cat idd icon eeee');
          subCategoryIcon =
              Icon(IconsHelper.getIconUsingPrefix(name: state.subcategoryIcon));
          subCategoryName = state.subcategoryName;
          subCategoryIconName = state.subcategoryIcon;
          subcategoryID = state.subcategoryID;
          print('cavczva $subcategoryID');
          // widget.subSubcategoryModels.forEach((element) {
          //   element.subcategoryID = subcategoryID;
          // });
          widget.subcategoryModels
              .firstWhere((element) => element.id == state.tempID)
              .iconName = subCategoryIconName;
          BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        if (state is SubcategoryNameAdded) {
          print('im inside hmm');
          widget.subcategoryModels
              .firstWhere((element) => element.id == state.tempID)
              .subcategoryName = state.subcategoryName;
          subCategoryName = state.subcategoryName;
          subcategoryID = state.subcategoryID;
          // subCategoryIconName = state.
          // widget.subcategoryEditList
          //     .firstWhere((element) => element.id == state.tempID)
          //     . = state.subcategoryName;
          print('yoyoyyoy');
        }
        if (state is SubcategoryNameAddedForSubSubcategory) {
          // widget.subcategoryModels
          //     .firstWhere((element) => element.id == state.tempID)
          //     .subcategoryName = state.subcategoryName;
          subCategoryName = state.subcategoryName;
          subcategoryID = state.subcategoryID;
          // widget.subcategoryEditList
          //     .firstWhere((element) => element.id == state.tempID)
          //     . = state.subcategoryName;
          print('yoyoyyoy');
        }
        if (state is SubSubcategoryNameAdded) {
          widget.subSubcategoryModels
              .firstWhere((element) => element.id == state.tempID)
              .subSubcategoryName = state.subSubcategoryName;

          print('iiiisssss ${state.subCategoryID}');
          widget.subSubcategoryModels
              .firstWhere((element) => element.id == state.tempID)
              .subcategoryID = state.subCategoryID;
        }
        return Card(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Center(
                  child: OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<ReasonBloc>(context).add(
                          GetAllSubCategoriesWithCategoryID(widget.categoryID));
                      _showMyDialog();
                    },
                    child: Text(
                      'Select subcategory',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
              if (subCategoryName != null)
                Text('Selected sub category: $subCategoryName'),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  children: [
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: () {
                          setState(
                            () {
                              subcategoryIconList = IconsHelper.iconsMap.entries
                                  .map((e) => IconSelect(
                                      icon: Icon(e.value),
                                      name: e.key,
                                      type: 'subcategory',
                                      id: tempSubCategoryID))
                                  .toList();
                              widget.subcategoryModels.add(
                                IncomeAndExpenseSubCategoryModel(
                                  id: tempSubCategoryID,
                                  dateType: 'gr',
                                  iconType: 'material',
                                  subcategoryType: widget.categoryType,
                                  iconName: widget.categoryIconName,
                                  categoryID: widget.categoryID,
                                  userID: 1,
                                ),
                              );
                              widget.subcategoryEditList.add(
                                SingleSubcategory(
                                  id: tempSubCategoryID,
                                  subcategoryIconList: subcategoryIconList,
                                  icon: subCategoryIcon,
                                ),
                              );
                            },
                          );

                          tempSubCategoryID++;
                          // BlocProvider.of<ReasonBloc>(context).add(ClearReason());
                        },
                        child: Text('Add sub category')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            widget.subSubcategoryModels.add(
                              IncomeAndExpenseSubSubCategoryModel(
                                id: tempSubSubCategoryID,
                                dateType: 'gr',
                                subSubcategoryType: widget.categoryType,
                                categoryID: widget.categoryID,
                                subcategoryID: subcategoryID,
                                userID: 1,
                              ),
                            );
                            widget.subsubcategoryEditPage.add(
                              SingleSubSubcategory(
                                id: tempSubSubCategoryID,
                                subcategoryID: subcategoryID,
                              ),
                            );
                          });
                          tempSubSubCategoryID++;
                        },
                        child: Text(
                          'Add sub subcategory',
                          style: TextStyle(color: Colors.green),
                        )),
                  ],
                ),
              ),
              if (widget.subcategoryEditList.length > 0)
                Column(
                  children: widget.subcategoryEditList,
                ),
              if (widget.subsubcategoryEditPage.length > 0)
                Column(
                  children: widget.subsubcategoryEditPage,
                ),
            ],
          ),
        );
      },
    );
  }
}
