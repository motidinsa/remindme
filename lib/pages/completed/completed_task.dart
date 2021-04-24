import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/completed_task/completed_task_bloc.dart';
import 'package:mytask/bloc/completed_task/completed_task_state.dart';

import '../home/empty_todo.dart';

class CompletedTask extends StatefulWidget {
  @override
  _CompletedTaskState createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  bool userValue = true;

  // SqliteDB database;
  // List<Task> tasks;

  init() async {
    print('init called');
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedTaskBloc, CompletedTaskState>(
        builder: (_, state) {
      if (state is CompletedTaskLoadFailure) {
        return Text('Could not do course operation');
      }
      if (state is CompletedTaskLoadSuccess) {
        final tasks = state.tasks;
        print(tasks.length.toString() + ' b');
        return tasks.length == 0
            ? EmptyTodo()
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Card(
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, bottom: 15),
                            child: Text(
                              'task name goes here',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Date added:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey[600]),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            '30-01-2022',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Date completed:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey[600]),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            '02-02-2022',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Transform.scale(
                                    scale: 1.5,
                                    child: Checkbox(
                                      activeColor: Colors.green,
                                      value: userValue,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            userValue = value;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                'This is a short description for the task added',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ))
                        ],
                      ),
                    ),
                  );
                });
      }
      return Center(child: Text('Loading'));
    });
  }
}
