import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String categoryName;
  final String subcategoryName;
  final String subSubcategoryName;

  const CategoryHeader({
    Key key,
    this.categoryName,
    this.subSubcategoryName,
    this.subcategoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            children: [
              Text(
                categoryName,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              ),
              if (subcategoryName != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.chevron_right_rounded, color: Colors.brown),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              if (subcategoryName != null)
                Text(
                  subcategoryName,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                ),
              if (subSubcategoryName != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.chevron_right_rounded, color: Colors.brown),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              if (subSubcategoryName != null)
                Text(
                  subSubcategoryName,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red.shade300,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 20,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
