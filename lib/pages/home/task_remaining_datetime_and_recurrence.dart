import 'package:flutter/material.dart';

class TaskRemainingTimeAndRecurrence extends StatelessWidget {
  final String taskTime;
  final String dateAdded;
  final String timeAdded;
  final String recurTime;

  TaskRemainingTimeAndRecurrence({
    this.taskTime,
    this.dateAdded,
    this.timeAdded,
    this.recurTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.alarm),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      taskTime,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text('6 hrs left', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text('every 3 days'),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
