import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_event.dart';
import 'package:remindme/bloc/category/category_state.dart';
import 'package:remindme/pages/add_transaction/icon_select.dart';
import 'package:remindme/pages/setting/add_subcategory/subcategory.dart';
import 'package:remindme/utility/icons_helper.dart';

class SingleSubSubcategory extends StatefulWidget {
  final int id;
  final int subcategoryID;

  SingleSubSubcategory({this.id, this.subcategoryID});

  @override
  _SingleSubSubcategoryState createState() => _SingleSubSubcategoryState();
}

class _SingleSubSubcategoryState extends State<SingleSubSubcategory> {
  TextEditingController nameController = TextEditingController();

  String name;

  FocusNode nameFocus = FocusNode();

  void onSubcategoryNameFocusChange() {
    if (!nameFocus.hasFocus)
      // expenseController.addAmount(widget.id, widget.index, amount);
      BlocProvider.of<CategoryBloc>(context).add(AddSubSubcategoryName(
          subSubcategoryName: name,
          tempID: widget.id,
          subCategoryID: widget.subcategoryID));
  }

  @override
  void initState() {
    super.initState();
    nameFocus.addListener(onSubcategoryNameFocusChange);
    print('bchjdsbjhcbdfvkjdf  id ${widget.subcategoryID}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
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
                          focusNode: nameFocus,
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
                          onChanged: (text) => {name = text},
                          onEditingComplete: () {
                            BlocProvider.of<CategoryBloc>(context).add(
                                AddSubSubcategoryName(
                                    subSubcategoryName: name,
                                    tempID: widget.id,
                                    subCategoryID: widget.subcategoryID));
                          },
                        ),
                      ),
                      // InkWell(
                      //   child: Icon(Icons.minimize),
                      //   onTap: (){},
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
