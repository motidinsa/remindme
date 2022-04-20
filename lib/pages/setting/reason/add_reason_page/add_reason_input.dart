import 'package:flutter/material.dart';

import '../../../add_transaction/income_and_expense/category_card/category_header.dart';

class AddReasonInput extends StatelessWidget {
  final int categoryId;

  // final int categoryId;
  const AddReasonInput({Key key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      // focusNode: categoryNameFocusNode,
                      // controller: categoryNameController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 0.75),
                        ),
                        isDense: true,
                        labelText: 'Reason name',
                        labelStyle: TextStyle(
                          // fontSize: 16,
                          color: Colors.green,
                        ),
                        // contentPadding: EdgeInsets.only(left: 20)
                      ),
                      onChanged: (giveCategoryName) {
                        // categoryName =
                        // giveCategoryName == '' ? null : giveCategoryName;
                        // addCategoryController.changeCategoryName(
                        //   categoryId: widget.addCategoryModel.id,
                        //   categoryName: categoryName,
                        // );
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.shade300,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 20,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  // focusNode: categoryNameFocusNode,
                  // controller: categoryNameController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.75),
                    ),
                    isDense: true,
                    labelText: 'Amount (optional)',
                    labelStyle: TextStyle(
                      // fontSize: 16,
                      color: Colors.green,
                    ),
                    // contentPadding: EdgeInsets.only(left: 20)
                  ),
                  onChanged: (giveCategoryName) {
                    // categoryName =
                    // giveCategoryName == '' ? null : giveCategoryName;
                    // addCategoryController.changeCategoryName(
                    //   categoryId: widget.addCategoryModel.id,
                    //   categoryName: categoryName,
                    // );
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  // focusNode: categoryNameFocusNode,
                  // controller: categoryNameController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 0.75),
                    ),
                    isDense: true,
                    labelText: 'Location (optional)',
                    labelStyle: TextStyle(
                      // fontSize: 16,
                      color: Colors.green,
                    ),
                    // contentPadding: EdgeInsets.only(left: 20)
                  ),
                  onChanged: (giveCategoryName) {
                    // categoryName =
                    // giveCategoryName == '' ? null : giveCategoryName;
                    // addCategoryController.changeCategoryName(
                    //   categoryId: widget.addCategoryModel.id,
                    //   categoryName: categoryName,
                    // );
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
