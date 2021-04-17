import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/task_event.dart';
import 'package:mytask/bloc/task_state.dart';
import 'package:mytask/subcategory.dart';

class SubcategoryBloc extends Bloc<TaskEvent, TaskState> {
  SubcategoryBloc() : super(NoSubcategory());

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is InsertSubcategory) {
      Widget subcategory = Subcategory();
      yield AddSubcategorySuccess(subcategory);
    }
    if (event is RemoveSubcategory) {
      yield RemoveSubcategorySuccess();
    }
    if (event is AddIconCategory) {
      Widget iconCategory = IconSubcategory();
      yield AddIconCategorySuccess(iconCategory);
    }

    if (event is RemoveIconSubcategory) {
      yield RemoveIconSubcategorySuccess();
    }
  }
}
