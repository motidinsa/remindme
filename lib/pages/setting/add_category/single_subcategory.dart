import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_event.dart';
import 'package:remindme/bloc/category/category_state.dart';
import 'package:remindme/pages/add_transaction/icon_select.dart';
import 'package:remindme/pages/setting/add_subcategory/subcategory.dart';
import 'package:remindme/utility/icons_helper.dart';

class SingleSubcategory extends StatefulWidget {
  final int id;
  final List<IconSelect> subcategoryIconList;
  final Icon icon;

  SingleSubcategory({this.id, this.subcategoryIconList, this.icon});

  @override
  _SingleSubcategoryState createState() => _SingleSubcategoryState();
}

class _SingleSubcategoryState extends State<SingleSubcategory> {
  TextEditingController nameController = TextEditingController();
  List<IconSelect> subcategoryIconList;
  String name;
  Icon subCategoryIcon;
  FocusNode nameFocus = FocusNode();
  bool iconSwitchValue = false;

  void onSubcategoryNameFocusChange() {
    if (!nameFocus.hasFocus)
      // expenseController.addAmount(widget.id, widget.index, amount);
      BlocProvider.of<CategoryBloc>(context)
          .add(AddSubcategoryName(subcategoryName: name, tempID: widget.id));
  }

  @override
  void initState() {
    super.initState();
    nameFocus.addListener(onSubcategoryNameFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (_, state) {
      if (state is SubcategoryIconAdded) {
        // subcategoryModels = state.subcategories;
        print('cat idd icon eeee');
        subCategoryIcon =
            Icon(IconsHelper.getIconUsingPrefix(name: state.subcategoryIcon));
        // BlocProvider.of<ReasonBloc>(context).add(ClearReason());
      }
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
                            focusNode: nameFocus,
                            cursorHeight: 25,
                            controller: nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Subcategory name',
                                labelStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.green,
                                ),
                                contentPadding: EdgeInsets.only(left: 20)),
                            onChanged: (text) => {name = text},
                            onEditingComplete: () {
                              BlocProvider.of<CategoryBloc>(context).add(
                                  AddSubcategoryName(
                                      subcategoryName: name,
                                      tempID: widget.id));
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Add icon for this sub category'),
                      Switch(
                        value: iconSwitchValue,
                        onChanged: (value2) {
                          setState(
                            () {
                              iconSwitchValue = value2;
                            },
                          );
                        },
                      )
                    ],
                  ),
                  if (iconSwitchValue)
                    IconSubcategory(
                      iconList: widget.subcategoryIconList,
                      icon: subCategoryIcon,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                        'If no icon is selected, the category icon will be used'),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
