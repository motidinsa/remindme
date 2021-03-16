import 'package:flutter/material.dart';

import 'expense_category.dart';

class CommonReason extends StatefulWidget {
  @override
  _CommonReasonState createState() => _CommonReasonState();
}

class _CommonReasonState extends State<CommonReason> {
  String subCategoryName;
  TextEditingController reasonNameController = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Icon for category'),
          contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
          content: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              width: 100,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ExpenseCategory(
                          'Transportation',
                          Icon(
                            Icons.phonelink_setup,
                            size: 30,
                            color: Colors.black54,
                          ),
                          true),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.assignment,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.wysiwyg,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.app_settings_alt,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.assignment,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.wysiwyg,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.app_settings_alt,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.assignment,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                      ExpenseCategory(
                          'Food',
                          Icon(
                            Icons.wysiwyg,
                            size: 30,
                            color: Colors.black54,
                          ),
                          false),
                    ],
                  ),
                ],
              ),
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
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
      child: Card(
        elevation: 20,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        _showMyDialog();
                      },
                      child: Text(
                        'Select category',
                        style: TextStyle(color: Colors.green),
                      )),
                  Expanded(
                    child: Align(
                      child: DropdownButton(
                        value: subCategoryName,
                        hint: Text('Select subcategory'),
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
                              // selectedCategoryColor = Colors.green;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  Container(
                    // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.only(top: 5),
                    child: TextField(
                      // readOnly: true,
                      // enabled: false,
                      cursorHeight: 25,
                      controller: reasonNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Reason',
                          labelStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.green,
                          ),
                          contentPadding: EdgeInsets.only(left: 20)),
                      // onChanged: (text) => {name = text},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.only(top: 5),
                    child: TextField(
                      // readOnly: true,
                      // enabled: false,
                      cursorHeight: 25,
                      controller: reasonNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Reason',
                          labelStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.green,
                          ),
                          contentPadding: EdgeInsets.only(left: 20)),
                      // onChanged: (text) => {name = text},
                    ),
                  ),
                  Expanded(
                    child: Align(
                      // alignment: Alignment.topCenter,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {},
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
