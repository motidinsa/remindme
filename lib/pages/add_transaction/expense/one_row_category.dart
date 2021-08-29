import 'package:flutter/material.dart';

import 'expense_category.dart';

class OneRowCategory extends StatelessWidget {
  final List<ExpenseAndIncomeCategory> list;

  const OneRowCategory(this.list);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: list,
      ),
    );
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return list.length.toString() + ' internal length';
  }
}
