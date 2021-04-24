import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mytask/models/task.dart';

class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskLoading extends TaskState {}

class TaskLoadSuccess extends TaskState {
  final List<Task> tasks;

  TaskLoadSuccess(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskOperationFailure extends TaskState {}

class NoSubcategory extends TaskState {}

class AddSubcategorySuccess extends TaskState {
  final Widget widget;

  AddSubcategorySuccess(this.widget);

  @override
  List<Object> get props => [widget];
}

class RemoveSubcategorySuccess extends TaskState {
  RemoveSubcategorySuccess();

  @override
  List<Object> get props => [];
}

class AddIconCategorySuccess extends TaskState {
  final Widget widget;

  AddIconCategorySuccess(this.widget);

  @override
  List<Object> get props => [widget];
}

class RemoveIconSubcategorySuccess extends TaskState {
  RemoveIconSubcategorySuccess();

  @override
  List<Object> get props => [];
}
