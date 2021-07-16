// import 'package:flutter/material.dart';
// import 'package:mytask/pages/add_transaction/expense/expense_detail.dart';
//
// class ExpenseDetailList extends StatefulWidget {
//   final List<ExpenseDetail> expenseList;
//   final bool isLastItem;
//
//   ExpenseDetailList({this.expenseList, this.isLastItem});
//
//   @override
//   _ExpenseDetailListState createState() => _ExpenseDetailListState();
// }
//
// class _ExpenseDetailListState extends State<ExpenseDetailList> {
//   @override
//   Widget build(BuildContext context) {
//     print(widget.expenseList.length.toString()+' len');
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(left: 20, top: 10),
//           child: Text(
//             widget.expenseList.first.title,
//             style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.brown),
//           ),
//         ),
//         ListView.separated(
//           shrinkWrap: true,
//             itemBuilder: (context, index) => index == widget.expenseList.length-1
//                 ? Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       widget.expenseList[index],
//                       Row(
//                         children: [
//                           Expanded(child: Container()),
//                           Expanded(
//                             child: TextButton(
//                               onPressed: () {},
//                               child: Text('Add another'),
//                               style: ButtonStyle(
//                                   foregroundColor: MaterialStateProperty.all<Color>(
//                                       Colors.green)),
//                             ),
//                           ),
//                           Expanded(
//                             child: TextButton(
//                               onPressed: () {},
//                               child: Text('Finish'),
//                               style: ButtonStyle(
//                                   foregroundColor: MaterialStateProperty.all<Color>(
//                                       Colors.green)),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   )
//                 : widget.expenseList[index],
//             separatorBuilder: (context, index) => Divider(),
//             itemCount: widget.expenseList.length),
//       ],
//     );
//   }
// }
