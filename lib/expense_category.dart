import 'package:flutter/material.dart';

class ExpenseCategory extends StatelessWidget {
  final String categoryName;
  final Icon icon;
  final bool isSelected;

  ExpenseCategory(this.categoryName, this.icon, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            constraints: BoxConstraints(),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: isSelected ? Colors.grey[200] : null,
                border: Border.all(color: Colors.grey)),
            child: icon,
          ),
        ),
        Text(
          categoryName,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
