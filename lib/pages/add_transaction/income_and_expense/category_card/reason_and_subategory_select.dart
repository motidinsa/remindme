import 'package:flutter/material.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/subcategory_select_hint.dart';

import 'select_subcategory/select_subcategory.dart';

class ReasonAndSubcategorySelect extends StatelessWidget {
  const ReasonAndSubcategorySelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text('Select reason'),
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
            ),
            TextButton(
              child: const Text('Select Subcategory'),
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                showModalBottomSheet(
                    // isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    context: context,
                    builder: (context) => SelectSubcategory());
              },
            ),
          ],
        ),
        const SubcategorySelectHint()
      ],
    );
  }
}
