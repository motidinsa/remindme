import 'package:flutter/material.dart';

class SubcategorySelectHint extends StatelessWidget {
  const SubcategorySelectHint({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Text(
            'Subcategories will be automatically added if you pressed the select reason button',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          child: const Icon(
            Icons.close,
            color: Colors.red,
            size: 18,
          ),
          onTap: () {},
          borderRadius: BorderRadius.circular(30),
        )
      ],
    );
  }
}
