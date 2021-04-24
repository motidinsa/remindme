import 'package:meta/meta.dart';
import 'package:mytask/data_provider/task_data.dart';
import 'package:mytask/models/task.dart';

class TaskRepository {
  final TaskDataProvider dataProvider;

  TaskRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<void> insertTask(Task task) async {
    return await dataProvider.insertTask(task);
  }

  Future<List<Task>> tasks() async {
    return await dataProvider.tasks();
  }

  Future<List<Task>> completedTasks() async {
    return await dataProvider.completedTasks();
  }

  Future<int> updateTask(Task task) async {
    return await dataProvider.updateTask(task);
  }

  Future<int> markCompleted(int id) async {
    return await dataProvider.markCompleted(id);
  }

  Future<void> deleteTask(int id) async {
    return await dataProvider.deleteTask(id);
  }

  Future<int> deleteDayTime(int id) async {
    return await dataProvider.deleteDayTime(id);
  }

  Future<int> queryRowCount() async {
    return await dataProvider.queryRowCount();
  }
}
