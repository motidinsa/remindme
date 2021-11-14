import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class EmptyReason extends StatelessWidget {
  const EmptyReason({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No reason found. Tap the + icon to add a reason',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: const Icon(
              Icons.add,
              color: Colors.green,
              size: 28,
            ),
            onTap: () {},
            borderRadius: BorderRadius.circular(30),
          )
        ],
      ),
    );
  }
}
