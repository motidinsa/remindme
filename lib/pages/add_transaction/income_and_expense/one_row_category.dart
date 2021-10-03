import 'package:flutter/material.dart';

import 'income_and_expense_category.dart';

class OneRowCategory extends StatelessWidget {
  final List<Widget> list;
  final double height;

  OneRowCategory({this.list, this.height});

  List<Widget> categoryList = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: list,
      // physics: NeverScrollableScrollPhysics(),
    );
  }
}
