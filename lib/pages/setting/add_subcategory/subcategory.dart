import 'package:flutter/material.dart';

class Subcategory extends StatefulWidget {
  Subcategory();

  @override
  _SubcategoryState createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  TextEditingController nameController = TextEditingController();
  bool iconSwitchValue = false;

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
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text('Parent category'),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(Icons.wb_sunny_outlined),
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
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    // readOnly: true,
                    // enabled: false,
                    cursorHeight: 25,
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Sub category name',
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
                if (iconSwitchValue) IconSubcategory(),
              ],
            ),
          ),
        ));
  }
}

class IconSubcategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      margin: EdgeInsets.only(left: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Icon',
          ),
          Icon(
            Icons.wb_sunny_outlined,
          ),
          OutlinedButton(
            onPressed: () {},
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
