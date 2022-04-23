import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/category_card/select_subcategory/select_subcategory.dart';

import '../../../../getx_controller/reason/reason_controller.dart';

class CategoryHeader extends StatelessWidget {
  final String categoryName;
  final String subcategoryName;
  final String subSubcategoryName;
  final String type;
  final int id;
  final int categoryId;

// final controller;

  const CategoryHeader({
    Key key,
    this.categoryName,
    this.subSubcategoryName,
    this.subcategoryName,
    this.type,
    this.id,
    this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReasonController reasonController = type == 'reason' ? Get.find() : null;

    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: type == 'reason'
                ? TextButton(
                    child: Wrap(
                      children: [
                        Text(
                          categoryName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        if (subcategoryName != null)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.chevron_right_rounded,
                                  color: Colors.brown),
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
                              Icon(Icons.chevron_right_rounded,
                                  color: Colors.brown),
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
                    onPressed: () {
                      reasonController.removeFocus();
                      FocusScope.of(context).unfocus();
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        context: context,
                        builder: (context) => SelectSubcategory(
                          id: id,
                          // categoryId: categoryId,
                          // categoryCardId: categoryCardId,
                          controller: reasonController,
                          type: 'reason',
                        ),
                      );
                      // reasonController.editCategory()
                    },
                  )
                : Wrap(
                    children: [
                      Text(
                        categoryName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      if (subcategoryName != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.chevron_right_rounded,
                                color: Colors.brown),
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
                            Icon(Icons.chevron_right_rounded,
                                color: Colors.brown),
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
        ),
        const SizedBox(
          width: 5,
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
            onPressed: () async {
              print('qq ${categoryId}  $id');
              await FocusScope.of(context).unfocus();
              reasonController.removeFocus();

              type == 'reason'
                  ? id != null
                      ? reasonController.deleteReason(
                          categoryId: categoryId, id: id)
                      : reasonController.deleteCategoryReason(
                          categoryId: categoryId)
                  : null;
            },
          ),
        )
      ],
    );
  }
}
