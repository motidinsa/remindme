import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/completed_task/completed_task_event.dart';
import 'package:remindme/bloc/completed_task/completed_task_state.dart';
import 'package:remindme/repository/task_repository.dart';

class CompletedTaskBloc extends Bloc<CompletedTaskEvent, CompletedTaskState> {
  final TaskRepository taskRepository;

  CompletedTaskBloc({@required this.taskRepository})
      : assert(taskRepository != null),
        super(CompletedTaskLoading());

  @override
  Stream<CompletedTaskState> mapEventToState(CompletedTaskEvent event) async* {
    if (event is CompletedTaskLoad) {
      try {
        final completedTasks = await taskRepository.completedTasks();
        yield CompletedTaskLoadSuccess(completedTasks);
      } catch (_) {
        yield CompletedTaskLoadFailure();
      }
    }
  }
}
