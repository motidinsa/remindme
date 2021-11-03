import 'package:flutter/material.dart';

class CategoryAccountSelect extends StatelessWidget {
  const CategoryAccountSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Subtract from '),
        const SizedBox(
          width: 15,
        ),
        Card(
          elevation: 2,
          color: Colors.green.shade50,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: const [Text('Wallet'), Text('Balance: 100')],
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Change'),
          // style: TextButton.styleFrom(
          //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // ),
        )
      ],
    );
  }
}
