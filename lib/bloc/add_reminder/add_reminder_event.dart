import 'package:equatable/equatable.dart';

abstract class AddReminderEvent extends Equatable {
  const AddReminderEvent();
}

class AddDays extends AddReminderEvent {
  final Map<String, String> daysSelectedInNumFinal;

  const AddDays(this.daysSelectedInNumFinal);

  @override
  List<Object> get props => [daysSelectedInNumFinal];
}

class AddTime extends AddReminderEvent {
  final List<String> timeSelected;

  const AddTime(this.timeSelected);

  @override
  List<Object> get props => [timeSelected];
}

class AddTaskTime extends AddReminderEvent {
  final String timeSelected;

  const AddTaskTime(this.timeSelected);

  @override
  List<Object> get props => [timeSelected];
}

class AddTaskDate extends AddReminderEvent {
  final String dateSelected;

  const AddTaskDate(this.dateSelected);

  @override
  List<Object> get props => [dateSelected];
}
class AddTaskDateAndTime extends AddReminderEvent {
  final Map<String,String> dateAndTimeSelected;

  const AddTaskDateAndTime(this.dateAndTimeSelected);

  @override
  List<Object> get props => [dateAndTimeSelected];
}
class Clear extends AddReminderEvent {
  @override
  List<Object> get props => [];
}
