import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/category/category_bloc.dart';
import 'package:mytask/bloc/category/category_event.dart';
import 'package:mytask/bloc/category/category_state.dart';
import 'package:mytask/models/expense_and_income_subsubcategory.dart';
import 'package:mytask/pages/add_transaction/icon_select.dart';
import 'package:mytask/pages/setting/add_category/expense_and_income_category_insert.dart';
import 'package:mytask/pages/setting/add_category/single_row_category_icon_list.dart';
import 'package:mytask/pages/setting/add_category/sub_subcategory.dart';
import 'package:mytask/utility/icons_helper.dart';

class Subcategory extends StatefulWidget {
  int id;

  // int subCategoryID;
  final Key key;
  Icon icon;
  final List<IconSelect> iconList;

  Subcategory({this.id, this.key, this.iconList, this.icon});

  @override
  _SubcategoryState createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  TextEditingController nameController = TextEditingController();
  bool iconSwitchValue = false;

  // int id = 1;

  List<ExpenseAndIncomeSubSubCategoryModel> subSubcategories = [];
  List<SubSubcategory> subSubcategoryWidgets = [];

  // List<ExpenseAndIncomeSubSubCategoryModel> subSubcategories = [];
  String subCategoryName;
  FocusNode subcategoryNameFocus = FocusNode();
  TextEditingController _subcategoryNameController = TextEditingController();
  int tempSubSubcategoryID = 0;

  @override
  void initState() {
    super.initState();
    subcategoryNameFocus.addListener(onSubcategoryNameFocusChange);
    print('sub ' + widget.id.toString());
    print('sub type' + widget.iconList[0].type.toString());
  }

  void onSubcategoryNameFocusChange() {
    if (!subcategoryNameFocus.hasFocus)
      // expenseController.addAmount(widget.id, widget.index, amount);
      BlocProvider.of<CategoryBloc>(context).add(AddSubcategoryName(
          subcategoryName: subCategoryName, tempID: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (_, state) {
      if (state is SubSubcategoryRemoved) {
        subSubcategoryWidgets.removeAt(state.id);
        for (int i = 0; i < subSubcategoryWidgets.length; i++) {
          subSubcategoryWidgets[i].id = i;
        }
        tempSubSubcategoryID = subSubcategoryWidgets.length;
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
                            focusNode: subcategoryNameFocus,
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
                            onChanged: (text) => {subCategoryName = text},
                            onEditingComplete: () {
                              BlocProvider.of<CategoryBloc>(context).add(
                                  AddSubcategoryName(
                                      subcategoryName: subCategoryName,
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
                                    BlocProvider.of<CategoryBloc>(context)
                                        .add(RemoveSubcategory(widget.id));
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
                      iconList: widget.iconList,
                      icon: widget.icon,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                        'If no icon is selected, the category icon will be used'),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // subSubcategories
                          //     .add(ExpenseAndIncomeSubSubCategoryModel(
                          //   id: id,
                          // ));
                          // tempSubSubcategoryID.add(0);
                          subSubcategories
                              .add(ExpenseAndIncomeSubSubCategoryModel(
                            id: tempSubSubcategoryID,
                            subcategoryID: widget.id,
                            dateType: 'gr',
                          ));
                          BlocProvider.of<CategoryBloc>(context).add(
                            AddSubSubCategory(subcategories: subSubcategories),
                          );
                          subSubcategoryWidgets.add(
                            SubSubcategory(
                              key: UniqueKey(),
                              id: tempSubSubcategoryID,
                              subCategoryID: widget.id,
                            ),
                          );
                          tempSubSubcategoryID++;
                        });
                      },
                      child: Text('Add Sub subcategory'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                    ),
                  ),
                  if (subSubcategoryWidgets.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        children: subSubcategoryWidgets,
                      ),
                    ),
                ],
              ),
            ),
          ));
    });
  }
}

class IconSubcategory extends StatefulWidget {
  final List<IconSelect> iconList;

  final Icon icon;

  IconSubcategory({this.iconList, this.icon});

  @override
  _IconSubcategoryState createState() => _IconSubcategoryState();
}

class _IconSubcategoryState extends State<IconSubcategory> {
  Icon subcategoryIcon;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        int itemCount = widget.iconList.length % 5 == 0
            ? (widget.iconList.length ~/ 5)
            : (widget.iconList.length ~/ 5) + 1;
        return AlertDialog(
          title: Text('Select Icon for category'),
          contentPadding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          content: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  index == (widget.iconList.length ~/ 5)
                      ? SingleRowIconList(widget.iconList.sublist(
                          5 * index, 5 * index + (widget.iconList.length % 5)))
                      : SingleRowIconList(
                          widget.iconList.sublist(5 * index, 5 * index + 5)),
              itemCount: itemCount,
              separatorBuilder: (context, index) => SizedBox(
                height: 5,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      margin: EdgeInsets.only(left: 10, bottom: 5),
      child: Row(
        key: UniqueKey(),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Icon',
          ),
          if (widget.icon != null) widget.icon,
          OutlinedButton(
            onPressed: () {
              _showMyDialog();
            },
            child: Text(
              'Choose',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
