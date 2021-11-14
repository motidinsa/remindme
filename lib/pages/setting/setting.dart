import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_event.dart';
import 'package:remindme/pages/setting/add_reason/reason_page.dart';
import 'package:remindme/pages/setting/theme/theme.dart';

import 'about/about.dart';
import 'add_category/edit_category.dart';
import 'add_category/expense_and_income_category_insert.dart';
import 'add_subcategory/add_subcategory.dart';

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
                fontSize: 18, color: Colors.green, fontStyle: FontStyle.italic),
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
              'Add Category',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {
            BlocProvider.of<CategoryBloc>(context).add(ClearCategory());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExpenseAndIncomeCategoryInsert(),
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
              'Add sub-category',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {
            BlocProvider.of<CategoryBloc>(context).add(ClearCategory());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditCategory()));
          },
        ),
        Divider(
          height: 0,
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Add Reasons',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => ReasonPage(),
            //     ));
            // showModalBottomSheet(
            //   isScrollControlled: true,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   context: context,
            //   builder: (context) => StatefulBuilder(
            //     builder: (context, setState) {
            //       return CommonReason();
            //     },
            //   ),
            // );
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
        ),
        ListTile(
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
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            'System',
            style: TextStyle(
                fontSize: 18, color: Colors.green, fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
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
        ),
        Divider(
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
        ),
        ListTile(
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
