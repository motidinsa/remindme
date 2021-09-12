import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/reason/reason_bloc.dart';
import 'package:remindme/bloc/reason/reason_event.dart';

class CategoryReason extends StatefulWidget {
  int categoryID;
  int subcategoryID;
  int subSubcategoryID;
  int id;
  Key key;
  String categoryName;
  String type;

  CategoryReason(
      {this.categoryID,
      this.id,
      this.key,
      this.categoryName,
      this.type,
      this.subcategoryID,
      this.subSubcategoryID});

  @override
  _CategoryReasonState createState() => _CategoryReasonState();
}

class _CategoryReasonState extends State<CategoryReason> {
  TextEditingController reasonNameController = TextEditingController();
  TextEditingController reasonAmountController = TextEditingController();
  String categoryReasonName;
  String categoryReasonAmount;
  FocusNode categoryNameFocus = FocusNode();
  FocusNode categoryAmountFocus = FocusNode();

  void onReasonNameFocusChange() {
    if (!categoryNameFocus.hasFocus)
      // expenseController.addAmount(widget.id, widget.index, amount);
      widget.type == 'Category'
          ? BlocProvider.of<ReasonBloc>(context).add(AddCategoryReason(
              id: widget.id,
              categoryID: widget.categoryID,
              categoryName: categoryReasonName))
          : widget.type == 'Sub Category'
              ? BlocProvider.of<ReasonBloc>(context).add(AddSubCategoryReason(
                  id: widget.id,
                  categoryID: widget.categoryID,
                  subcategoryName: categoryReasonName,
                  subcategoryID: widget.subcategoryID))
              : BlocProvider.of<ReasonBloc>(context).add(
                  AddSubSubCategoryReason(
                      id: widget.id,
                      categoryID: widget.categoryID,
                      subcategoryName: categoryReasonName,
                      subcategoryID: widget.subcategoryID,
                      subsubcategoryID: widget.subSubcategoryID));
  }

  void onReasonAmountFocusChange() {
    if (!categoryAmountFocus.hasFocus)
      // expenseController.addAmount(widget.id, widget.index, amount);
      widget.type == 'Category'
          ? BlocProvider.of<ReasonBloc>(context).add(AddCategoryAmount(
              categoryID: widget.categoryID,
              categoryAmount: categoryReasonAmount,
              id: widget.id,
            ))
          : widget.type == 'Sub Category'
              ? BlocProvider.of<ReasonBloc>(context).add(AddSubCategoryAmount(
                  categoryID: widget.categoryID,
                  subcategoryAmount: categoryReasonAmount,
                  id: widget.id,
                  subcategoryID: widget.subcategoryID))
              : BlocProvider.of<ReasonBloc>(context).add(
                  AddSubSubCategoryAmount(
                      categoryID: widget.categoryID,
                      subsubcategoryAmount: categoryReasonAmount,
                      id: widget.id,
                      subcategoryID: widget.subcategoryID,
                      subsubcategoryID: widget.subSubcategoryID));
  }

  @override
  void initState() {
    super.initState();
    categoryNameFocus.addListener(onReasonNameFocusChange);
    categoryAmountFocus.addListener(onReasonAmountFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.type,
                  style: TextStyle(fontSize: 16),
                )),
            SizedBox(
              height: 5,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(top: 5),
                  child: TextField(
                    cursorHeight: 25,
                    focusNode: categoryNameFocus,
                    controller: reasonNameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Reason',
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.green,
                        ),
                        contentPadding: EdgeInsets.only(left: 20)),
                    onChanged: (text) => {categoryReasonName = text},
                    onEditingComplete: () {
                      widget.type == 'Category'
                          ? BlocProvider.of<ReasonBloc>(context).add(
                              AddCategoryReason(
                                  id: widget.id,
                                  categoryID: widget.categoryID,
                                  categoryName: categoryReasonName))
                          : widget.type == 'Sub Category'
                              ? BlocProvider.of<ReasonBloc>(context).add(
                                  AddSubCategoryReason(
                                      id: widget.id,
                                      categoryID: widget.categoryID,
                                      subcategoryName: categoryReasonName,
                                      subcategoryID: widget.subcategoryID))
                              : BlocProvider.of<ReasonBloc>(context).add(
                                  AddSubSubCategoryReason(
                                      id: widget.id,
                                      categoryID: widget.categoryID,
                                      subcategoryName: categoryReasonName,
                                      subcategoryID: widget.subcategoryID,
                                      subsubcategoryID:
                                          widget.subSubcategoryID));
                    },
                  ),
                ),
                Expanded(
                  child: Align(
                    // alignment: Alignment.topCenter,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        BlocProvider.of<ReasonBloc>(context).add(
                            RemoveCategoryReason(
                                categoryID: widget.categoryID, id: widget.id));
                      },
                      child: Ink(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.minimize_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.only(top: 5),
                child: TextField(
                  // readOnly: true,
                  // enabled: false,
                  cursorHeight: 25,
                  focusNode: categoryAmountFocus,
                  controller: reasonAmountController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                      labelStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.green,
                      ),
                      contentPadding: EdgeInsets.only(left: 20)),
                  onChanged: (text) => {categoryReasonAmount = text},
                  onEditingComplete: () {
                    widget.type == 'Category'
                        ? BlocProvider.of<ReasonBloc>(context)
                            .add(AddCategoryAmount(
                            categoryID: widget.categoryID,
                            categoryAmount: categoryReasonAmount,
                            id: widget.id,
                          ))
                        : widget.type == 'Sub Category'
                            ? BlocProvider.of<ReasonBloc>(context).add(
                                AddSubCategoryAmount(
                                    categoryID: widget.categoryID,
                                    subcategoryAmount: categoryReasonAmount,
                                    id: widget.id,
                                    subcategoryID: widget.subcategoryID))
                            : BlocProvider.of<ReasonBloc>(context).add(
                                AddSubSubCategoryAmount(
                                    categoryID: widget.categoryID,
                                    subsubcategoryAmount: categoryReasonAmount,
                                    id: widget.id,
                                    subcategoryID: widget.subcategoryID,
                                    subsubcategoryID: widget.subSubcategoryID));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
