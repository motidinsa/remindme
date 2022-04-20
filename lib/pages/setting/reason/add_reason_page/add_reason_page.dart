import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindme/pages/setting/reason/add_reason_page/add_reason.dart';
import 'package:remindme/pages/setting/reason/add_reason_page/add_reason_input.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
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
        body: GetBuilder(
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
                          showCategoryListAlertDialog();
                        },
                        child: const Text('Select category for reason'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) =>
                      index == reasonController.multipleReasonModels.length - 1
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AddReason(
                                  categoryId: reasonController
                                      .multipleReasonModels[index].categoryId,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          showCategoryListAlertDialog();
                                        },
                                        child: const Text(
                                            'Select category for reason'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : AddReason(
                              categoryId: reasonController
                                  .multipleReasonModels[index].categoryId,
                            ),
                  itemCount: reasonController.multipleReasonModels.length,
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
