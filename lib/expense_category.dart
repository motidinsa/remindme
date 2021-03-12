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
          // highlightColor: Colors.amber,
          onTap: () {},
          child: Ink(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isSelected ? Colors.grey[200] : null,
                  border: Border.all(color: Colors.grey)),
              child: icon
          ),
        ),
        Container(
          width: 60,
          height: 50,
          margin: EdgeInsets.only(top: 5),
          child: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
