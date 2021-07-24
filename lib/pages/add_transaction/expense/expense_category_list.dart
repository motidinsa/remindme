import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mytask/pages/add_transaction/expense/expense_category.dart';
import 'package:mytask/pages/add_transaction/expense/one_row_category.dart';

class CategoryList extends StatefulWidget {
  final List<ExpenseCategoryy> categoryList;

  CategoryList(this.categoryList);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _current = 0;
  List<Widget> cardItems;

  @override
  void initState() {
    super.initState();
    cardItems = singleCardItem(multipleOneRowCategory(widget.categoryList));
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> allCategoryList =;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CarouselSlider(
              items: cardItems,
              options: CarouselOptions(
                // autoPlay: true,
                autoPlayInterval: Duration(seconds: 1),
                viewportFraction: 1,
                aspectRatio: 4 / 3.1,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _current = index;
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: cardItems.map(
            (url) {
              print(url.toString() + ' url');
              int index = cardItems.indexOf(url);
              print(index.toString() + ' index');
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.green : Colors.grey,
                ),
              );
            },
          ).toList(),
        )
      ],
    );
  }

  List<Widget> singleCardItem(List<Widget> categoryList1) {
    List<Widget> tobeReturned = [];
    int itemCount = categoryList1.length % 3 == 0
        ? (categoryList1.length ~/ 3)
        : (categoryList1.length ~/ 3) + 1;

    for (int index = 0; index < itemCount; index++) {
      if (index == (categoryList1.length ~/ 3)) {
        print((categoryList1.length ~/ 3).toString() + ' fvdjvhdjf');
        tobeReturned.add(
          singlePageCategory(
            categoryList1.sublist(
              3 * index,
              3 * index + (categoryList1.length % 3),
            ),
          ),
        );
      } else {
        tobeReturned.add(
          singlePageCategory(
            categoryList1.sublist(3 * index, 3 * index + 3),
          ),
        );
      }
    }
    return tobeReturned;
  }

  Widget singlePageCategory(List<Widget> categoryList2) {
    return Card(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: categoryList2,
      ),
      // ),
    );
  }

  List<Widget> multipleOneRowCategory(List<ExpenseCategoryy> categoryList3) {
    List<Widget> tobeReturned = [];
    int itemCount = categoryList3.length % 4 == 0
        ? (categoryList3.length ~/ 4)
        : (categoryList3.length ~/ 4) + 1;
    for (int index = 0; index < itemCount; index++) {
      if (index == (categoryList3.length ~/ 4)) {
        print((categoryList3.length ~/ 4).toString() + ' multiple');
        tobeReturned.add(
          OneRowCategory(
            categoryList3.sublist(
              4 * index,
              4 * index + (categoryList3.length % 4),
            ),
          ),
        );
      } else {
        tobeReturned.add(OneRowCategory(
          categoryList3.sublist(4 * index, 4 * index + 4),
        ));
      }
    }
    return tobeReturned;
  }
}
