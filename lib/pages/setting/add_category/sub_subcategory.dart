import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_event.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/pages/add_transaction/icon_select.dart';
import 'package:remindme/helper/icons_helper.dart';

class SubSubcategory extends StatefulWidget {
  int id;

  // int tempSubcategoryID;
  final int subCategoryID;
  final Key key;

  SubSubcategory({this.id, this.key, this.subCategoryID});

  @override
  _SubSubcategoryState createState() => _SubSubcategoryState();
}

class _SubSubcategoryState extends State<SubSubcategory> {
  TextEditingController nameController = TextEditingController();
  bool iconSwitchValue = false;

  // int id = 0;
  FocusNode subSubcategoryNameFocus = FocusNode();
  String subSubCategoryName;

  void onSubSubcategoryNameFocusChange() {
    if (!subSubcategoryNameFocus.hasFocus)
      // expenseController.addAmount(widget.id, widget.index, amount);
      BlocProvider.of<CategoryBloc>(context).add(
        AddSubSubcategoryName(
            subSubcategoryName: subSubCategoryName,
            tempSubCategoryID: widget.subCategoryID,
            tempID: widget.id),
      );
  }

  @override
  void initState() {
    super.initState();
    subSubcategoryNameFocus.addListener(onSubSubcategoryNameFocusChange);
    print('subsub ' + widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        // readOnly: true,
                        // enabled: false,
                        focusNode: subSubcategoryNameFocus,
                        cursorHeight: 25,
                        controller: nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Sub subcategory name',
                            labelStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.green,
                            ),
                            contentPadding: EdgeInsets.only(left: 20)),
                        onChanged: (text) => {subSubCategoryName = text},
                        onEditingComplete: () {
                          BlocProvider.of<CategoryBloc>(context).add(
                              AddSubSubcategoryName(
                                  subSubcategoryName: subSubCategoryName,
                                  tempSubCategoryID: widget.subCategoryID,
                                  tempID: widget.id));
                        },
                      ),
                    ),
                    // InkWell(
                    //   child: Icon(Icons.minimize),
                    //   onTap: (){},
                    // ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Material(
                            child: InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.minimize,
                                  color: Colors.red,
                                ),
                              ),
                              onTap: () {
                                BlocProvider.of<CategoryBloc>(context).add(
                                    RemoveSubSubcategory(
                                        categoryID: widget.subCategoryID,
                                        id: widget.id));
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
