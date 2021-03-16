import 'package:flutter/material.dart';
import 'package:mytodo/icon_select.dart';

class AddSubcategory extends StatefulWidget {
  @override
  _AddSubcategoryState createState() => _AddSubcategoryState();
}

class _AddSubcategoryState extends State<AddSubcategory> {
  String subCategoryName;
  Color selectedCategoryColor;
  TextEditingController nameController = TextEditingController();
  bool switchValue = false;
  bool iconSwitchValue = false;
  Widget subCategoryWidget;
  Widget iconSubcategoryWidget;
  Icon categoryIcon;
  Icon subCategoryIcon;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Icon for category'),
          contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 0),
          content: Container(
            width: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconSelect(
                      Icon(Icons.wysiwyg),
                    ),
                    IconSelect(
                      Icon(Icons.wb_sunny_outlined),
                    ),
                    IconSelect(
                      Icon(Icons.work_outline_sharp),
                    ),
                    IconSelect(
                      Icon(Icons.weekend_outlined),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconSelect(
                      Icon(Icons.wysiwyg),
                    ),
                    IconSelect(
                      Icon(Icons.wb_sunny_outlined),
                    ),
                    IconSelect(
                      Icon(Icons.work_outline_sharp),
                    ),
                    IconSelect(
                      Icon(Icons.weekend_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                // setState(() {
                //
                // });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Card(
                elevation: 10,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected category',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            subCategoryName ?? 'None',
                            style: TextStyle(
                                color: selectedCategoryColor ?? Colors.red),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      // flex: 3,
                      child: Align(
                        // alignment: Alignment.centerRight,
                        child: Container(
                          // color: Colors.green,
                          padding: EdgeInsets.all(10),
                          child: DropdownButton(
                            value: subCategoryName,
                            hint: Text('Select category'),
                            items: [
                              DropdownMenuItem(
                                child: Text('Category 1'),
                                value: 'cat1',
                              ),
                              DropdownMenuItem(
                                child: Text('Category 2'),
                                value: 'cat2',
                              ),
                              DropdownMenuItem(
                                child: Text('Category 3'),
                                value: 'cat3',
                              ),
                              DropdownMenuItem(
                                child: Text('Category 3'),
                                value: 'cat4',
                              ),
                              DropdownMenuItem(
                                child: Text('Category 5'),
                                value: 'cat5',
                              ),
                            ],
                            onChanged: (value) {
                              setState(
                                () {
                                  subCategoryName = value;
                                  selectedCategoryColor = Colors.green;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(top: 5),
                      child: TextField(
                        // readOnly: true,
                        // enabled: false,
                        cursorHeight: 25,
                        controller: nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Category name',
                            labelStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.green,
                            ),
                            contentPadding: EdgeInsets.only(left: 20)),
                        // onChanged: (text) => {name = text},
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Icon'),
                          Icon(categoryIcon ?? Icons.wb_sunny_outlined),
                          OutlinedButton(
                            onPressed: () {
                              _showMyDialog();
                            },
                            child: Text(
                              'Choose',
                              style: TextStyle(color: Colors.green),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Add sub category to the above category'),
                        Switch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(
                              () {
                                switchValue = value;
                                if (value) {
                                  subCategoryWidget = Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, top: 10),
                                      child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Card(
                                            elevation: 10,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15),
                                                    child: Row(
                                                      children: [
                                                        Text('Parent category'),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Icon(Icons
                                                            .wb_sunny_outlined),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text('Transportation')
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: TextField(
                                                      // readOnly: true,
                                                      // enabled: false,
                                                      cursorHeight: 25,
                                                      controller:
                                                          nameController,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText:
                                                                  'Sub category name',
                                                              labelStyle:
                                                                  TextStyle(
                                                                fontSize: 17,
                                                                color: Colors
                                                                    .green,
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      left:
                                                                          20)),
                                                      // onChanged: (text) => {name = text},
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                          'Add icon for this sub category'),
                                                      Switch(
                                                        value: iconSwitchValue,
                                                        onChanged: (value2) {
                                                          setState(
                                                            () {
                                                              iconSwitchValue =
                                                                  value2;
                                                              if (value2) {
                                                                iconSubcategoryWidget =
                                                                    Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Text(
                                                                      'Icon',
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .wb_sunny_outlined,
                                                                    ),
                                                                    OutlinedButton(
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          Text(
                                                                        'Choose',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.green,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              } else {
                                                                iconSubcategoryWidget =
                                                                    null;
                                                              }
                                                            },
                                                          );
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    margin: EdgeInsets.only(
                                                        left: 10, bottom: 5),
                                                    child:
                                                        iconSubcategoryWidget,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ));
                                } else {
                                  subCategoryWidget = null;
                                }
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: subCategoryWidget,
              margin: EdgeInsets.only(bottom: 10),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
