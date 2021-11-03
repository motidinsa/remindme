import 'package:flutter/material.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';

class SubcategorySelectItem extends StatelessWidget {
  final IncomeAndExpenseSubCategoryModel subcategoryModel;

  const SubcategorySelectItem({Key key, this.subcategoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green.shade100,
      child: InkWell(
        onTap: () {},
        // color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    subcategoryModel.subcategoryName,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              if (subcategoryModel.subSubcategoryCount > 0)
                Expanded(
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.green,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
