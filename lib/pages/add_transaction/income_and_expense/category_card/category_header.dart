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
        Text(
          categoryName,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        if (subcategoryName != null)
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              const Icon(Icons.chevron_right_rounded, color: Colors.brown),
              const SizedBox(
                width: 5,
              ),
              Text(
                subcategoryName,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              )
            ],
          ),
        if (subSubcategoryName != null)
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              const Icon(Icons.chevron_right_rounded, color: Colors.brown),
              const SizedBox(
                width: 5,
              ),
              Text(
                subSubcategoryName,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              )
            ],
          ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              child: const Icon(
                Icons.remove,
                color: Colors.red,
                size: 24,
              ),
              onTap: () {},
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        )
      ],
    );
  }
}
