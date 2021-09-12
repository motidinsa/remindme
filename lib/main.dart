import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/completed_task/completed_task_bloc.dart';
import 'package:remindme/bloc/completed_task/completed_task_event.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/pages/add_reminder/add_reminder.dart';
import 'package:remindme/pages/add_transaction/expense/expense_and_income.dart';
import 'package:remindme/pages/add_transaction/expense/expense_detail.dart';
import 'package:remindme/pages/add_transaction/expense/expense_list.dart';
import 'package:remindme/pages/completed/completed_task.dart';
import 'package:remindme/pages/home/drawer/drawer.dart';
import 'package:remindme/pages/home/homepage.dart';
import 'package:remindme/pages/setting/add_category/expense_and_income_category_insert.dart';
import 'package:remindme/pages/setting/setting.dart';
import 'package:remindme/repository/expense_repository.dart';
import 'package:remindme/repository/task_repository.dart';
import 'package:remindme/route/task_route.dart';
import 'bloc/add_reminder/add_reminder_bloc.dart';
import 'bloc/category/category_event.dart';
import 'bloc/expense/expense_event.dart';
import 'bloc/expense_and_income/expense_and_income_bloc.dart';
import 'bloc/expense_and_income/expense_and_income_event.dart';
import 'bloc/reason/reason_bloc.dart';
import 'bloc/reason/reason_event.dart';
import 'bloc/task/task_bloc.dart';
import 'bloc/task/task_event.dart';
import 'data_provider/task_data.dart';
import './pages/statics/history.dart';
import 'models/expense_and_income_category.dart';

void main() {
  final TaskRepository taskRepository = TaskRepository(
    dataProvider: TaskDataProvider.instance,
  );
  final ExpenseRepository expenseRepository = ExpenseRepository(
    dataProvider: TaskDataProvider.instance,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TaskBloc>(
          create: (context) =>
              TaskBloc(taskRepository: taskRepository)..add(TaskLoad())),
      BlocProvider<AddReminderBloc>(
        create: (context) => AddReminderBloc(),
      ),
      BlocProvider<CompletedTaskBloc>(
        create: (context) => CompletedTaskBloc(taskRepository: taskRepository)
          ..add(CompletedTaskLoad()),
      ),
      BlocProvider<ExpenseBloc>(
        create: (context) => ExpenseBloc(expenseRepository: expenseRepository),
      ),
      BlocProvider<CategoryBloc>(
        create: (context) => CategoryBloc(expenseRepository: expenseRepository)
          ..add(CheckInitialization()),
      ),
      BlocProvider<ReasonBloc>(
        create: (context) => ReasonBloc(expenseRepository: expenseRepository)
          ..add(GetAllCategories()),
      ),
      BlocProvider<ExpenseAndIncomeBloc>(
        create: (context) =>
            ExpenseAndIncomeBloc(expenseRepository: expenseRepository)
              ..add(GetAllIncomeAndExpense()),
      )
    ],
    child: MyApp(
      taskRepository: taskRepository,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final TaskRepository taskRepository;

  MyApp({@required this.taskRepository}) : assert(taskRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.taskRepository,
      child: MaterialApp(
        title: 'My Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('am', 'ET'),
        ],
        onGenerateRoute: TaskRoute.generateRoute,
        // home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final ExpenseRepository expenseRepository;

  MyHomePage({Key key, this.title, this.expenseRepository}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  Widget body;
  AppBar appbar;
  FloatingActionButton floatingActionButton;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Snackbar is displayed'),
    ));
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text('text')));
    // setState(() {});
  }

  init() {
    print('init called');
    _tabController = TabController(length: 2, vsync: this);
    // database = SqliteDB.instance;
    // tasks = await database.tasks();

    body = HomePage(
      tabController: _tabController,
      sc: scaffoldKey,
    );
    appbar = AppBar(
      title: Text('Home'),
      bottom: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            text: 'Transaction',
          ),
          Tab(
            text: 'Tasks',
          ),
        ],
      ),
    );
    floatingActionButton = FloatingActionButton(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      onPressed: () =>
      {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: () async {
                      List<ExpenseAndIncomeCategoryModel> categories =
                          await fetchExpenseCategories();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpenseAndIncomePage(
                            type: 'Expense',
                            categories: categories,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Expense',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )),
                TextButton(
                    onPressed: () async {
                      List<ExpenseAndIncomeCategoryModel> categories =
                          await fetchIncomeCategories();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpenseAndIncomePage(
                            type: 'Income',
                            categories: categories,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Income',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ))
              ],
            ),
          ),
        )
        // Navigator.of(context).pushNamed(
        //   ExpenseAndIncomeCategoryInsert.routeName,
        // )
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => AddReminder(
        //               type: 'Add',
        //             )))
      }
      // Navigator.of(context).pushNamed(AddReminder.routeName,
      //     arguments: TaskArgument(edit: false))
      ,
      tooltip: 'Add',
      child: Icon(Icons.add),
    );
  }

  @override
  initState() {
    super.initState();
    init();
    print('init after called');
  }

  void _onItemTapped(int index) {
    setState(
      () {
        switch (index) {
          case 0:
            body = HomePage(tabController: _tabController, sc: scaffoldKey);
            appbar = AppBar(
              title: Text('Home'),
              bottom: TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    text: 'Tasks',
                  ),
                  Tab(
                    text: 'Transaction',
                  ),
                ],
              ),
            );
            floatingActionButton = FloatingActionButton(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              onPressed: () => {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                            onPressed: () async {
                              List<ExpenseAndIncomeCategoryModel> categories =
                                  await fetchExpenseCategories();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExpenseAndIncomePage(
                                    type: 'Expense',
                                    categories: categories,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Expense',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            )),
                        TextButton(
                            onPressed: () async {
                              List<ExpenseAndIncomeCategoryModel> categories =
                                  await fetchIncomeCategories();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExpenseAndIncomePage(
                                    type: 'Income',
                                    categories: categories,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Income',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 16),
                            ))
                      ],
                    ),
                  ),
                )
                // Navigator.of(context).pushNamed(
                //   ExpenseAndIncomeCategoryInsert.routeName,
                // )
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AddReminder(
                //               type: 'Add',
                //             )))
              }
              // Navigator.of(context).pushNamed(AddReminder.routeName,
              //     arguments: TaskArgument(edit: false))
              ,
              tooltip: 'Add',
              child: Icon(Icons.add),
            );
            break;
          case 1:
            BlocProvider.of<CompletedTaskBloc>(context)
                .add(CompletedTaskLoad());
            body = CompletedTask();
            appbar = AppBar(
              title: Text('Completed tasks'),
            );
            floatingActionButton = null;

            break;
          case 2:
            setState(() {
              body = History();
              appbar = AppBar(
                title: Text('Statics'),
              );
              floatingActionButton = null;
            });

            break;
          case 3:
            body = Setting();
            appbar = AppBar(
              title: Text('Theme'),
            );
            floatingActionButton = null;
            break;
        }
        _selectedIndex = index;
      },
    );
  }

  Future<List<ExpenseAndIncomeCategoryModel>> fetchExpenseCategories() async {
    return await widget.expenseRepository.getAllExpenseCategory();
  }

  Future<List<ExpenseAndIncomeCategoryModel>> fetchIncomeCategories() async {
    return await widget.expenseRepository.getAllIncomeCategory();
  }

  @override
  Widget build(BuildContext context) {
    // print(tasks?.length.toString() + 'body');
    return Scaffold(
      key: scaffoldKey,
      drawer: PageDrawer(),
      appBar: appbar,
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blueGrey,
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in_rounded),
            label: 'Completed',
            backgroundColor: Colors.blueGrey,
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statics',
            backgroundColor: Colors.blueGrey,
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blueGrey,
            // backgroundColor: Colors.pink,
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
