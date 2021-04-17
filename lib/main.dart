import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/add_reminder.dart';
import 'package:mytask/bloc/add_reminder_bloc.dart';
import 'package:mytask/bloc/subcategory_bloc.dart';
import 'package:mytask/completed_task.dart';
import 'package:mytask/drawer.dart';
import 'package:mytask/history.dart';
import 'package:mytask/homepage.dart';
import 'package:mytask/repository/task_repository.dart';
import 'package:mytask/setting.dart';
import 'package:mytask/task_route.dart';
import 'bloc/task_bloc.dart';
import 'bloc/task_event.dart';
import 'data_provider/task_data.dart';

void main() {
  final TaskRepository taskRepository = TaskRepository(
    dataProvider: TaskDataProvider.instance,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
            create: (context) =>
                TaskBloc(taskRepository: taskRepository)..add(TaskLoad())),
        BlocProvider<SubcategoryBloc>(
          create: (context) => SubcategoryBloc(),
        ),
        BlocProvider<AddReminderBloc>(
          create: (context) => AddReminderBloc(),
        )
      ],
      child: MyApp(
        taskRepository: taskRepository,
      ),
    ),
  );
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
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

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
        Navigator.of(context).pushNamed(AddReminder.routeName,
            arguments: TaskArgument(edit: false))
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => AddReminder(
        //               type: 'Add',
        //             )))
      },
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
                Navigator.of(context).pushNamed(AddReminder.routeName,
                    arguments: TaskArgument(edit: false))
              },
              tooltip: 'Add',
              child: Icon(Icons.add),
            );
            break;
          case 1:
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
