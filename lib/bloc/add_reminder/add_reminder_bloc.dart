import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_reminder_event.dart';
import 'add_reminder_state.dart';

class AddReminderBloc extends Bloc<AddReminderEvent, AddReminderState> {
  AddReminderBloc() : super(NoItemAdded());

  @override
  Stream<AddReminderState> mapEventToState(AddReminderEvent event) async* {
    if (event is AddDays) {
      yield AddDaysSuccess(event.daysSelectedInNumFinal);
    }

    if (event is AddTime) {
      yield AddTimeSuccess(event.timeSelected);
    }

    if (event is Clear) {
      yield NoItemAdded();
    }
  }
}
