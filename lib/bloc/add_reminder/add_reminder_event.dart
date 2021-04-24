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

class Clear extends AddReminderEvent {
  @override
  List<Object> get props => [];
}
