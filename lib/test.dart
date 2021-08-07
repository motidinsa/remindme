import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:mytask/pages/add_transaction/expense/expense_category.dart';
import 'package:mytask/pages/add_transaction/expense/expense_category_list.dart';

void main() {
  runApp(CardList());
}

class Controller extends GetxController {
  var count = 0;
  var count2 = 0.obs;

  TextEditingController c = new TextEditingController();

  TextEditingController d = new TextEditingController();
  List<Widget> cardItems;

  Controller() {
    c.text = 'a';
    d.text = 'b';
    cardItems = [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('1'),
          Card(
            child: TextField(
              // key: UniqueKey(),
              controller: c,
            ),
          ),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('2'),
          Card(
            child: TextField(
              // key: UniqueKey(),
              controller: d,
            ),
          ),
        ],
      )
    ].obs;
  }

  var values = [].obs;

  increment() => count++;

  multiply() => count2--;

  add() {
    count++;
    cardItems.add(Text(count.toString()));
  }

  delete() => cardItems.removeAt(0);
}

class CardList extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  final Controller c = Get.find();
  List<ExpenseCategoryy> categoryList = [
    ExpenseCategoryy(
        'Transportation',
        Icon(
          Icons.phonelink_setup,
          size: 30,
          color: Colors.black54,
        ),
        false,
        1),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.star,
          size: 30,
          color: Colors.black54,
        ),
        false,
        2),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.assignment,
          size: 30,
          color: Colors.black54,
        ),
        false,
        3),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        4),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.app_settings_alt,
          size: 30,
          color: Colors.black54,
        ),
        false,
        5),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.star,
          size: 30,
          color: Colors.black54,
        ),
        false,
        6),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.assignment,
          size: 30,
          color: Colors.black54,
        ),
        false,
        7),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        8),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        9),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        10),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        11),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        12),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        13),
    ExpenseCategoryy(
        'Food',
        Icon(
          Icons.wysiwyg,
          size: 30,
          color: Colors.black54,
        ),
        false,
        13),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Obx(
                () => CarouselSlider(
                  key: UniqueKey(),
                  items: controller.cardItems,
                  options: CarouselOptions(
                    // height: double.maxFinite,
                    // autoPlay: true,
                    autoPlayInterval: Duration(seconds: 1),
                    viewportFraction: 1,
                    // pageSnapping: false,
                    aspectRatio: 4 / 2.7,
                    onPageChanged: (index, reason) {
                      // setState(
                      //       () {
                      //     _current = index;
                      //   },
                      // );
                    },
                  ),
                ),
              ),
              OutlinedButton(
                child: Text('delete'),
                onPressed: () => controller.delete(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return GetMaterialApp(
      home: Scaffold(
          // Use Obx(()=> to update Text() whenever count is changed.
          appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

          // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
          body: Center(
              child: ElevatedButton(
                  child: Text("Go to Other"),
                  onPressed: () => Get.to(Other()))),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                c.increment();
                c.multiply();
              })),
    );
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count} ${c.count2}")));
  }
}
