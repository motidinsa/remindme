import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../task.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class TaskLoad extends TaskEvent {
  const TaskLoad();

  @override
  List<Object> get props => [];
}

class TaskCreate extends TaskEvent {
  final Task task;

  const TaskCreate(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'Course Created {course: $task}';
}

class DayTimeInsert extends TaskEvent {
  final Map<String, String> days;

  const DayTimeInsert(this.days);

  @override
  List<Object> get props => [days];
}

class TaskUpdate extends TaskEvent {
  final Task task;

  const TaskUpdate(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'Course Updated {course: $task}';
}

class TaskDelete extends TaskEvent {
  final int id;

  const TaskDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Course Deleted {course: $id}';
}

class MarkComplete extends TaskEvent {
  final int id;

  const MarkComplete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Course Deleted {course: $id}';
}

class RefreshTask extends TaskEvent {
  @override
  List<Object> get props => [];

  @override
  toString() => 'Course Deleted {course:}';
}

class InsertSubcategory extends TaskEvent {
  const InsertSubcategory();

  @override
  List<Object> get props => [];
}

class RemoveSubcategory extends TaskEvent {
  const RemoveSubcategory();

  @override
  List<Object> get props => [];
}

class AddIconCategory extends TaskEvent {
  const AddIconCategory();

  @override
  List<Object> get props => [];
}

class RemoveIconSubcategory extends TaskEvent {
  const RemoveIconSubcategory();

  @override
  List<Object> get props => [];
}
