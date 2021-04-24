import 'package:flutter/material.dart';

class EmptyTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'No task added yet',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Tasks appear here after you add',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Press the + button to add a task',
              style: TextStyle(fontSize: 16, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
