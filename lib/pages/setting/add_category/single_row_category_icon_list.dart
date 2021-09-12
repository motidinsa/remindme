import 'package:flutter/material.dart';
import 'package:remindme/pages/add_transaction/icon_select.dart';

class SingleRowIconList extends StatelessWidget {
  final List<Widget> iconList;

  SingleRowIconList(this.iconList);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: iconList,
    );
  }
}
