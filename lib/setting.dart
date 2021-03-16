import 'package:flutter/material.dart';
import 'package:mytodo/add_subcategory.dart';
import 'package:mytodo/common_reason.dart';
import 'package:mytodo/theme.dart';

import 'about.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Text(
            'Report related',
            style: TextStyle(
                fontSize: 18, color: Colors.green,fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 0,
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Add category to transaction',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddSubcategory()));
          },
        ),
        Divider(
          height: 0,
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Add sub-category',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddSubcategory()));
          },
        ),
        Divider(
          height: 0,
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Add common reasons',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              context: context,
              builder: (context) =>
                  StatefulBuilder(
                    builder: (context, setState) {
                      return CommonReason();
                    },
                  ),
            );
          },
        ),
        Divider(
          height: 0,
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Choose starting month date ',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {},
        ),
        Divider(
          height: 0,
        ),    ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Select currency',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {},
        ),
        Divider(
          height: 0,
        ), SizedBox(
          height: 10,
        ), Padding(
          padding: const EdgeInsets.only(left: 10,top: 10),
          child: Text(
            'System',
            style: TextStyle(
                fontSize: 18, color: Colors.green,fontStyle: FontStyle.italic),
          ),
        ), SizedBox(
          height: 10,
        ), ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Theme',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ThemeConfigure()));
          },
        ),  Divider(
          height: 0,
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Language',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {},
        ),
        Divider(
          height: 0,
        ),ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sound and notification',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {},
        ),
        Divider(
          // height: 30,
          thickness: 1,
          color: Colors.grey,
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'About developer',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AboutMe()));
          },
        ),
      ],
    );
  }
}
