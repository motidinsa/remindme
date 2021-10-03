import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/one_row_category.dart';
import 'package:flutter/rendering.dart';

class CategoryList extends StatefulWidget {
  final List<Widget> categoryList;
  final Key key;

  CategoryList(this.key, this.categoryList);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  double height;
  bool makeScrollable = false;
  bool isFirstHeightSet = false;

  @override
  Widget build(BuildContext context) {
    return WidgetSize(
      onChange: (Size size) {
        setState(() {
          if (!isFirstHeightSet) {
            height = size.height;
            isFirstHeightSet = true;
          }
          if (height > MediaQuery.of(context).size.height * .25) {
            makeScrollable = true;
          }
        });
      },
      child: Card(
        elevation: 2,
        child: Center(
            child: SizedBox(
          height: makeScrollable
              ? MediaQuery.of(context).size.height * .25
              : height,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 5,
                children: widget.categoryList,
              ),
            ],
          ),
        )),
      ),
    );
  }

  List<Widget> multipleOneRowCategory(List<Widget> categoryList,
      {double height = 0}) {
    List<Widget> tobeReturned = [];
    List<Widget> singleRowCategoryItems = [];
    int itemCount = categoryList.length % 5 == 0
        ? (categoryList.length ~/ 5)
        : (categoryList.length ~/ 5) + 1;
    for (int index = 0; index < itemCount; index++) {
      if (index == (categoryList.length ~/ 5)) {
        List<Widget> finalList = categoryList.sublist(
          5 * index,
          5 * index + (categoryList.length % 5),
        );
        for (int j = 0; j < finalList.length; j++) {
          if (j == finalList.length - 1) {
            singleRowCategoryItems.add(finalList[j]);
            // singleRowCategoryItems.add(const Spacer());
          } else {
            singleRowCategoryItems.add(finalList[j]);
          }
        }
        tobeReturned.add(
          SizedBox(
              height: height,
              child:
                  OneRowCategory(list: singleRowCategoryItems, height: height)),
        );
        singleRowCategoryItems = [];
      } else {
        List<Widget> finalList = categoryList.sublist(5 * index, 5 * index + 5);
        for (int j = 0; j < finalList.length; j++) {
          if (j == finalList.length - 1) {
            singleRowCategoryItems.add(finalList[j]);
          } else {
            singleRowCategoryItems.add(finalList[j]);
            // singleRowCategoryItems.add(const Spacer());
          }
        }
        tobeReturned.add(SizedBox(
            height: height,
            child:
                OneRowCategory(list: singleRowCategoryItems, height: height)));
        singleRowCategoryItems = [];
      }
    }
    return tobeReturned;
  }
}
