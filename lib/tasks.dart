import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mytask/bloc/task_bloc.dart';
import 'package:mytask/bloc/task_state.dart';
import 'package:mytask/empty_todo.dart';
import 'package:mytask/sqlite.dart';
import 'package:mytask/task.dart';
import 'package:mytask/task_route.dart';

import 'add_reminder.dart';
import 'bloc/task_event.dart';

class Tasks extends StatefulWidget {
  final GlobalKey<ScaffoldState> sc;
  final List<Task> tasks;

  Tasks({this.tasks, this.sc});

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  SlidableController slidableController;

  @protected
  void initState() {
    super.initState();
    slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
  }

  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.blue;

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(
      () {
        _rotationAnimation = slideAnimation;
      },
    );
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    setState(
      () {
        _fabColor = isOpen ? Colors.green : Colors.blue;
      },
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.tasks.length == 0
        ? EmptyTodo()
        : ListView.builder(
            itemCount: widget.tasks.length,
            itemBuilder: (context, itemIndex) {
              return Slidable.builder(
                key: Key(
                  widget.tasks[itemIndex].id.toString(),
                ),
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
                                      Navigator.of(context).pop(true);
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
                      int itemId = widget.tasks[itemIndex].id;
                      widget.tasks.removeAt(itemIndex);
                      final TaskEvent event = MarkComplete(itemId);
                      BlocProvider.of<TaskBloc>(context).add(event);
                      _showSnackBar(context, 'Task added to completed list');
                    } else {
                      print('below');
                      int itemId = widget.tasks[itemIndex].id;
                      widget.tasks.removeAt(itemIndex);
                      final TaskEvent event = TaskDelete(itemId);
                      BlocProvider.of<TaskBloc>(context).add(event);
                      _showSnackBar(context, 'Task deleted successfully');
                    }
                  },
                ),
                actionPane: SlidableStrechActionPane(),
                // actionExtentRatio: 0.15,
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
                        // widget.tasks.removeAt(itemIndex);

                        final TaskEvent event =
                            MarkComplete(widget.tasks[itemIndex].id);
                        BlocProvider.of<TaskBloc>(context).add(event);
                        _showSnackBar(context, 'Task added to completed list');
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
                        color: renderingMode == SlidableRenderingMode.slide
                            ? Colors.blueGrey.withOpacity(animation.value)
                            : Colors.blueGrey,
                        icon: Icons.edit,
                        onTap: () => {
                          Navigator.of(context).pushNamed(AddReminder.routeName,
                              arguments: TaskArgument(
                                  task: widget.tasks[itemIndex], edit: true))
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => AddReminder(
                          //       type: 'Edit',
                          //       task: widget.tasks[itemIndex],
                          //     ),
                          //   ),
                          // ),
                        },
                        closeOnTap: false,
                      );
                    } else {
                      return IconSlideAction(
                        caption: 'Delete',
                        color: renderingMode == SlidableRenderingMode.slide
                            ? Colors.red.withOpacity(animation.value)
                            : Colors.redAccent,
                        icon: Icons.delete,
                        onTap: () {
                          showDialog<bool>(
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
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      final TaskEvent event = TaskDelete(
                                          widget.tasks[itemIndex].id);
                                      BlocProvider.of<TaskBloc>(context)
                                          .add(event);
                                      widget.sc.currentState.showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Task deleted successfully'),
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
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
                                    widget.tasks[itemIndex].name,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            widget.tasks[itemIndex].time,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('6 hrs left',
                                              style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () => {
                                          Navigator.of(context).pushNamed(
                                              AddReminder.routeName,
                                              arguments: TaskArgument(
                                                  task: widget.tasks[itemIndex],
                                                  edit: true))
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                  'Date added:   ${widget.tasks[itemIndex].dateAdded}'),
                              SizedBox(height: 5),
                              Text(
                                  'Time added:   ${widget.tasks[itemIndex].timeAdded}'),
// SizedBox(height: 10,),
                              if (widget.tasks[itemIndex].description != null)
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
                                        widget.tasks[itemIndex].description,
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
