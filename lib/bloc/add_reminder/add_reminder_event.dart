import 'package:equatable/equatable.dart';

abstract class AddReminderEvent extends Equatable {
  const AddReminderEvent();
}

class AddDays extends AddReminderEvent {
  final Map<String, String> daysSelected;

  const AddDays(this.daysSelected);

  @override
  List<Object> get props => [daysSelected];
}

class UpdateDateTime extends AddReminderEvent {
  final Map<String, String> updatedDateTime;

  const UpdateDateTime(this.updatedDateTime);

  @override
  List<Object> get props => [updatedDateTime];
}

class AddTime extends AddReminderEvent {
  final List<String> timeSelected;

  const AddTime(this.timeSelected);

  @override
  List<Object> get props => [timeSelected];
}

class AddTimeOnly extends AddReminderEvent {
  final String timeSelected;

  const AddTimeOnly(this.timeSelected);

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
  final Map<String, String> dateAndTimeSelected;

  const AddTaskDateAndTime(this.dateAndTimeSelected);

  @override
  List<Object> get props => [dateAndTimeSelected];
}

class AddTaskName extends AddReminderEvent {
  final String taskName;

  const AddTaskName(this.taskName);

  @override
  List<Object> get props => [taskName];
}

class AddTaskDescription extends AddReminderEvent {
  final String taskDescription;

  const AddTaskDescription(this.taskDescription);

  @override
  List<Object> get props => [taskDescription];
}

class AddTaskReminderImportance extends AddReminderEvent {
  final String taskReminderImportance;

  const AddTaskReminderImportance(this.taskReminderImportance);

  @override
  List<Object> get props => [taskReminderImportance];
}

class AddTaskRecurNumber extends AddReminderEvent {
  final String recurNumber;

  const AddTaskRecurNumber(this.recurNumber);

  @override
  List<Object> get props => [recurNumber];
}

class AddTaskRecurDuration extends AddReminderEvent {
  final String recurDuration;

  const AddTaskRecurDuration(this.recurDuration);

  @override
  List<Object> get props => [recurDuration];
}

class AddCustomDayTime extends AddReminderEvent {
  final Map<String, String> dayWithTime;

  const AddCustomDayTime(this.dayWithTime);

  @override
  List<Object> get props => [dayWithTime];
}

class Clear extends AddReminderEvent {
  @override
  List<Object> get props => [];
}
