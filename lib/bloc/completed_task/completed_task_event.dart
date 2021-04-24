import 'package:equatable/equatable.dart';

abstract class CompletedTaskEvent extends Equatable {
  const CompletedTaskEvent();
}

class CompletedTaskLoad extends CompletedTaskEvent {
  const CompletedTaskLoad();

  @override
  List<Object> get props => [];
}
