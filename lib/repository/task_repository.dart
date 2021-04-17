import 'package:meta/meta.dart';
import 'package:mytask/data_provider/task_data.dart';
import '../task.dart';

class TaskRepository {
  final TaskDataProvider dataProvider;

  TaskRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<int> insertTask(Task task) async {
    return await dataProvider.insertTask(task);
  }

  Future<int> insertDayFrequency(Map<String, String> dayTime) async {
    return await dataProvider.insertDayFrequency(dayTime);
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

  Future<int> deleteTask(int id) async {
    return await dataProvider.deleteTask(id);
  }

  Future<int> deleteDayTime(int id) async {
    return await dataProvider.deleteDayTime(id);
  }

  Future<int> queryRowCount() async {
    return await dataProvider.queryRowCount();
  }
}
