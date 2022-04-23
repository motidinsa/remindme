import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindme/pages/setting/reason/add_reason_page/add_reason.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../getx_controller/reason/reason_controller.dart';

class AddReasonPage extends StatelessWidget {
  const AddReasonPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReasonController reasonController = Get.put(ReasonController());

    Future<void> showCategoryListAlertDialog() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Category List', textAlign: TextAlign.center),
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10),
              child: ResponsiveGridList(
                rowMainAxisAlignment: MainAxisAlignment.center,
                horizontalGridMargin: 10,
                minItemsPerRow: 3,
                minItemWidth: 60,
                children: reasonController.categoryList,
                // verticalGridMargin: 10,
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add reason'),
        ),
        body: GestureDetector(
          onTap: () {
            reasonController.removeFocus();
            FocusScope.of(context).unfocus();
          },
          child: GetBuilder(
            init: reasonController,
            builder: (_) => reasonController.multipleReasonModels.isEmpty
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            reasonController.removeFocus();
                            FocusScope.of(context).unfocus();
                            showCategoryListAlertDialog();
                          },
                          child: const Text('Select category for reason'),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    controller: reasonController.controller,
                    itemBuilder: (context, index) => index ==
                            reasonController.multipleReasonModels.length - 1
                        ? AutoScrollTag(
                            key: ValueKey(index),
                            controller: reasonController.controller,
                            index: index,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AddReason(
                                  multipleReasonModel: reasonController
                                      .multipleReasonModels[index],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              reasonController.removeFocus();
                                              FocusScope.of(context).unfocus();
                                              showCategoryListAlertDialog();
                                            },
                                            child: const Text(
                                                'Select category for reason'),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {
                                              // reasonController.removeFocus();
                                              // FocusScope.of(context)
                                              //     .unfocus();
                                              // showCategoryListAlertDialog();
                                            },
                                            child: const Text('Save'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : AutoScrollTag(
                            key: ValueKey(index),
                            controller: reasonController.controller,
                            index: index,
                            child: AddReason(
                              multipleReasonModel:
                                  reasonController.multipleReasonModels[index],
                            ),
                          ),
                    itemCount: reasonController.multipleReasonModels.length,
                  ),
          ),
        )

      // ListView(
      //   children: [
      //     const AddReason(),
      //     const AddReason(),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           ElevatedButton(
      //             onPressed: () {
      //               showCategoryListAlertDialog();
      //             },
      //             child: const Text('Select category for reason'),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
