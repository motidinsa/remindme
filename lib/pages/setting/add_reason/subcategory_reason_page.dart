import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/reason/reason_bloc.dart';
import 'package:remindme/bloc/reason/reason_event.dart';
import 'package:remindme/bloc/reason/reason_state.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/icon_select.dart';
import 'package:remindme/pages/setting/add_category_page/single_row_category_icon_list.dart';
import 'package:remindme/pages/setting/add_reason/sub_subcategory_reason_page.dart';
import 'package:remindme/helper/icons_helper.dart';

import 'category_reason.dart';

class SubCategoryReasonPage extends StatefulWidget {
  int id;
  int categoryID;
  List<CategoryReason> subcategoryReasonList = [];
  List<IncomeAndExpenseSubCategoryModel> subcategoryModels = [];
  List<Reason> subcategoryReasonModelList = [];
  List<SubSubCategoryReasonPage> subsubcategoryReasonPage = [];
  final IncomeAndExpenseCategoryModel category;

  SubCategoryReasonPage({this.id, this.category, this.categoryID});

  @override
  _SubCategoryReasonPageState createState() => _SubCategoryReasonPageState();
}

class _SubCategoryReasonPageState extends State<SubCategoryReasonPage> {
  String subCategoryName;
  int subcategoryID;

  // List<SubSubCategoryReasonPage> subSubcategoryReasonList = [];
  List<Widget> subcategoryList = [];
  List<IncomeAndExpenseSubCategoryModel> subcategoryModels = [];
  int tempSubSubCategoryID = 0;
  int tempSubCategoryID = 0;

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
                            name: state.subcategories[i].subcategoryName,
                            type: 'add_subcategory_reason',
                            id: state.subcategories[i].id),
                        Text(subcategoryModels[i].subcategoryName)
                      ],
                    ),
                  );
                }

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
    return BlocBuilder<ReasonBloc, ReasonState>(
      builder: (_, state) {
        if (state is AllSubCategoriesWithCategoryIDFetched) {
          subcategoryModels = state.subcategories;
          BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        if (state is ReasonSubCategoryAdded) {
          subCategoryName = subcategoryModels
              .firstWhere((element) => element.id == state.subcategoryID)
              .subcategoryName;
          subcategoryID = state.subcategoryID;
          // widget.subcategoryReasonModelList.forEach((element) {
          //   element.categoryId = widget.categoryID;
          //   element.subcategoryId = subcategoryID;
          // });

          BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        if (state is SubCategoryReasonAdded) {
          // print(state.categoryReason.toString() + ' sssssssssssssss');
          // if(widget.subsubcategoryReasonPage.length>0)
          // widget.subcategoryReasonModelList
          //     .firstWhere((element) => element.id == state.id)
          //     .name = state.subcategoryReason;
          // BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        if (state is SubCategoryAmountAdded) {
          // widget.subcategoryReasonModelList
          //     .firstWhere((element) => element.id == state.id)
          //     .amount = state.subcategoryAmount;
          // BlocProvider.of<ReasonBloc>(context).add(ClearReason());
        }
        if (state is CategoryReasonRemoved) {
          widget.subcategoryReasonModelList
              .removeWhere((element) => element.id == state.id);
          widget.subcategoryReasonList
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
                          setState(() {
                            widget.subcategoryReasonList.add(CategoryReason(
                              type: 'Sub Category',
                              categoryName: subCategoryName,
                              key: UniqueKey(),
                              categoryID: widget.categoryID,
                              id: tempSubCategoryID,
                              subcategoryID: subcategoryID,
                            ));
                            widget.subcategoryReasonModelList.add(Reason(
                                categoryId: widget.categoryID,
                                id: tempSubCategoryID,
                                subcategoryId: subcategoryID));
                          });

                          tempSubCategoryID++;
                          // BlocProvider.of<ReasonBloc>(context).add(ClearReason());
                        },
                        child: Text('Add sub category reason')),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            widget.subsubcategoryReasonPage.add(
                              SubSubCategoryReasonPage(
                                categoryID: widget.categoryID,
                                subcategoryID: subcategoryID,
                                id: tempSubCategoryID,
                              ),
                            );
                          });
                          tempSubCategoryID++;
                        },
                        child: Text(
                          'Add sub subcategory reason',
                          style: TextStyle(color: Colors.green),
                        )),
                  ],
                ),
              ),
              if (widget.subcategoryReasonList.length > 0)
                Column(
                  children: widget.subcategoryReasonList,
                ),
              if (widget.subsubcategoryReasonPage.length > 0)
                Column(
                  children: widget.subsubcategoryReasonPage,
                ),
              // if (categoryAndSubcategoryReasonList.length > 0)
              //   Column(
              //     children: categoryAndSubcategoryReasonList,
              //   ),
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
