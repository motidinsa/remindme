import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/task/task_event.dart';
import 'package:mytask/bloc/task/task_state.dart';
import 'package:mytask/models/task.dart';
import 'package:mytask/pages/setting/add_subcategory/subcategory.dart';
import 'package:mytask/repository/task_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc({@required this.taskRepository})
      : assert(taskRepository != null),
        super(TaskLoading());

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is TaskLoad) {
      yield TaskLoading();
      try {
        final tasks = await taskRepository.tasks();
        yield TaskLoadSuccess(tasks);
      } catch (_) {
        yield TaskOperationFailure();
      }
    }

    if (event is TaskCreate) {
      try {
        await taskRepository.insertTask(event.task);
        final tasks = await taskRepository.tasks();
        yield TaskLoadSuccess(tasks);
      } catch (_) {
        yield TaskOperationFailure();
      }
    }

    if (event is TaskUpdate) {
      try {
        await taskRepository.updateTask(event.task);
        final tasks = await taskRepository.tasks();
        yield TaskLoadSuccess(tasks);
      } catch (_) {
        yield TaskOperationFailure();
      }
    }

    if (event is TaskDelete) {
      try {
        await taskRepository.deleteTask(event.id);
        await taskRepository.deleteDayTime(event.id);
        final tasks = await taskRepository.tasks();
        yield TaskLoadSuccess(tasks);
      } catch (_) {
        yield TaskOperationFailure();
      }
    }
    if (event is MarkComplete) {
      try {
        await taskRepository.markCompleted(event.id);
        final tasks = await taskRepository.tasks();
        yield TaskLoadSuccess(tasks);
      } catch (_) {
        yield TaskOperationFailure();
      }
    }

    if (event is RefreshTask) {
      try {
        final tasks = await taskRepository.tasks();
        yield TaskLoadSuccess(tasks);
      } catch (_) {
        yield TaskOperationFailure();
      }
    }

    if (event is InsertSubcategory) {
      try {
        Widget subcategory = Subcategory();
        yield AddSubcategorySuccess(subcategory);
      } catch (_) {
        yield TaskOperationFailure();
      }
    }
    if (event is RemoveSubcategory) {
      try {
        yield RemoveSubcategorySuccess();
      } catch (_) {
        yield TaskOperationFailure();
      }
    }
    if (event is AddIconCategory) {
      try {
        Widget iconCategory = IconSubcategory();
        yield AddIconCategorySuccess(iconCategory);
      } catch (_) {
        yield TaskOperationFailure();
      }
    }

    if (event is RemoveIconSubcategory) {
      try {
        yield RemoveIconSubcategorySuccess();
      } catch (_) {
        yield TaskOperationFailure();
      }
    }
  }
}
