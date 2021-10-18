// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:flutter/material.dart';
//
// import 'getx_controller/income_and_expense/income_and_expense_controller.dart';
//
// class Controller extends GetxController {
//   RxInt count = 0.obs;
//   RxList st = [].obs;
//
//   void increment() {
//     count++;
//   }
//
//   void add() {
//     st.add('abc');
//   }
// }
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(context) {
//     // Get.reset();
//     // Instantiate your class using Get.put() to make it available for all "child" routes there.
//     final IncomeAndExpenseController c = Get.put(IncomeAndExpenseController());
//
//     return Scaffold(
//       // Use Obx(()=> to update Text() whenever count is changed.
//       appBar: AppBar(title: Text('getx')),
//
//       // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
//       body: Center(
//           child: Column(
//         children: [
//           Other(),
//           ElevatedButton(
//               child: Text("Go to Other"),
//               onPressed: () => Get.to(() => Other())),
//         ],
//       )),
//       floatingActionButton:
//           FloatingActionButton(child: Icon(Icons.add), onPressed: c.addIt),
//     );
//   }
// }
//
// class Other extends StatelessWidget {
//   // You can ask Get to find a Controller that is being used by another page and redirect you to it.
//   final IncomeAndExpenseController c = Get.find();
//
//   @override
//   Widget build(context) {
//     // Access the updated count variable
//     return Center(
//       child: GetBuilder(
//         init: c,
//         builder: (_) => Column(
//           children: [
//             CarouselSlider(
//               items: c.addItems,
//               options: CarouselOptions(height: 100),
//             ),
//             Text(c.addItems.length.toString()),
//             TextButton(onPressed: () => c.addIt(), child: Text('add'))
//           ],
//         ),
//       ),
//     );
//   }
// }
