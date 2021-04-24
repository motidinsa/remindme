import 'package:equatable/equatable.dart';
import 'package:mytask/models/task.dart';

class CompletedTaskState extends Equatable {
  const CompletedTaskState();

  @override
  List<Object> get props => [];
}

class CompletedTaskLoading extends CompletedTaskState {}

class CompletedTaskLoadSuccess extends CompletedTaskState {
  final List<Task> tasks;

  CompletedTaskLoadSuccess(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class CompletedTaskLoadFailure extends CompletedTaskState {}
