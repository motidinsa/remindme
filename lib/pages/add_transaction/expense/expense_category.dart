import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/expense/expense_bloc.dart';
import 'package:mytask/bloc/expense/expense_event.dart';

// class ExpenseCategoryy extends StatelessWidget {
//   final String categoryName;
//   final Icon icon;
//   final bool isSelected;
//
//   ExpenseCategoryy(this.categoryName, this.icon, this.isSelected);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           InkWell(
//             borderRadius: BorderRadius.circular(100),
//             // highlightColor: Colors.amber,
//             onTap: () {
//               isSelected = !isSelected;
//             },
//             child: Ink(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: isSelected ? Colors.grey[200] : null,
//                     border: Border.all(color: Colors.grey)),
//                 child: icon
//             ),
//           ),
//           Container(
//             width: 60,
//             height: 50,
//             margin: EdgeInsets.only(top: 5),
//             child: Text(
//               categoryName,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
class ExpenseCategoryy extends StatefulWidget {
  final String categoryName;
  final Icon icon;
  final bool isSelected;
  final int id;

  ExpenseCategoryy(this.categoryName, this.icon, this.isSelected, this.id);

  @override
  _ExpenseCategoryyState createState() => _ExpenseCategoryyState();
}

class _ExpenseCategoryyState extends State<ExpenseCategoryy> {
  bool isSelected;

  @override
  // ignore: must_call_super
  void initState() {
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    // isSelected = widget.isSelected;
    print(isSelected.toString() + ' select');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(100),
            // highlightColor: Colors.amber,
            onTap: () {
              setState(
                () {
                  print('setstate');
                  isSelected = !isSelected;
                  if (isSelected) {
                    BlocProvider.of<ExpenseBloc>(context).add(
                      AddExpenseCategory(
                        ExpenseCategoryy(widget.categoryName, widget.icon,
                            widget.isSelected, widget.id),
                      ),
                    );
                  } else {
                    BlocProvider.of<ExpenseBloc>(context).add(
                      RemoveExpenseCategory(widget.id),
                    );
                  }

                  print(isSelected.toString() + ' in the set');
                },
              );
            },
            child: Ink(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isSelected ? Colors.grey[300] : null,
                  border: Border.all(color: Colors.grey),
                ),
                child: widget.icon),
          ),
          Container(
            width: 60,
            height: 50,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              widget.categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
