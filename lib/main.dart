import 'package:flutter/material.dart';
import 'package:mytodo/about.dart';
import 'package:mytodo/add_reminder.dart';
import 'package:mytodo/add_subcategory.dart';
import 'package:mytodo/common_reason.dart';
import 'package:mytodo/completed_task.dart';
import 'package:mytodo/drawer.dart';
import 'package:mytodo/empty_todo.dart';
import 'package:mytodo/expense.dart';
import 'package:mytodo/history.dart';
import 'package:mytodo/homepage.dart';
import 'package:mytodo/modal.dart';
import 'package:mytodo/report.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:mytodo/setting.dart';
import 'package:mytodo/theme.dart';

import 'income_category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDo',
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
      home: MyHomePage(),
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    body = HomePage(_tabController);
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddReminder()))
      },
      tooltip: 'Add',
      child: Icon(Icons.add),
    );
  }

  void _onItemTapped(int index) {
    setState(
      () {
        switch (index) {
          case 0:
            body = HomePage(_tabController);
            ;
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddReminder()))
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
            body = History();
            appbar = AppBar(
              title: Text('Statics'),
            );
            floatingActionButton = null;
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
    return Scaffold(
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
