import 'package:mytask/models/task.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class TaskDataProvider {
  TaskDataProvider._internal();

  static final TaskDataProvider instance = new TaskDataProvider._internal();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  /// Initialize DB
  initDb() async {
    var documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "tasks.db");
    return await openDatabase(path, onCreate: (db, version) {
      db.execute(
        "CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, description TEXT, date TEXT, time TEXT, importance TEXT,dateAdded TEXT,timeAdded TEXT, dateCompleted TEXT, isCompleted INTEGER,recurTime TEXT, customFrequency INTEGER)",
      );
      db.execute(
        "CREATE TABLE days(id INTEGER PRIMARY KEY AUTOINCREMENT,monday TEXT, tuesday TEXT, wednesday TEXT, thursday TEXT, friday TEXT,saturday TEXT,sunday TEXT)",
      );
      db.execute(
        "CREATE TABLE income(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, description TEXT, date TEXT, time TEXT)",
      );
      db.execute(
        "CREATE TABLE expense(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, description TEXT, date TEXT, time TEXT)",
      );
    }, version: 1);
  }

  Future<void> insertTask(Task task) async {
    final Database db = await instance.db;
    await db.insert(
      'task',
      task.toMap(),
    );
    await db.insert(
      'days',
      task.daysWithTime,
    );
  }

  Future<List<Task>> tasks() async {
    final Database db = await instance.db;
    final List<Map<String, dynamic>> tasks =
        await db.rawQuery('''SELECT * FROM task WHERE isCompleted ISNULL''');
    print(tasks);
    final List<Map<String, dynamic>> daysWithTime =
        await db.rawQuery('''SELECT * FROM days''');
    print(daysWithTime);
    return List.generate(
      tasks.length,
      (i) {
        return Task(
            id: tasks[i]['id'],
            name: tasks[i]['name'],
            description: tasks[i]['description'],
            date: tasks[i]['date'],
            time: tasks[i]['time'],
            importance: tasks[i]['importance'],
            dateAdded: tasks[i]['dateAdded'],
            timeAdded: tasks[i]['timeAdded'],
            isCompleted: tasks[i]['isCompleted'],
            customFrequency: tasks[i]['customFrequency'],
            recurTime: tasks[i]['recurTime'],
            daysWithTime: daysWithTime[i]);
      },
    );
  }

  Future<List<Task>> completedTasks() async {
    final Database db = await instance.db;
    // final List<Map<String, dynamic>> maps = await db.query('task');
    final List<Map<String, dynamic>> maps = await db
        .rawQuery('''SELECT * FROM task WHERE isCompleted IS NOT NULL''');
    return List.generate(
      maps.length,
      (i) {
        return Task(
            id: maps[i]['id'],
            name: maps[i]['name'],
            description: maps[i]['description'],
            date: maps[i]['date'],
            time: maps[i]['time'],
            importance: maps[i]['importance'],
            dateAdded: maps[i]['dateAdded'],
            timeAdded: maps[i]['timeAdded'],
            dateCompleted: maps[i]['dateCompleted'],
            isCompleted: maps[i]['isCompleted'],
            customFrequency: maps[i]['customFrequency'],
            recurTime: maps[i]['recurTime']);
      },
    );
  }

  Future<int> updateTask(Task task) async {
    final Database db = await instance.db;
    print('${task.id} id');
    print('${task.name} name');
    return task.description != null
        ? await db.update(
            'task',
            task.toMap(),
            where: "id = ?",
            whereArgs: [task.id],
          )
        : await db.rawUpdate(
            '''UPDATE task SET name = '${task.name}', description = null, date = '${task.date}', time = '${task.time}', importance = '${task.importance}' WHERE id = ${task.id}''',
            // conflictAlgorithm: ConflictAlgorithm.replace,
          );
  }

  Future<int> markCompleted(int id) async {
    final Database db = await instance.db;
    return await db.rawUpdate(
      '''UPDATE task SET isCompleted = 1 WHERE id = $id''',
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTask(int id) async {
    final Database db = await instance.db;
    await db.delete(
      'task',
      where: "id = ?",
      whereArgs: [id],
    );
    await db.delete(
      'days',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> deleteDayTime(int id) async {
    final Database db = await instance.db;
    return await db.delete(
      'days',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> queryRowCount() async {
    final Database db = await instance.db;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM task'));
  }
}
