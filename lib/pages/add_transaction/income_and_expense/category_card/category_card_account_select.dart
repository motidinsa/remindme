import 'package:flutter/material.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_account/select_account.dart';

class CategoryAccountSelect extends StatelessWidget {
  const CategoryAccountSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 7, child: const Text('Subtract from ')),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 6,
          child: Card(
            elevation: 2,
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: const [
                  Text(
                    'Walletckj',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('ETB 100'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 7,
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                context: context,
                builder: (context) => SelectAccount(),
              );
            },
            child: const Text('Change'),
            // style: TextButton.styleFrom(
            //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            // ),
          ),
        )
      ],
    );
  }
}
