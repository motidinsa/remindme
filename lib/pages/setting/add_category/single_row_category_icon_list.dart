import 'package:flutter/material.dart';
import 'package:mytask/pages/add_transaction/icon_select.dart';

class SingleRowIconList extends StatelessWidget {
  final List<IconSelect> iconList;

  SingleRowIconList(this.iconList);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: iconList,
    );
  }
}
