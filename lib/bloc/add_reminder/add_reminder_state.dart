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

class UpdateDateTimeSuccess extends AddReminderState {
  final Map<String, String> updatedDateTime;

  UpdateDateTimeSuccess(this.updatedDateTime);

  @override
  List<Object> get props => [updatedDateTime];
}

class AddTimeSuccess extends AddReminderState {
  final List<String> time;

  AddTimeSuccess(this.time);

  @override
  List<Object> get props => [time];
}

class AddTimeOnlySuccess extends AddReminderState {
  final String time;

  AddTimeOnlySuccess(this.time);

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

class AddTaskNameSuccess extends AddReminderState {
  final String taskName;

  AddTaskNameSuccess(this.taskName);

  @override
  List<Object> get props => [taskName];
}

class AddTaskDescriptionSuccess extends AddReminderState {
  final String taskDescription;

  AddTaskDescriptionSuccess(this.taskDescription);

  @override
  List<Object> get props => [taskDescription];
}

class AddTaskReminderImportanceSuccess extends AddReminderState {
  final String taskReminderImportance;

  AddTaskReminderImportanceSuccess(this.taskReminderImportance);

  @override
  List<Object> get props => [taskReminderImportance];
}

class AddTaskTimeAndDateSuccess extends AddReminderState {
  final Map<String, String> dateAndtime;

  AddTaskTimeAndDateSuccess(this.dateAndtime);

  @override
  List<Object> get props => [dateAndtime];
}

class AddTaskRecurNumberSuccess extends AddReminderState {
  final String recurNumber;

  AddTaskRecurNumberSuccess(this.recurNumber);

  @override
  List<Object> get props => [recurNumber];
}

class AddTaskRecurDurationSuccess extends AddReminderState {
  final String recurDuration;

  AddTaskRecurDurationSuccess(this.recurDuration);

  @override
  List<Object> get props => [recurDuration];
}

class AddCustomDayTimeSuccess extends AddReminderState {
  final Map<String, String> dayWithTime;

  AddCustomDayTimeSuccess(this.dayWithTime);

  @override
  List<Object> get props => [dayWithTime];
}
