import 'package:flutter/material.dart';
import 'package:mytodo/add_reminder.dart';
import 'package:mytodo/drawer.dart';
import 'package:mytodo/expense.dart';
import 'package:mytodo/homepage.dart';
import 'package:mytodo/report.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

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
            text: 'ToDos',
          ),
          Tab(
            text: 'Report',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(
      () {
        switch (index) {
          case 0:
            body = HomePage(_tabController);
            appbar = AppBar(
              title: Text('Home'),
              bottom: TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    text: 'ToDos',
                  ),
                  Tab(
                    text: 'Report',
                  ),
                ],
              ),
            );
            break;
          case 1:
            body = AddReminder();
            appbar = AppBar(
              title: Text('Completed tasks'),
            );
            break;
          case 2:
            body = Expense();
            appbar = AppBar(
              title: Text('Statics'),
            );
            break;
          case 3:
            body = Report('month', 200, 100);
            appbar = AppBar(
              title: Text('Settings'),
            );
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () => {},
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}
