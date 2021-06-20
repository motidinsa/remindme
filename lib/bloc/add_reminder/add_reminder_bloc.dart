import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_reminder_event.dart';
import 'add_reminder_state.dart';

class AddReminderBloc extends Bloc<AddReminderEvent, AddReminderState> {
  AddReminderBloc() : super(NoItemAdded());

  @override
  Stream<AddReminderState> mapEventToState(AddReminderEvent event) async* {
    if (event is AddDays) {
      yield AddDaysSuccess(event.daysSelected);
    }
    if (event is UpdateDateTime) {
      yield UpdateDateTimeSuccess(event.updatedDateTime);
    }
    if (event is AddTime) {
      yield AddTimeSuccess(event.timeSelected);
    }
    if (event is AddTaskTime) {
      yield AddTaskTimeSuccess(event.timeSelected);
    }
    if (event is AddTimeOnly) {
      yield AddTimeOnlySuccess(event.timeSelected);
    }
    if (event is AddTaskDate) {
      yield AddTaskDateSuccess(event.dateSelected);
    }
    if (event is AddTaskDateAndTime) {
      yield AddTaskTimeAndDateSuccess(event.dateAndTimeSelected);
    }
    if (event is AddTaskName) {
      yield AddTaskNameSuccess(event.taskName);
    }
    if (event is AddTaskDescription) {
      yield AddTaskDescriptionSuccess(event.taskDescription);
    }
    if (event is AddTaskReminderImportance) {
      yield AddTaskReminderImportanceSuccess(event.taskReminderImportance);
    }
    if (event is AddTaskRecurNumber) {
      yield AddTaskRecurNumberSuccess(event.recurNumber);
    }
    if (event is AddTaskRecurDuration) {
      yield AddTaskRecurDurationSuccess(event.recurDuration);
    }
    if (event is AddCustomDayTime) {
      yield AddCustomDayTimeSuccess(event.dayWithTime);
    }
    if (event is Clear) {
      yield NoItemAdded();
    }
  }
}
