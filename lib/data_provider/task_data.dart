import 'package:remindme/models/expense_and_income.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/expense_tobe_added.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/models/setting_configuration.dart';
import 'package:remindme/models/task.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';
import 'package:remindme/pages/setting/add_reason/sub_subcategory_reason_page.dart';
import 'package:remindme/pages/setting/add_reason/subcategory_reason_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
import 'package:intl/src/intl/date_format.dart';

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
        "CREATE TABLE expense_and_income(id INTEGER PRIMARY KEY AUTOINCREMENT,user_id INTEGER,category_id INTEGER,category_name TEXT, net_amount TEXT,total_amount TEXT, reason TEXT, reason_id INTEGER, subcategory_id INTEGER, sub_subcategory_id INTEGER,date TEXT,added_date TEXT, added_time TEXT, changed_date TEXT,changed_time TEXT,date_type TEXT, category_type TEXT, number_of_times INTEGER)",
      );
      db.execute(
        "CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT,user_id INTEGER,name TEXT, icon_name TEXT, icon_type TEXT, date TEXT, time TEXT, changed_date TEXT,changed_time TEXT,date_type TEXT, category_type TEXT)",
      );
      db.execute(
        "CREATE TABLE subcategory(id INTEGER PRIMARY KEY AUTOINCREMENT,user_id INTEGER,name TEXT, icon_name TEXT, icon_type TEXT, date TEXT, time TEXT, category_id INTEGER, changed_date TEXT,changed_time TEXT,date_type TEXT, subcategory_type TEXT)",
      );
      db.execute(
        "CREATE TABLE sub_subcategory(id INTEGER PRIMARY KEY AUTOINCREMENT,user_id INTEGER,name TEXT, date TEXT, time TEXT, category_id INTEGER,sub_category_id INTEGER, changed_date TEXT,changed_time TEXT,date_type TEXT, sub_subcategory_type TEXT)",
      );
      db.execute(
        "CREATE TABLE reason(id INTEGER PRIMARY KEY AUTOINCREMENT,user_id INTEGER,name TEXT, category_id INTEGER,subcategory_id INTEGER,sub_subcategory_id INTEGER, date TEXT, time TEXT, current_amount TEXT, date_type TEXT)",
      );
      db.execute(
        "CREATE TABLE previous_reason(id INTEGER PRIMARY KEY AUTOINCREMENT,user_id INTEGER,reason_id INTEGER,name TEXT, category_id INTEGER,subcategory_id INTEGER,sub_subcategory_id INTEGER, date TEXT, time TEXT, amount TEXT,date_type TEXT)",
      );
      db.execute(
        "CREATE TABLE setting_configuration(id INTEGER PRIMARY KEY AUTOINCREMENT,user_id INTEGER, name TEXT, parameter_setting TEXT)",
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

  Future<void> insertExpense(ExpenseTobeAdded expense) async {
    final Database db = await instance.db;
    await db.insert(
      'expense_and_income',
      expense.toMap(),
    );
  }

  Future<void> insertExpenses(List<FinishedCategory> finishedCategories,
      List<List<ExpenseDetail>> expenseDetails, String type) async {
    List<ExpenseTobeAdded> expense1 =
        finishedCategoryToExpenseTobeAdded(finishedCategories, type);
    List<ExpenseTobeAdded> expense2 =
        expenseDetailToExpenseTobeAdded(expenseDetails, type);
    // final Database db = await instance.db;
    for (int i = 0; i < expense1.length; i++) {
      await insertExpense(expense1[i]);
    }
    for (int i = 0; i < expense2.length; i++) {
      await insertExpense(expense2[i]);
    }
  }

  Future<List<ExpenseAndIncome>> allExpenses() async {
    final Database db = await instance.db;

    final List<Map<String, dynamic>> expenses =
        await db.rawQuery('''SELECT * FROM income_and_expense''');
    // final List<Map<String, dynamic>> daysWithTime =
    // await db.rawQuery('''SELECT * FROM days''');
    print('inside all ${expenses.length}');
    return List.generate(
      expenses.length,
      (i) {
        return ExpenseAndIncome(
          id: expenses[i]['id'],
          categoryID: expenses[i]['category_ID'],
          categoryName: expenses[i]['category_name'],
          netAmount: expenses[i]['net_amount'],
          totalAmount: expenses[i]['total_amount'],
          numberOfTimes: expenses[i]['number_of_times'],
          reason: expenses[i]['reason'],
          reasonID: expenses[i]['reason_id'],
          subcategoryID: expenses[i]['subcategory_ID'],
          subcategoryName: expenses[i]['subcategory_name'],
          dateType: expenses[i]['date_type'],
          date: expenses[i]['date'],
          addedTime: expenses[i]['added_time'],
          addedDate: expenses[i]['added_date'],
          changedDate: expenses[i]['changed_date'],
        );
      },
    );
  }

  Future<List<ExpenseAndIncome>> getAllIncomeAndExpense() async {
    final Database db = await instance.db;

    final List<Map<String, dynamic>> expenses = await db
        .rawQuery('''SELECT * FROM expense_and_income ORDER BY id desc''');
    // final List<Map<String, dynamic>> daysWithTime =
    // await db.rawQuery('''SELECT * FROM days''');
    print('inside all ${expenses.length}');
    return List.generate(
      expenses.length,
      (i) {
        return ExpenseAndIncome(
            id: expenses[i]['id'],
            categoryID: expenses[i]['category_id'],
            categoryName: expenses[i]['category_name'],
            netAmount: expenses[i]['net_amount'],
            totalAmount: expenses[i]['total_amount'],
            numberOfTimes: expenses[i]['number_of_times'],
            reason: expenses[i]['reason'],
            reasonID: expenses[i]['reason_id'],
            subcategoryID: expenses[i]['subcategory_id'],
            subsubcategoryID: expenses[i]['sub_subcategory_id'],
            subcategoryName: expenses[i]['subcategory_name'],
            dateType: expenses[i]['date_type'],
            date: expenses[i]['date'],
            addedTime: expenses[i]['added_time'],
            addedDate: expenses[i]['added_date'],
            changedDate: expenses[i]['changed_date'],
            categoryType: expenses[i]['category_type']);
      },
    );
  }

  Future<List<ExpenseAndIncome>> dailyExpenses() async {
    final Database db = await instance.db;
    String today =
        '${DateTime.now().year}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}';

    // await expenses();
    //  Future<List<Expense>> allExpenses =await expenses();
    final List<Map<String, dynamic>> expenses = await db
        .rawQuery('''SELECT * FROM income_and_expense WHERE date = oi''');
    // final List<Map<String, dynamic>> daysWithTime =
    // await db.rawQuery('''SELECT * FROM days''');
    // print(daysWithTime);
    return List.generate(
      expenses.length,
      (i) {
        return ExpenseAndIncome(
          id: expenses[i]['id'],
          categoryID: expenses[i]['category_ID'],
          categoryName: expenses[i]['category_name'],
          netAmount: expenses[i]['net_amount'],
          totalAmount: expenses[i]['total_amount'],
          reason: expenses[i]['reason'],
          reasonID: expenses[i]['reason_id'],
          subcategoryID: expenses[i]['subcategory_ID'],
          subcategoryName: expenses[i]['subcategory_name'],
          dateType: expenses[i]['date_type'],
          date: expenses[i]['date'],
          addedTime: expenses[i]['added_time'],
          addedDate: expenses[i]['added_date'],
          changedDate: expenses[i]['changed_date'],
          numberOfTimes: expenses[i]['number_of_times'],
        );
      },
    );
  }

  Future<void> initializeCategoryAndSubcategory() async {
    final Database db = await instance.db;
    // String today =
    //     '${DateTime.now().year}-${DateTime.now().month > 9 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().day > 9 ? DateTime.now().day : '0${DateTime.now().day}'}';
    DateTime now = DateTime.now();

    DateFormat dateFormat = DateFormat("dd-MM-yy");
    DateFormat timeFormat = DateFormat("HH:mm:ss");
    String currentDate = dateFormat.format(now);
    String currentTime = timeFormat.format(now);
    List<IncomeAndExpenseCategoryModel> expenseAndIncomeCategory = [
      IncomeAndExpenseCategoryModel(
        userID: 1,
        categoryType: 'Expense',
        categoryName: 'Transport',
        dateType: 'gr',
        dateAdded: currentDate,
        iconName: 'directions_bus',
        iconType: 'material',
        timeAdded: currentTime,
      )
    ];
    List<IncomeAndExpenseSubCategoryModel> expenseAndIncomeSubcategory = [
      IncomeAndExpenseSubCategoryModel(
          userID: 1,
          subcategoryType: 'Expense',
          subcategoryName: 'Bus',
          dateType: 'gr',
          dateAdded: currentDate,
          iconName: 'directions_bus',
          iconType: 'material',
          timeAdded: currentTime,
          categoryID: 1),
      IncomeAndExpenseSubCategoryModel(
          userID: 1,
          subcategoryType: 'Expense',
          subcategoryName: 'Taxi',
          dateType: 'gr',
          dateAdded: currentDate,
          iconName: 'local_taxi',
          iconType: 'material',
          timeAdded: currentTime,
          categoryID: 1)
    ];
    List<IncomeAndExpenseSubSubCategoryModel> expenseAndIncomeSubSubcategory = [
      IncomeAndExpenseSubSubCategoryModel(
          userID: 1,
          subSubcategoryType: 'Expense',
          subSubcategoryName: 'Anbessa',
          dateType: 'gr',
          dateAdded: currentDate,
          timeAdded: currentTime,
          categoryID: 1,
          subcategoryID: 1),
      IncomeAndExpenseSubSubCategoryModel(
          userID: 1,
          subSubcategoryType: 'Expense',
          subSubcategoryName: 'Sheger',
          dateType: 'gr',
          dateAdded: currentDate,
          timeAdded: currentTime,
          categoryID: 1,
          subcategoryID: 1),
      IncomeAndExpenseSubSubCategoryModel(
          userID: 1,
          subSubcategoryType: 'Expense',
          subSubcategoryName: 'Public service',
          dateType: 'gr',
          dateAdded: currentDate,
          timeAdded: currentTime,
          categoryID: 1,
          subcategoryID: 1)
    ];
    List<SettingConfiguration> settings = [
      SettingConfiguration(
          name: 'isCategoryInitialized', parameterSetting: 'yes', userID: 1)
    ];
    await initializeCategory(expenseAndIncomeCategory);
    await initializeSubCategory(expenseAndIncomeSubcategory);
    await initializeSubSubCategory(expenseAndIncomeSubSubcategory);
    await initializeSettingConfiguration(settings);
  }

  Future<void> initializeCategory(
      List<IncomeAndExpenseCategoryModel> expenseAndIncomeCategory) async {
    final Database db = await instance.db;
    for (int i = 0; i < expenseAndIncomeCategory.length; i++) {
      await db.insert(
        'category',
        expenseAndIncomeCategory[i].toMap(),
      );
    }
  }

  Future<void> initializeSubCategory(
      List<IncomeAndExpenseSubCategoryModel>
          expenseAndIncomeSubCategory) async {
    final Database db = await instance.db;
    for (int i = 0; i < expenseAndIncomeSubCategory.length; i++) {
      await db.insert(
        'subcategory',
        expenseAndIncomeSubCategory[i].toMap(),
      );
    }
  }

  Future<void> initializeSubSubCategory(
      List<IncomeAndExpenseSubSubCategoryModel>
          expenseAndIncomeSubSubCategory) async {
    final Database db = await instance.db;
    for (int i = 0; i < expenseAndIncomeSubSubCategory.length; i++) {
      await db.insert(
        'sub_subcategory',
        expenseAndIncomeSubSubCategory[i].toMap(),
      );
    }
  }

  Future<void> initializeSettingConfiguration(
      List<SettingConfiguration> settingConfiguration) async {
    final Database db = await instance.db;
    for (int i = 0; i < settingConfiguration.length; i++) {
      await db.insert(
        'setting_configuration',
        settingConfiguration[i].toMap(),
      );
    }
  }

  Future<List<SettingConfiguration>> getInitializedParameters() async {
    final Database db = await instance.db;
    final settings =
        await db.rawQuery('''SELECT * FROM setting_configuration''');

    return List.generate(
      settings.length,
      (i) {
        return SettingConfiguration(
          name: settings[i]['name'],
          parameterSetting: settings[i]['parameter_setting'],
        );
      },
    );
  }

  Future<List<IncomeAndExpenseCategoryModel>> getAllCategories() async {
    final Database db = await instance.db;
    final categories = await db.rawQuery('''SELECT * FROM category''');

    return List.generate(categories.length, (i) {
      return IncomeAndExpenseCategoryModel(
          id: categories[i]['id'],
          categoryName: categories[i]['name'],
          timeAdded: categories[i]['time'],
          iconType: categories[i]['icon_type'],
          iconName: categories[i]['icon_name'],
          dateAdded: categories[i]['date'],
          dateType: categories[i]['date_type'],
          categoryType: categories[i]['category_type'],
          changedDate: categories[i]['changed_date'],
          changedTime: categories[i]['changed_time']);
    });
  }

  Future<List<IncomeAndExpenseCategoryModel>> getAllExpenseCategory() async {
    final Database db = await instance.db;
    final categories = await db.rawQuery(
        '''SELECT * FROM category where category_type = 'Expense' or category_type = 'both' ''');

    return List.generate(categories.length, (i) {
      return IncomeAndExpenseCategoryModel(
          id: categories[i]['id'],
          categoryName: categories[i]['name'],
          timeAdded: categories[i]['time'],
          iconType: categories[i]['icon_type'],
          iconName: categories[i]['icon_name'],
          dateAdded: categories[i]['date'],
          dateType: categories[i]['date_type'],
          categoryType: categories[i]['category_type'],
          changedDate: categories[i]['changed_date'],
          changedTime: categories[i]['changed_time']);
    });
  }

  Future<List<IncomeAndExpenseCategoryModel>> getAllIncomeCategory() async {
    final Database db = await instance.db;
    final categories = await db.rawQuery(
        '''SELECT * FROM category where category_type = 'Income' or category_type = 'both' ''');

    return List.generate(categories.length, (i) {
      return IncomeAndExpenseCategoryModel(
          id: categories[i]['id'],
          categoryName: categories[i]['name'],
          timeAdded: categories[i]['time'],
          iconType: categories[i]['icon_type'],
          iconName: categories[i]['icon_name'],
          dateAdded: categories[i]['date'],
          dateType: categories[i]['date_type'],
          categoryType: categories[i]['category_type'],
          changedDate: categories[i]['changed_date'],
          changedTime: categories[i]['changed_time']);
    });
  }

  Future<List<IncomeAndExpenseSubCategoryModel>> getAllSubCategories() async {
    final Database db = await instance.db;
    final subCategories = await db.rawQuery('''SELECT * FROM subcategory''');

    return List.generate(subCategories.length, (i) {
      return IncomeAndExpenseSubCategoryModel(
          id: subCategories[i]['id'],
          subcategoryName: subCategories[i]['name'],
          timeAdded: subCategories[i]['time'],
          iconType: subCategories[i]['icon_type'],
          iconName: subCategories[i]['icon_name'],
          dateAdded: subCategories[i]['date'],
          dateType: subCategories[i]['date_type'],
          subcategoryType: subCategories[i]['subcategory_type'],
          changedDate: subCategories[i]['changed_date'],
          changedTime: subCategories[i]['changed_time'],
          categoryID: subCategories[i]['category_id']);
    });
  }

  Future<List<IncomeAndExpenseSubCategoryModel>>
      getAllSubCategoriesWithCategoryID(int categoryID) async {
    final Database db = await instance.db;
    final subCategories = await db.rawQuery(
        '''SELECT * FROM subcategory where category_id = $categoryID''');

    return List.generate(subCategories.length, (i) {
      return IncomeAndExpenseSubCategoryModel(
          id: subCategories[i]['id'],
          subcategoryName: subCategories[i]['name'],
          timeAdded: subCategories[i]['time'],
          iconType: subCategories[i]['icon_type'],
          iconName: subCategories[i]['icon_name'],
          dateAdded: subCategories[i]['date'],
          dateType: subCategories[i]['date_type'],
          subcategoryType: subCategories[i]['subcategory_type'],
          changedDate: subCategories[i]['changed_date'],
          changedTime: subCategories[i]['changed_time'],
          categoryID: subCategories[i]['category_id']);
    });
  }

  Future<List<IncomeAndExpenseSubCategoryModel>>
      getSubcategoryWithSubcategoryID(int subcategoryID) async {
    final Database db = await instance.db;
    final subCategories = await db
        .rawQuery('''SELECT * FROM subcategory where id = $subcategoryID''');

    return List.generate(subCategories.length, (i) {
      return IncomeAndExpenseSubCategoryModel(
          id: subCategories[i]['id'],
          subcategoryName: subCategories[i]['name'],
          timeAdded: subCategories[i]['time'],
          iconType: subCategories[i]['icon_type'],
          iconName: subCategories[i]['icon_name'],
          dateAdded: subCategories[i]['date'],
          dateType: subCategories[i]['date_type'],
          subcategoryType: subCategories[i]['subcategory_type'],
          changedDate: subCategories[i]['changed_date'],
          changedTime: subCategories[i]['changed_time'],
          categoryID: subCategories[i]['category_id']);
    });
  }

  Future<List<IncomeAndExpenseSubSubCategoryModel>>
      getAllSubSubCategoriesWithSubCategoryID(int subcategoryID) async {
    final Database db = await instance.db;
    final subCategories = await db.rawQuery(
        '''SELECT * FROM sub_subcategory where sub_category_id = $subcategoryID''');

    return List.generate(subCategories.length, (i) {
      return IncomeAndExpenseSubSubCategoryModel(
          id: subCategories[i]['id'],
          subSubcategoryName: subCategories[i]['name'],
          timeAdded: subCategories[i]['time'],
          dateAdded: subCategories[i]['date'],
          dateType: subCategories[i]['date_type'],
          subSubcategoryType: subCategories[i]['subcategory_type'],
          changedDate: subCategories[i]['changed_date'],
          changedTime: subCategories[i]['changed_time'],
          categoryID: subCategories[i]['category_id']);
    });
  }

  Future<List<IncomeAndExpenseSubSubCategoryModel>>
      getAllSubSubCategories() async {
    final Database db = await instance.db;
    final subSubCategories =
        await db.rawQuery('''SELECT * FROM sub_subcategory''');

    return List.generate(subSubCategories.length, (i) {
      return IncomeAndExpenseSubSubCategoryModel(
          id: subSubCategories[i]['id'],
          subSubcategoryName: subSubCategories[i]['name'],
          timeAdded: subSubCategories[i]['time'],
          dateAdded: subSubCategories[i]['date'],
          dateType: subSubCategories[i]['date_type'],
          subSubcategoryType: subSubCategories[i]['sub_subcategory_type'],
          changedDate: subSubCategories[i]['changed_date'],
          changedTime: subSubCategories[i]['changed_time'],
          categoryID: subSubCategories[i]['category_id'],
          subcategoryID: subSubCategories[i]['sub_category_id']);
    });
  }

  Future<int> insertCategory(IncomeAndExpenseCategoryModel category) async {
    final Database db = await instance.db;
    await db.insert('category', category.toMap());
    final lastCategoryID = await db
        .rawQuery('''SELECT * FROM category ORDER BY id DESC LIMIT 1''');
    print(lastCategoryID);
    print(lastCategoryID[0]['id']);
    return lastCategoryID[0]['id'];
  }

  Future<int> insertSubCategory(
      IncomeAndExpenseSubCategoryModel subcategory, int categoryID) async {
    final Database db = await instance.db;
    // List<ExpenseAndIncomeSubCategoryModel> subcategories = [...subcategory];
    // subcategories.forEach((element) {
    //   element.categoryID = categoryID;
    // });
    // for (int i = 0; i < subcategory.length; i++) {
    await db.insert('subcategory', subcategory.toMap());
    // }

    final lastCategoryID = await db
        .rawQuery('''SELECT * FROM subcategory ORDER BY id DESC LIMIT 1''');
    // print(lastCategoryID);
    // print(lastCategoryID[0]['id']);
    return lastCategoryID[0]['id'];
  }

  Future<void> updateSubCategory(
      List<IncomeAndExpenseSubCategoryModel> subcategory) async {
    final Database db = await instance.db;
    for (int i = 0; i < subcategory.length; i++)
      await db.insert('subcategory', subcategory[i].toMap());
  }

  Future<void> insertSubSubCategory(
      List<IncomeAndExpenseSubSubCategoryModel> subSubcategory,
      int categoryID,
      int subcategoryID) async {
    final Database db = await instance.db;
    List<IncomeAndExpenseSubSubCategoryModel> subSubcategories = [
      ...subSubcategory
    ];
    print(subSubcategories.length.toString() + ' le');
    print(categoryID.toString() + ' ' + subcategoryID.toString());
    subSubcategories.forEach((element) {
      print(element.subSubcategoryName);
    });
    subSubcategories.forEach((element) {
      element.categoryID = categoryID;
      element.subcategoryID = subcategoryID;
    });

    for (int i = 0; i < subSubcategories.length; i++) {
      await db.insert('sub_subcategory', subSubcategories[i].toMap());
    }

    // final lastCategoryID = await db
    //     .rawQuery('''SELECT * FROM subcategory ORDER BY id DESC LIMIT 1''');
    // print(lastCategoryID);
    // print(lastCategoryID[0]['id']);
    // return lastCategoryID[0]['id'];
  }

  Future<void> updateSubSubCategory(
      List<IncomeAndExpenseSubSubCategoryModel> subcategory) async {
    final Database db = await instance.db;
    for (int i = 0; i < subcategory.length; i++)
      await db.insert('sub_subcategory', subcategory[i].toMap());
  }

  Future<void> insertCategoryReason(
    List<Reason> categoryReason,
  ) async {
    final Database db = await instance.db;
    for (int i = 0; i < categoryReason.length; i++) {
      await db.insert('reason', categoryReason[i].toMap());
    }
  }

  Future<void> insertSubCategoryReason(
    List<SubCategoryReasonPage> subcategoryReason,
  ) async {
    final Database db = await instance.db;
    for (int i = 0; i < subcategoryReason.length; i++) {
      for (int j = 0;
          j < subcategoryReason[i].subcategoryReasonModelList.length;
          j++) {
        await db.insert('reason',
            subcategoryReason[i].subcategoryReasonModelList[j].toMap());
      }
    }
  }

  Future<void> insertSubSubCategoryReason(
    List<List<Reason>> subsubcategoryReason,
  ) async {
    final Database db = await instance.db;

    for (int i = 0; i < subsubcategoryReason.length; i++) {
      for (int j = 0; j < subsubcategoryReason[i].length; j++) {
        await db.insert('reason', subsubcategoryReason[i][j].toMap());
      }
    }
    // for (int i = 0; i < subsubcategoryReason.length; i++) {
    //   for (int j = 0;
    //   j < subsubcategoryReason[i].subcategoryReasonModelList.length;
    //   j++) {
    //     await db.insert('reason',
    //         subsubcategoryReason[i].subcategoryReasonModelList[j].toMap());
    //   }
    // }
  }

  Future<List<Reason>> getCategoryReasons(int categoryID) async {
    final Database db = await instance.db;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        '''SELECT * FROM reason WHERE category_id = $categoryID and subcategory_id is NULL and sub_subcategory_id is NULL''');
    return List.generate(
      maps.length,
      (i) {
        return Reason(
          id: maps[i]['id'],
          name: maps[i]['name'],
          categoryID: maps[i]['category_id'],
          date: maps[i]['date'],
          time: maps[i]['time'],
          amount: maps[i]['current_amount'],
        );
      },
    );
  }

  Future<List<Reason>> getSubCategoryReasons(int subcategoryID) async {
    final Database db = await instance.db;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        '''SELECT * FROM reason WHERE subcategory_id = $subcategoryID and sub_subcategory_id is NULL''');
    return List.generate(
      maps.length,
      (i) {
        return Reason(
          id: maps[i]['id'],
          name: maps[i]['name'],
          categoryID: maps[i]['category_id'],
          subcategoryID: maps[i]['subcategory_id'],
          date: maps[i]['date'],
          time: maps[i]['time'],
          amount: maps[i]['current_amount'],
        );
      },
    );
  }

  Future<List<Reason>> getSubSubCategoryReasons(int subsubcategoryID) async {
    final Database db = await instance.db;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        '''SELECT * FROM reason WHERE sub_subcategory_id = $subsubcategoryID''');
    return List.generate(
      maps.length,
      (i) {
        return Reason(
          id: maps[i]['id'],
          name: maps[i]['name'],
          categoryID: maps[i]['category_id'],
          subcategoryID: maps[i]['subcategory_id'],
          date: maps[i]['date'],
          time: maps[i]['time'],
          amount: maps[i]['current_amount'],
        );
      },
    );
  }

  List<ExpenseTobeAdded> finishedCategoryToExpenseTobeAdded(
      List<FinishedCategory> finishedCategories, String type) {
    List<ExpenseTobeAdded> tobeReturned = [];
    for (int i = 0; i < finishedCategories.length; i++) {
      for (int j = 0; j < finishedCategories[i].expenseDetail.length; j++) {
        tobeReturned.add(
          ExpenseTobeAdded(
              userID: 001,
              date: finishedCategories[i].expenseDetail[j].expense.date,
              dateType: finishedCategories[i].expenseDetail[j].expense.dateType,
              netAmount:
                  finishedCategories[i].expenseDetail[j].expense.netAmount,
              totalAmount:
                  finishedCategories[i].expenseDetail[j].expense.totalAmount,
              numberOfTimes:
                  finishedCategories[i].expenseDetail[j].expense.numberOfTimes,
              reason: finishedCategories[i].expenseDetail[j].expense.reason,
              reasonID: finishedCategories[i].expenseDetail[j].expense.reasonID,
              categoryID:
                  finishedCategories[i].expenseDetail[j].expense.categoryID,
              categoryName:
                  finishedCategories[i].expenseDetail[j].expense.categoryName,
              subcategoryID:
                  finishedCategories[i].expenseDetail[j].expense.subcategoryID,
              subsubcategoryID: finishedCategories[i]
                  .expenseDetail[j]
                  .expense
                  .subsubcategoryID,
              addedTime:
                  finishedCategories[i].expenseDetail[j].expense.addedTime,
              addedDate:
                  finishedCategories[i].expenseDetail[j].expense.addedDate,
              changedDate:
                  finishedCategories[i].expenseDetail[j].expense.changedDate,
              categoryType: type),
        );
      }
    }
    return tobeReturned;
  }

  List<ExpenseTobeAdded> expenseDetailToExpenseTobeAdded(
      List<List<ExpenseDetail>> expenseDetails, String type) {
    List<ExpenseTobeAdded> tobeReturned = [];
    for (int i = 0; i < expenseDetails.length; i++) {
      for (int j = 0; j < expenseDetails[i].length; j++) {
        tobeReturned.add(
          ExpenseTobeAdded(
            userID: 001,
            date: expenseDetails[i][j].expense.date,
            dateType: expenseDetails[i][j].expense.dateType,
            netAmount: expenseDetails[i][j].expense.netAmount,
            totalAmount: expenseDetails[i][j].expense.totalAmount,
            numberOfTimes: expenseDetails[i][j].expense.numberOfTimes,
            reason: expenseDetails[i][j].expense.reason,
            reasonID: expenseDetails[i][j].expense.reasonID,
            categoryID: expenseDetails[i][j].expense.categoryID,
            categoryName: expenseDetails[i][j].expense.categoryName,
            subcategoryID: expenseDetails[i][j].expense.subcategoryID,
            subsubcategoryID: expenseDetails[i][j].expense.subsubcategoryID,
            addedTime: expenseDetails[i][j].expense.addedTime,
            addedDate: expenseDetails[i][j].expense.addedDate,
            changedDate: expenseDetails[i][j].expense.changedDate,
            categoryType: type,
          ),
        );
      }
    }
    return tobeReturned;
  }
}
