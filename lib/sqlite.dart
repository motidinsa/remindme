import "dart:io" as io;
import 'package:mytodo/task.dart';
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SqliteDB {
  SqliteDB._internal();

  static final SqliteDB instance = new SqliteDB._internal();

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
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "tasks.db");
    return await openDatabase(path, onCreate: (db, version) {
      db.execute(
        "CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, description TEXT, date TEXT, time TEXT, importance TEXT,dateAdded TEXT,timeAdded TEXT, dateCompleted TEXT, isCompleted INTEGER, hasFrequency INTEGER)",
      );
      db.execute(
        "CREATE TABLE income(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, description TEXT, date TEXT, time TEXT)",
      );
      db.execute(
        "CREATE TABLE expense(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, description TEXT, date TEXT, time TEXT)",
      );
    }, version: 1);
  }

  Future<int> insertTask(Task task, {bool description}) async {
    final Database db = await instance.db;

    return description
        ? await db.insert(
            'task',
            task.toMap(),
            // conflictAlgorithm: ConflictAlgorithm.replace,
          )
        : await db.rawInsert(
            '''INSERT INTO task(name,date,time,importance,dateAdded,timeAdded) VALUES('${task.name}','${task.date}','${task.time}','${task.importance}','${task.dateAdded}','${task.timeAdded}')''',
            // conflictAlgorithm: ConflictAlgorithm.replace,
          );
  }

  Future<List<Task>> tasks() async {
    final Database db = await instance.db;

    // final List<Map<String, dynamic>> maps = await db.query('task');
    final List<Map<String, dynamic>> maps =
        await db.rawQuery('''SELECT * FROM task WHERE isCompleted ISNULL''');
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
        );
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
            hasFrequency: maps[i]['hasFrequency']);
      },
    );
  }

  Future<int> updateTask(Task task, {bool description}) async {
    final db = await instance.db;
    print('${task.id} id');
    print('${task.name} name');
    return description
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

  Future<int> markCompleted(Task task) async {
    final db = await instance.db;
    return await db.rawUpdate(
      '''UPDATE task SET isCompleted = 1 WHERE id = ${task.id}''',
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await instance.db;
    return await db.delete(
      'task',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> queryRowCount() async {
    Database db = await instance.db;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM task'));
  }
}
