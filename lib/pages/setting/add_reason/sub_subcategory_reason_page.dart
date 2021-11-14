import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/reason/reason_bloc.dart';
import 'package:remindme/bloc/reason/reason_event.dart';
import 'package:remindme/bloc/reason/reason_state.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/icon_select.dart';
import 'package:remindme/pages/setting/add_category/single_row_category_icon_list.dart';
import 'package:remindme/pages/setting/add_reason/sub_subcategory_reason_page.dart';
import 'package:remindme/pages/setting/add_reason/subcategory_reason_page.dart';
import 'package:remindme/helper/icons_helper.dart';

import 'category_reason.dart';

class SubSubCategoryReasonPage extends StatefulWidget {
  int id;
  int subcategoryID;
  int categoryID;
  List<CategoryReason> subsubcategoryReasonList = [];

  // List<ExpenseAndIncomeSubSubCategoryModel> subsubcategoryModels = [];
  List<Reason> subsubcategoryReasonModelList = [];
  final IncomeAndExpenseCategoryModel category;

  SubSubCategoryReasonPage(
      {this.id, this.category, this.subcategoryID, this.categoryID});

  @override
  _SubSubCategoryReasonPageState createState() =>
      _SubSubCategoryReasonPageState();
}

class _SubSubCategoryReasonPageState extends State<SubSubCategoryReasonPage> {
  String subSubCategoryName;
  int subSubcategoryID;

  // List<SubSubCategoryReasonPage> subSubcategoryReasonList = [];
  List<Widget> subSubcategoryList = [];
  List<IncomeAndExpenseSubSubCategoryModel> subSubcategoryModels = [];

  // int tempSubSubCategoryID = 0;
  int tempSubSubCategoryID = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of(context)
  // }

  Future<void> _showMyDialog() async {
    List<IncomeAndExpenseCategoryModel> categories = [];
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Sub subcategory'),
          contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
          content: BlocBuilder<ReasonBloc, ReasonState>(
            builder: (_, state) {
              if (state is CategoryFetchError) {
                return Center(child: Text('Some error happened'));
              }
              if (state is AllSubSubCategoriesWithSubCategoryIDFetched) {
                // subSubcategoryList = state.;
                subSubcategoryModels = state.subsubcategories;
                // for (int i = 0; i < state.subsubcategories.length; i++) {
                //   subSubcategoryList.add(
                //     Column(
                //       children: [
                //         IconSelect(
                //             Icon(
                //               IconsHelper.getIconGuessFavorMaterial(
                //                   name: state.subcategories[i].iconName),
                //             ),
                //             state.subcategories[i].subcategoryName,
                //             'add_subcategory_reason',
                //             state.subcategories[i].id),
                //         Text(subSubcategoryModels[i].subcategoryName)
                //       ],
                //     ),
                //   );
                // }

                // print(categoryList.length.toString() + ' llllllllllllllllll');

                // return Container(
                //   height: MediaQuery.of(context).size.height,
                //   width: MediaQuery.of(context).size.width,
                //   child: ListView.separated(
                //     shrinkWrap: true,
                //     itemBuilder: (context, index) => index ==
                //             (categoryList.length ~/ 5)
                //         ? SingleRowIconList(categoryList.sublist(
                //             5 * index, 5 * index + (categoryList.length % 5)))
                //         : SingleRowIconList(
                //             categoryList.sublist(5 * index, 5 * index + 5)),
                //     itemCount: itemCount,
                //     separatorBuilder: (context, index) => SizedBox(
                //       height: 5,
                //     ),
                //   ),
                // );
                BlocProvider.of<ReasonBloc>(context).add(ClearReason());
              }

              // print(state.toString() + 'stateeeeeeeeee');
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(subSubcategoryModels[index].subSubcategoryName),
                    onTap: () {
                      BlocProvider.of<ReasonBloc>(context).add(
                        AddReasonSubSubCategoryName(
                            subSubcategoryModels[index].id),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  itemCount: subSubcategoryModels.length,
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
    return BlocBuilder<ReasonBloc, ReasonState>(
      builder: (_, state) {
        if (state is AllSubSubCategoriesWithSubCategoryIDFetched) {
          subSubcategoryModels = state.subsubcategories;
          BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        if (state is ReasonSubSubCategoryAdded) {
          subSubCategoryName = subSubcategoryModels
              .firstWhere((element) => element.id == state.subsubcategoryID)
              .subSubcategoryName;
          subSubcategoryID = state.subsubcategoryID;
          // widget.subsubcategoryReasonModelList.forEach((element) {
          //   element.categoryId = widget.categoryID;
          //   element.subcategoryId = subSubcategoryID;
          // });

          BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        if (state is SubSubCategoryReasonAdded) {
          // print(state.categoryReason.toString() + ' sssssssssssssss');
          // widget.subsubcategoryReasonModelList
          //     .firstWhere((element) => element.id == state.id)
          //     .name = state.subcategoryReason;
          // BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        if (state is SubSubCategoryAmountAdded) {
          // widget.subsubcategoryReasonModelList
          //     .firstWhere((element) => element.id == state.id)
          //     .amount = state.subsubcategoryAmount;
          // BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        if (state is CategoryReasonRemoved) {
          widget.subsubcategoryReasonModelList
              .removeWhere((element) => element.id == state.id);
          widget.subsubcategoryReasonList
              .removeWhere((element) => element.id == state.id);
          BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        return Card(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Center(
                  child: OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<ReasonBloc>(context).add(
                          GetAllSubSubCategoriesWithSubCategoryID(
                              widget.subcategoryID));
                      _showMyDialog();
                    },
                    child: Text(
                      'Select sub subcategory',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
              if (subSubCategoryName != null)
                Text('Selected sub subcategory: $subSubCategoryName'),
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
                          setState(() {
                            widget.subsubcategoryReasonList.add(CategoryReason(
                              type: 'Sub sub category',
                              categoryName: subSubCategoryName,
                              key: UniqueKey(),
                              categoryID: widget.categoryID,
                              id: tempSubSubCategoryID,
                              subcategoryID: widget.subcategoryID,
                              subSubcategoryID: subSubcategoryID,
                            ));
                            widget.subsubcategoryReasonModelList.add(Reason(
                                categoryId: widget.categoryID,
                                id: tempSubSubCategoryID,
                                subcategoryId: widget.subcategoryID,
                                subSubcategoryId: subSubcategoryID));
                          });

                          tempSubSubCategoryID++;
                          // BlocProvider.of<ReasonBloc>(context).add(ClearReason());
                        },
                        child: Text('Add sub sub category reason')),
                  ],
                ),
              ),
              if (widget.subsubcategoryReasonList.length > 0)
                Column(
                  children: widget.subsubcategoryReasonList,
                ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 15, top: 10),
              //   child: Row(
              //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
              //         width: MediaQuery.of(context).size.width / 2,
              //         padding: EdgeInsets.only(top: 5),
              //         child: TextField(
              //           // readOnly: true,
              //           // enabled: false,
              //           cursorHeight: 25,
              //           controller: reasonNameController,
              //           decoration: InputDecoration(
              //               border: OutlineInputBorder(),
              //               labelText: 'Reason',
              //               labelStyle: TextStyle(
              //                 fontSize: 17,
              //                 color: Colors.green,
              //               ),
              //               contentPadding: EdgeInsets.only(left: 20)),
              //           // onChanged: (text) => {name = text},
              //         ),
              //       ),
              //       Expanded(
              //         child: Align(
              //           // alignment: Alignment.topCenter,
              //           child: InkWell(
              //             borderRadius: BorderRadius.circular(100),
              //             onTap: () {},
              //             child: Ink(
              //               padding: EdgeInsets.all(5),
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(100),
              //               ),
              //               child: Icon(
              //                 Icons.minimize_rounded,
              //                 color: Colors.red,
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
