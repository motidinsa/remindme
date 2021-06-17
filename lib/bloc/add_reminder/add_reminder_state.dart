import 'package:equatable/equatable.dart';

class AddReminderState extends Equatable {
  const AddReminderState();

  @override
  List<Object> get props => [];
}

class NoItemAdded extends AddReminderState {}

class AddDaysSuccess extends AddReminderState {
  final Map<String, String> days;

  AddDaysSuccess(this.days);

  @override
  List<Object> get props => [days];
}

class AddTimeSuccess extends AddReminderState {
  final List<String> time;

  AddTimeSuccess(this.time);

  @override
  List<Object> get props => [time];
}

class AddTaskDateSuccess extends AddReminderState {
  final String date;

  AddTaskDateSuccess(this.date);

  @override
  List<Object> get props => [date];
}
class AddTaskTimeSuccess extends AddReminderState {
  final String time;

  AddTaskTimeSuccess(this.time);

  @override
  List<Object> get props => [time];
}

class AddTaskTimeAndDateSuccess extends AddReminderState {
  final Map<String,String> dateAndtime;

  AddTaskTimeAndDateSuccess(this.dateAndtime);

  @override
  List<Object> get props => [dateAndtime];
}
