import 'package:flutter/material.dart';

class IconSelect extends StatelessWidget {
  final Icon icon;

  IconSelect(this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      // highlightColor: Colors.amber,
      onTap: () {},
      child: Ink(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey)),
          child: icon),
    );
  }
}
