// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:remindme/models/task.dart';
// import 'package:remindme/pages/home/delete_dialog.dart';
// import 'package:remindme/pages/home/task_datetime.dart';
// import 'package:remindme/pages/home/task_description.dart';
// import 'package:remindme/pages/home/task_remaining_datetime_and_recurrence.dart';
// import 'package:remindme/pages/home/taskname.dart';
// import '../../bloc/task/task_bloc.dart';
// import '../../bloc/task/task_event.dart';
// import 'custom_day_and_time.dart';
// import 'empty_todo.dart';
//
// class Tasks extends StatefulWidget {
//   final GlobalKey<ScaffoldState> sc;
//   final List<Task> tasks;
//
//   Tasks({this.tasks, this.sc});
//
//   @override
//   _TasksState createState() => _TasksState();
// }
//
// class _TasksState extends State<Tasks> {
//   SlidableController slidableController;
//
//   @protected
//   void initState() {
//     super.initState();
//     slidableController = SlidableController();
//   }
//
//   void _showSnackBar(BuildContext context, String text) {
//     Scaffold.of(context).showSnackBar(
//       SnackBar(
//         content: Text(text),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     widget.tasks.length > 0 ? print(widget.tasks[0]) : print('none');
//
//     return widget.tasks.length == 0
//         ? EmptyTodo()
//         : ListView.builder(
//             itemCount: widget.tasks.length,
//             itemBuilder: (context, itemIndex) {
//               Map<String, dynamic> noNulldaysWithTime = {
//                 ...widget.tasks[itemIndex].daysWithTime
//               };
//               noNulldaysWithTime
//                   .removeWhere((key, value) => key == 'id' || value == null);
//               return Slidable.builder(
//                 key: Key(
//                   widget.tasks[itemIndex].id.toString(),
//                 ),
//                 controller: slidableController,
//                 direction: Axis.horizontal,
//                 dismissal: SlidableDismissal(
//                   child: SlidableDrawerDismissal(),
//                   closeOnCanceled: true,
//                   onWillDismiss: (actionType) {
//                     if (actionType == SlideActionType.secondary) {
//                       return showDialog(
//                         context: context,
//                         builder: (context) {
//                           return DeleteDialog(
//                             sc: widget.sc,
//                             id: widget.tasks[itemIndex].id,
//                           );
//                         },
//                       );
//                     } else {
//                       int itemId = widget.tasks[itemIndex].id;
//                       final TaskEvent event = MarkComplete(itemId);
//                       BlocProvider.of<TaskBloc>(context).add(event);
//                       _showSnackBar(context, 'Task added to completed list');
//                       return true;
//                     }
//                   },
//           ),
//           actionPane: SlidableStrechActionPane(),
//           // actionExtentRatio: 0.15,
//           actionDelegate: SlideActionBuilderDelegate(
//             actionCount: 1,
//             builder: (context, index, animation, renderingMode) {
//               return IconSlideAction(
//                 caption: 'Complete',
//                 color: renderingMode == SlidableRenderingMode.slide
//                     ? Colors.green.withOpacity(animation.value)
//                     : (renderingMode == SlidableRenderingMode.dismiss
//                     ? Colors.green
//                     : Colors.green),
//                 icon: Icons.assignment_turned_in_outlined,
//                 onTap: () {
//                   final TaskEvent event =
//                   MarkComplete(widget.tasks[itemIndex].id);
//                   BlocProvider.of<TaskBloc>(context).add(event);
//
//                         _showSnackBar(context, 'Task added to completed list');
//                 },
//               );
//             },
//           ),
//           secondaryActionDelegate: SlideActionBuilderDelegate(
//             actionCount: 1,
//                   builder: (context, index, animation, renderingMode) {
//                     return IconSlideAction(
//                       caption: 'Delete',
//                       color: renderingMode == SlidableRenderingMode.slide
//                           ? Colors.red.withOpacity(animation.value)
//                           : Colors.redAccent,
//                       icon: Icons.delete,
//                       onTap: () {
//                         showDialog<bool>(
//                           context: context,
//                           builder: (context) {
//                             return DeleteDialog(
//                               sc: widget.sc,
//                               id: widget.tasks[itemIndex].id,
//                             );
//                           },
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
//                   child: Card(
//                     elevation: 5,
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               TaskName(
//                                 name: widget.tasks[itemIndex].name,
//                               ),
//                               TaskRemainingTimeAndRecurrence(
//                                 taskTime: widget.tasks[itemIndex].time,
//                                 timeAdded: widget.tasks[itemIndex].timeAdded,
//                                 dateAdded: widget.tasks[itemIndex].dateAdded,
//                                 recurTime: widget.tasks[itemIndex].recurTime,
//                               )
//                             ],
//                           ),
//                           TaskDatetime(
//                             timeAdded: widget.tasks[itemIndex].timeAdded,
//                             dateAdded: widget.tasks[itemIndex].dateAdded,
//                           ),
//                           if (noNulldaysWithTime.length > 0)
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: CustomDayAndTime(
//                                   daysWithTime: noNulldaysWithTime),
//                             ),
//                           if (widget.tasks[itemIndex].description != null)
//                             Column(
//                               children: [
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 Divider(),
//                                 TaskDescription(
//                                     description:
//                                         widget.tasks[itemIndex].description)
//                               ],
//                             )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//       },
//     );
//   }
// }
