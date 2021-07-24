import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mytask/models/expense.dart';
import 'package:mytask/pages/add_transaction/expense/added_expense_list.dart';

import 'expense_detail_list.dart';

class SelectedCategoryInsertItem extends StatefulWidget {
  // final List<Widget> categories;
  final List<Widget> categories;
  List<List<Expense>> finishedCategories;

  SelectedCategoryInsertItem(this.categories, this.finishedCategories);

  @override
  _SelectedCategoryInsertItemState createState() =>
      _SelectedCategoryInsertItemState();
}

class _SelectedCategoryInsertItemState
    extends State<SelectedCategoryInsertItem> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    // print(widget.categories.length.toString() + ' cat length');
    return ListView(
      shrinkWrap: true,
      children: [
        // if (widget.finishedCategories.length > 0)
        AddedExpenseList(widget.finishedCategories),
        if (widget.categories.length > 0)
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: widget.categories,
                options: CarouselOptions(
                  // height: double.maxFinite,
                  // autoPlay: true,
                  autoPlayInterval: Duration(seconds: 1),
                  viewportFraction: 1,
                  // pageSnapping: false,
                  aspectRatio: 4 / 2.7,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _current = index;
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: widget.categories.map(
                  (url) {
                    int index = widget.categories.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == index || widget.categories.length == 1
                                ? Colors.green
                                : Colors.grey,
                      ),
                    );
                  },
                ).toList(),
              )
            ],
          ),
      ],
    );
  }
}
