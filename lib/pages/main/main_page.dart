import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:remindme/bloc/completed_task/completed_task_bloc.dart';
import 'package:remindme/bloc/completed_task/completed_task_event.dart';
import 'package:remindme/getx_controller/income_and_expense/income_and_expense_controller.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense.dart';
import 'package:remindme/pages/completed/completed_task.dart';
import 'package:remindme/pages/home/drawer/drawer.dart';
import 'package:remindme/pages/home/homepage/homepage.dart';
import 'package:remindme/pages/setting/setting.dart';
import 'package:remindme/pages/statics/history.dart';
import 'package:remindme/repository/expense_repository.dart';
import 'main_page_functions.dart';

class MainPage extends StatefulWidget {
  final String title;
  final ExpenseRepository expenseRepository;

  MainPage({Key key, this.title, this.expenseRepository}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  Widget body;
  AppBar appbar;
  FloatingActionButton floatingActionButton;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  MainPageFunctions mainPageFunctions;
  List<IncomeAndExpenseCategoryModel> categories = [
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 1,
        categoryName: 'Transport',
        iconType: 'material',
        iconName: 'account_balance'),
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 2,
        categoryName: 'Food',
        iconType: 'material',
        iconName: 'account_balance'),
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 3,
        categoryName: 'Other',
        iconType: 'material',
        iconName: 'account_balance'),
  ];

  init() {
    _tabController = TabController(length: 2, vsync: this);
    mainPageFunctions =
        MainPageFunctions(expenseRepository: widget.expenseRepository);

    body = HomePage(
      tabController: _tabController,
      sc: scaffoldKey,
    );
    appbar = AppBar(
      title: const Text('Home'),
      elevation: 2,
      bottom: TabBar(
        controller: _tabController,
        tabs: const <Widget>[
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
      elevation: 4,
      backgroundColor: Colors.white,
      foregroundColor: Colors.green,
      onPressed: () async {
        // UsersBinding().dependencies();
        // await Get.put<IncomeAndExpenseController>(IncomeAndExpenseController());
        //  IncomeAndExpenseController a = Get.find();
        //  print(a.categoryList.length);
        Get.to(() => ExpenseAndIncomePage(
          type: 'expense',
              categories: categories,
            ));
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  initState() {
    super.initState();
    init();
  }

  void _onItemTapped(int index) {
    setState(
          () {
        switch (index) {
          case 0:
            body = HomePage(tabController: _tabController, sc: scaffoldKey);
            appbar = AppBar(
              title: const Text('Home'),
              elevation: 2,
              bottom: TabBar(
                controller: _tabController,
                tabs: const <Widget>[
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
              elevation: 4,
              backgroundColor: Colors.white,
              foregroundColor: Colors.green,
              onPressed: () {
                // UsersBinding().dependencies();
                // Get.put<IncomeAndExpenseController>(IncomeAndExpenseController());
                Get.to(() => ExpenseAndIncomePage(
                      type: 'Expense',
                      categories: categories,
                    ));
              },
              child: const Icon(
                Icons.add,
              ),
            );
            break;
          case 1:
            BlocProvider.of<CompletedTaskBloc>(context)
                .add(const CompletedTaskLoad());
            body = CompletedTask();
            appbar = AppBar(
              title: const Text('Completed tasks'),
            );
            floatingActionButton = null;

            break;
          case 2:
            setState(() {
              body = History();
              appbar = AppBar(
                title: const Text('Statics'),
              );
              floatingActionButton = null;
            });
            break;
          case 3:
            body = Setting();
            appbar = AppBar(
              title: const Text('Theme'),
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
      key: scaffoldKey,
      drawer: PageDrawer(),
      appBar: appbar,
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black87,
        // elevation: 5,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Accounts',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Statics',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
            backgroundColor: Colors.white,
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
