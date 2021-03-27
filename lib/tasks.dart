import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mytodo/empty_todo.dart';
import 'package:mytodo/sqlite.dart';
import 'package:mytodo/task.dart';

import 'add_reminder.dart';

class Tasks extends StatefulWidget {
  final GlobalKey<ScaffoldState> sc;

  Tasks({this.sc});

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  SlidableController slidableController;
  SqliteDB database;
  List<Task> tasks;

  init() async {
    print('init called');

    database = SqliteDB.instance;
    tasks = await database.tasks();
    setState(() {});
  }

  @protected
  void initState() {
    super.initState();
    slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
    init();
  }

  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.blue;

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    setState(() {
      _fabColor = isOpen ? Colors.green : Colors.blue;
    });
  }

  void refreshItem() async {
    tasks = await database.tasks();
  }

  void _showSnackBar(BuildContext context, String text) {
    // _scaffoldKey.currentState.showSnackBar(
    //     SnackBar(content: Text(text)));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? Center(child: CircularProgressIndicator())
        : tasks.length == 0
            ? EmptyTodo()
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, itemIndex) {
                  return Slidable.builder(
                    key: Key(tasks[itemIndex].id.toString()),
                    controller: slidableController,
                    direction: Axis.horizontal,
                    dismissal: SlidableDismissal(
                      child: SlidableDrawerDismissal(),
                      closeOnCanceled: true,
                      onWillDismiss: (actionType) {
                        return actionType == SlideActionType.secondary
                            ? showDialog<bool>(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Delete task?'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                              'The task can not be recovered so be sure when you remove a task'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                          'Confirm',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        onPressed: () {
                                          // database.deleteTask(
                                          //     tasks[itemIndex].id);
                                          Navigator.of(context).pop(true);
                                          // _showSnackBar(context, 'Task deleted successfully');
                                        },
                                      ),
                                    ],
                                  );
                                },
                              )
                            : true;
                      },
                      onDismissed: (actionType) {
                        if (actionType == SlideActionType.primary) {
                          // database.deleteTask(tasks[index].id);
                          database.markCompleted(Task(id: tasks[itemIndex].id));
                          setState(
                            () {
                              tasks.removeAt(itemIndex);
                              // refreshItem();
                            },
                          );
                          _showSnackBar(
                              context, 'Task added to completed list');
                        } else {
                          database.deleteTask(tasks[itemIndex].id);
                          setState(
                            () {
                              tasks.removeAt(itemIndex);
                              // refreshItem();
                            },
                          );
                          _showSnackBar(context, 'Task deleted successfully');
                        }
                      },
                    ),
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.15,
                    actionDelegate: SlideActionBuilderDelegate(
                      actionCount: 1,
                      builder: (context, index, animation, renderingMode) {
                        return IconSlideAction(
                          caption: 'Complete',
                          color: renderingMode == SlidableRenderingMode.slide
                              ? Colors.green.withOpacity(animation.value)
                              : (renderingMode == SlidableRenderingMode.dismiss
                                  ? Colors.green
                                  : Colors.green),
                          icon: Icons.assignment_turned_in_outlined,
                          onTap: () {
                            database
                                .markCompleted(Task(id: tasks[itemIndex].id));
                            setState(
                              () {
                                tasks.removeAt(itemIndex);
                                // refreshItem();
                              },
                            );
                            _showSnackBar(
                                context, 'Task added to completed list');
                          },
                        );
                      },
                    ),
                    secondaryActionDelegate: SlideActionBuilderDelegate(
                        actionCount: 2,
                        builder: (context, index, animation, renderingMode) {
                          if (index == 0) {
                            return IconSlideAction(
                              caption: 'Edit',
                              color: renderingMode ==
                                      SlidableRenderingMode.slide
                                  ? Colors.blueGrey.withOpacity(animation.value)
                                  : Colors.blueGrey,
                              icon: Icons.edit,
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddReminder(
                                              type: 'Edit',
                                              task: tasks[itemIndex],
                                            )))
                              },
                              closeOnTap: false,
                            );
                          } else {
                            return IconSlideAction(
                              // foregroundColor: Colors.blue,
                              caption: 'Delete',
                              color:
                                  renderingMode == SlidableRenderingMode.slide
                                      ? Colors.red.withOpacity(animation.value)
                                      : Colors.redAccent,
                              icon: Icons.delete,
                              onTap: () async {
                                var dismiss = await showDialog<bool>(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Delete task?'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                                'The task can not be recovered so be sure when you remove a task'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            'Confirm',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                            // Scaffold.of(context).showSnackBar(SnackBar(content: Text('deleted')));
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (dismiss == true) {
                                  database.deleteTask(tasks[itemIndex].id);
                                  setState(() {
                                    tasks.removeAt(itemIndex);
                                  });
                                  widget.sc.currentState.showSnackBar(SnackBar(
                                    content: Text('Task successfully deleted'),
                                  ));
                                  // _showSnackBar(
                                  //     context, 'Task deleted successfully');
                                }
                              },
                            );
                          }
                        }),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 1),
                          child: Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        tasks[itemIndex].name,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                tasks[itemIndex].time,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text('6 hrs left',
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () => {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddReminder(
                                                            type: 'Edit',
                                                            task: tasks[
                                                                itemIndex],
                                                          )))
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                      'Date added:   ${tasks[itemIndex].dateAdded}'),
                                  SizedBox(height: 5),
                                  Text(
                                      'Time added:   ${tasks[itemIndex].timeAdded}'),
                                  // SizedBox(height: 10,),
                                  if (tasks[itemIndex].description != null)
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Divider(
                                          height: 25,
                                          color: Colors.grey,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            tasks[itemIndex].description,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
  }
}
