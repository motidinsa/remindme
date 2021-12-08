import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:remindme/database_models/category/category_model.dart';
import 'package:remindme/database_models/setting/setting_model.dart';
import 'package:remindme/helper/icons_helper.dart';
import 'package:remindme/helper/widget_size.dart';
import 'package:remindme/models/category_card_model.dart';
import 'package:remindme/models/expense_and_income_category.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/income_and_expense_category_select_model.dart';
import 'package:remindme/models/multiple_category_card_model.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/multiple_category_card.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class IncomeAndExpenseController extends GetxController {
  final List<IncomeAndExpenseCategoryModel> categories = [
    IncomeAndExpenseCategoryModel(
        categoryType: 'Expense',
        id: 1,
        categoryName: 'Transport',
        iconType: 'material',
        iconName: 'account_balance',
        subcategoryCount: 3),
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
  List<IncomeAndExpenseSubCategoryModel> subcategories = [
    IncomeAndExpenseSubCategoryModel(
      subcategoryType: 'Expense',
      id: 1,
      categoryID: 1,
      subcategoryName: 'Bus',
      iconType: 'material',
      iconName: 'account_balance',
      subSubcategoryCount: 3,
      isSelected: false,
    ),
    IncomeAndExpenseSubCategoryModel(
      subcategoryType: 'Expense',
      id: 2,
      categoryID: 1,
      subcategoryName: 'Taxi',
      iconType: 'material',
      iconName: 'account_balance',
      subSubcategoryCount: 3,
      isSelected: false,
    ),
    IncomeAndExpenseSubCategoryModel(
      subcategoryType: 'Expense',
      id: 3,
      categoryID: 1,
      subcategoryName: 'Bajaj',
      iconType: 'material',
      iconName: 'account_balance',
      subSubcategoryCount: 0,
      isSelected: false,
    ),
  ];
  final List<IncomeAndExpenseSubSubCategoryModel> subSubcategories = [
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 1,
      categoryID: 1,
      subcategoryID: 1,
      subSubcategoryName: 'Anbessa',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 2,
      categoryID: 1,
      subcategoryID: 1,
      subSubcategoryName: 'Sheger',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 3,
      categoryID: 1,
      subcategoryID: 1,
      subSubcategoryName: 'public',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 4,
      categoryID: 1,
      subcategoryID: 2,
      subSubcategoryName: 'sc',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 5,
      categoryID: 1,
      subcategoryID: 2,
      subSubcategoryName: 'qw',
    ),
    IncomeAndExpenseSubSubCategoryModel(
      subSubcategoryType: 'Expense',
      id: 6,
      categoryID: 1,
      subcategoryID: 3,
      subSubcategoryName: 'ewwww',
    ),
  ];
  List<Reason> reasons = [
    Reason(
      categoryId: 1,
      amount: '5',
      name: 'test reason',
      // location: 'alembank',
    ),
    Reason(
        categoryId: 1,
        subcategoryId: 1,
        amount: '9',
        name: 'test reason',
        location: 'zzzz vfd'),
    Reason(
      categoryId: 1,
      subcategoryId: 2,
      amount: '5',
      name: 'test reason',
      location: 'et',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 2,
      amount: '54',
      name: 'test reason',
      location: 'eth',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 1,
      subSubcategoryId: 1,
      amount: '50',
      name: 'test reason',
      location: 'alembank',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 1,
      subSubcategoryId: 1,
      amount: '5',
      name: 'test reason 2',
      // location: 'alembank',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 1,
      subSubcategoryId: 1,
      amount: '24',
      name: 'test reason 3',
      location: 'alembank',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 1,
      subSubcategoryId: 2,
      amount: '50',
      name: 'shaki sha',
      location: 'alembank',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 1,
      subSubcategoryId: 2,
      amount: '504',
      name: 'sha',
      // location: 'alembank',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 1,
      subSubcategoryId: 3,
      amount: '504',
      name: 'sha',
      // location: 'alembank',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 1,
      subSubcategoryId: 3,
      amount: '504',
      name: 'sha',
      // location: 'alembank',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 1,
      subSubcategoryId: 3,
      amount: '504',
      name: 'sha',
      // location: 'alembank',
    ),
    Reason(
      categoryId: 1,
      subcategoryId: 1,
      subSubcategoryId: 3,
      amount: '504',
      name: 'sha',
      // location: 'alembank',
    ),
  ];
  List<IncomeAndExpenseSubSubCategoryModel> selectedSubSubcategories = [];
  List<Reason> categoryReasons = [];
  List<Reason> subcategoryReasons = [];

  int categoryModelId = 0;
  int multipleCategoryId = 0;
  int currentCarouselPosition = 0;
  List<MultipleCategoryCardModel> categoryModels = [];
  List<IncomeAndExpenseCategorySelect> categoryList = [];

  double categoryListHeight;
  double categoryHeight;
  double subcategorySelectPageHeight;
  double reasonSelectPageHeight;
  double subSubcategoryReasonSelectHeight;
  bool isCategoryHeightSet = false;
  bool subcategorySelectHintDismissed = false;
  bool isInitialized = false;
  String categoryType;
  CarouselController buttonCarouselController = CarouselController();
  DateTime now = DateTime.now();
  List<CategoryModel> category = [];

  @override
  void onInit() {
    super.onInit();
  }

  Stream<bool> initialize(String type) async* {
    if (!isInitialized) {
      await Hive.openBox<CategoryModel>('category');
      await Hive.openBox<SettingModel>('setting');
      if (Hive.box<CategoryModel>('category').isEmpty) {
        int id = await Hive.box<CategoryModel>('category').add(
          CategoryModel(),
        );
        Hive.box<CategoryModel>('category').put(
          id,
          CategoryModel(
              id: id,
              categoryName: 'Transport',
              dateAndTimeAdded: DateTime.now(),
              iconName: 'account_balance',
              iconType: 'material'),
        );
        id = await Hive.box<CategoryModel>('category').add(
          CategoryModel(),
        );
        Hive.box<CategoryModel>('category').put(
          id,
          CategoryModel(
              id: id,
              categoryName: 'Food',
              dateAndTimeAdded: DateTime.now(),
              iconName: 'account_balance',
              iconType: 'material'),
        );
        id = await Hive.box<CategoryModel>('category').add(
          CategoryModel(),
        );
        Hive.box<CategoryModel>('category').put(
          id,
          CategoryModel(
              id: id,
              categoryName: 'Other',
              dateAndTimeAdded: DateTime.now(),
              iconName: 'account_balance',
              iconType: 'material'),
        );
      }
      if (Hive.box<SettingModel>('setting').isNotEmpty) {
        if (Hive.box<SettingModel>('setting')
                .get(0)
                .subcategorySelectHintDismissed ==
            true) {
          subcategorySelectHintDismissed = true;
        }
      }
      category = Hive.box<CategoryModel>('category').values.toList();
      categoryType = type;
      for (var element in category) {
        print('inside ${element.categoryName}');
        categoryList.add(
          IncomeAndExpenseCategorySelect(
            categoryName: element.categoryName,
            icon: Icon(
              IconsHelper.getIconGuessFavorFA(name: element.iconName),
              color: Colors.black54,
              size: 20,
            ),
            isSelected: false,
            categoryID: element.id,
            finishedCategory: false,
            // key: UniqueKey(),
          ),
        );
      }
      isInitialized = true;
      yield true;
    }
  }

  void addIncomeAndExpense(
      IncomeAndExpenseCategorySelectModel incomeAndExpenseCategory) {
    categoryList
        .firstWhere((element) =>
            element.categoryID == incomeAndExpenseCategory.categoryID)
        .isSelected = true;

    int categoryId = incomeAndExpenseCategory.categoryID;
    categoryModels.add(
      MultipleCategoryCardModel(
        categoryId: categoryId,
        id: multipleCategoryId++,
        categoryCardModels: [
          CategoryCardModel(
            id: categoryModelId++,
            categoryId: categoryId,
            categoryName: incomeAndExpenseCategory.categoryName,
            isLastItem: true,
            frequency: 1,
            date: DateTime(now.year, now.month, now.day),
            categoryType: categoryType,
          )
        ],
      ),
    );

    if (categoryModels.length > 1) {
      buttonCarouselController.animateToPage(categoryModels.length - 1);
    }
    update();
  }

  void setCurrentPosition(int index) {
    currentCarouselPosition = index;
    update();
  }

  void removeCategory(int categoryId) {
    categoryList
        .firstWhere((element) => element.categoryID == categoryId)
        .isSelected = false;
    categoryModels.removeWhere((element) => element.categoryId == categoryId);
    for (int i = 0; i < categoryModels.length; i++) {
      categoryModels[i].id = i;
    }
    multipleCategoryId = categoryModels.length;
    if (categoryModels.isEmpty) {
      currentCarouselPosition = 0;
    } else {
      currentCarouselPosition = categoryModels.length - 1;
    }
    update();
  }

  void updateCategoryCardHeight(double givenHeight) {
    categoryHeight = givenHeight;
    isCategoryHeightSet = true;
    update();
  }

  void updateSubcategoryHeight(double givenHeight) {
    if (givenHeight > Get.height / 2) {
      subcategorySelectPageHeight = Get.height / 2;
      // isSubSubcategoryHeightSet = true;
    }
    update();
  }

  void updateReasonHeight(double givenHeight) {
    if (givenHeight > Get.height / 2) {
      reasonSelectPageHeight = Get.height / 2;
    }
    update();
  }

  void updateCategoryListHeight(double givenHeight) {
    categoryListHeight = givenHeight;
    print('height $categoryListHeight');
    if (categoryListHeight > Get.height / 4) {
      categoryListHeight = Get.height / 4;
    }
    update();
  }

  void addAnotherItem(int categoryId, int id) {
    List<CategoryCardModel> categoryModel = categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels;

    categoryModel.last.isLastItem = false;

    categoryModel.add(
      CategoryCardModel(
        id: categoryModelId++,
        isLastItem: true,
        categoryName: categoryModel.last.categoryName,
        categoryId: categoryModel.last.categoryId,
        frequency: 1,
        date: DateTime(now.year, now.month, now.day),
        categoryType: categoryType,
      ),
    );

    update();
  }

  void changeAmountValue(int id, int categoryId, String givenAmount) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
      ..netAmount = givenAmount
      ..requestFocusOnAmount = false;
    update();
  }

  void changeFrequency(int id, int categoryId, String givenFrequency) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .frequency = int.parse(givenFrequency);
    update();
  }

  void increaseFrequencyValue(int id, int categoryId) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .frequency++;
    update();
  }

  void decreaseFrequencyValue(int id, int categoryId) {
    if (categoryModels
            .firstWhere((element) => element.categoryId == categoryId)
            .categoryCardModels
            .firstWhere((element) => element.id == id)
            .frequency >
        1) {
      categoryModels
          .firstWhere((element) => element.categoryId == categoryId)
          .categoryCardModels
          .firstWhere((element) => element.id == id)
          .frequency--;
    }
    update();
  }

  void changeReason(int id, int categoryId, String reason) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .reason = reason;
    update();
  }

  void changeLocation(int id, int categoryId, String location) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .location = location;
    update();
  }

  void fetchSubSubcategories(int categoryId, int subcategoryId) {
    selectedSubSubcategories = subSubcategories
        .where((element) =>
            element.categoryID == categoryId &&
            element.subcategoryID == subcategoryId)
        .toList();
    update();
  }

  void changeSelectedSubcategoryColor(int categoryId, int subcategoryId) {
    for (var item in subcategories) {
      item.isSelected = false;
    }
    subcategories
        .firstWhere((element) =>
            element.id == subcategoryId && element.categoryID == categoryId)
        .isSelected = true;
    update();
  }

  void updateCategoryModelDetailFromSubSubcategory(int categoryId,
      int subcategoryId, int subSubcategoryId, int categoryCardId) {
    IncomeAndExpenseSubCategoryModel subCategoryModel =
        subcategories.firstWhere((element) =>
            element.categoryID == categoryId && element.id == subcategoryId);
    IncomeAndExpenseSubSubCategoryModel subSubCategoryModel =
        subSubcategories.firstWhere((element) =>
            element.categoryID == categoryId &&
            element.subcategoryID == subcategoryId &&
            element.id == subSubcategoryId);
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == categoryCardId)
      ..requestFocusOnAmount = true
      ..subcategoryId = subCategoryModel.id
      ..subcategoryName = subCategoryModel.subcategoryName
      ..subSubCategoryId = subSubCategoryModel.id
      ..subSubcategoryName = subSubCategoryModel.subSubcategoryName;
    update();
  }

  void updateCategoryModelDetailFromSubcategory(
      int categoryId, int subcategoryId, int categoryCardId) {
    IncomeAndExpenseSubCategoryModel subCategoryModel =
        subcategories.firstWhere((element) =>
            element.categoryID == categoryId && element.id == subcategoryId);

    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == categoryCardId)
      ..requestFocusOnAmount = true
      ..subcategoryId = subCategoryModel.id
      ..subcategoryName = subCategoryModel.subcategoryName
      ..subSubCategoryId = null
      ..subSubcategoryName = null;

    update();
  }

  void insertCategoryReasonValues(Reason reason,
      {int categoryId, int categoryCardId}) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == categoryCardId)
      ..netAmount = reason.amount
      ..reason = reason.name
      ..location = reason.location
      ..subcategoryId = null
      ..subcategoryName = null
      ..subSubCategoryId = null
      ..subSubcategoryName = null;
    // categoryModels
    //     .firstWhere((element) => element.categoryId == categoryId)
    //     .categoryCardModels
    //     .firstWhere((element) => element.id == categoryCardId).location = null;
    update();
  }

  void insertSubCategoryReasonValues(Reason reason,
      {int categoryId, int categoryCardId, int subcategoryId}) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == categoryCardId)
      ..netAmount = reason.amount
      ..reason = reason.name
      ..location = reason.location
      ..subcategoryId = reason.subcategoryId
      ..subcategoryName = subcategories
          .firstWhere((element) => element.id == subcategoryId)
          .subcategoryName
      ..subSubCategoryId = null
      ..subSubcategoryName = null;

    update();
  }

  void insertSubSubCategoryReasonValues(Reason reason,
      {int categoryId,
      int categoryCardId,
      int subcategoryId,
      int subSubcategoryId}) {
    print('reason loc ${reason.location}');
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == categoryCardId)
      ..netAmount = reason.amount
      ..reason = reason.name
      ..location = reason.location
      ..subcategoryId = reason.subcategoryId
      ..subcategoryName = subcategories
          .firstWhere((element) => element.id == subcategoryId)
          .subcategoryName
      ..subSubCategoryId = reason.subSubcategoryId
      ..subSubcategoryName = subSubcategories
          .firstWhere((element) => element.id == subSubcategoryId)
          .subSubcategoryName;
    print(
        'nn ${categoryModels.firstWhere((element) => element.categoryId == categoryId).categoryCardModels.firstWhere((element) => element.id == categoryCardId).location}');
    update();
  }

  void fetchCategoryReason(int categoryId) {
    categoryReasons =
        reasons.where((element) => element.categoryId == categoryId).toList();
    List<Reason> allSubcategoryReasons = categoryReasons
        .where((element) => element.subcategoryId != null)
        .toList();

    List<Reason> subcategoryReasons = [];

    for (Reason reason in allSubcategoryReasons) {
      if (subcategoryReasons.isEmpty ||
          subcategoryReasons.last.subcategoryId != reason.subcategoryId) {
        subcategoryReasons.add(reason);
      }
    }
    subcategoryReasons.addAll(
      categoryReasons
          .where((element) => element.subcategoryId == null)
          .toList(),
    );
    categoryReasons = subcategoryReasons;
    update();
  }

  void fetchSubcategoryReason(int categoryId, int subcategoryId) {
    subcategoryReasons = reasons
        .where((element) =>
            element.categoryId == categoryId &&
            element.subcategoryId == subcategoryId)
        .toList();
    List<Reason> allSubSubcategoryReasons = subcategoryReasons
        .where((element) => element.subSubcategoryId != null)
        .toList();

    List<Reason> subSubcategoryReasons = [];

    for (Reason reason in allSubSubcategoryReasons) {
      if (subSubcategoryReasons.isEmpty) {
        subSubcategoryReasons.add(reason);
      } else {
        int subcategorySimilarityFrequency = 0;
        List<Reason> tempSubSubcategory = [];
        for (Reason item in subSubcategoryReasons) {
          if (item.subSubcategoryId != reason.subSubcategoryId) {
            tempSubSubcategory.add(reason);
          } else {
            subcategorySimilarityFrequency++;
          }
        }
        if (subcategorySimilarityFrequency == 0) {
          subSubcategoryReasons.add(tempSubSubcategory.first);
        }
      }
    }
    subSubcategoryReasons.addAll(
      subcategoryReasons
          .where((element) => element.subSubcategoryId == null)
          .toList(),
    );
    subcategoryReasons = subSubcategoryReasons;
    update();
  }

  void changeSelectedSubcategoryReasonColor(int categoryId, int subcategoryId) {
    for (var item in reasons) {
      item.isSubcategorySelected = false;
    }
    reasons
        .firstWhere((element) =>
            element.categoryId == categoryId &&
            element.subcategoryId == subcategoryId)
        .isSubcategorySelected = true;

    update();
  }

  void changeSelectedSubSubcategoryReasonColor(
      int categoryId, int subcategoryId, int subSubcategoryId) {
    for (var item in reasons) {
      item.isSubSubcategorySelected = false;
    }
    reasons
        .firstWhere((element) =>
            element.categoryId == categoryId &&
            element.subcategoryId == subcategoryId &&
            element.subSubcategoryId == subSubcategoryId)
        .isSubSubcategorySelected = true;

    update();
  }

  void removeBackgroundColorOfSelectedSubSubCategoryReason() {
    for (var element in subcategoryReasons) {
      element.isSubSubcategorySelected = false;
    }
    update();
  }

  void dismissHint() {
    Hive.openBox<SettingModel>('setting');
    if (Hive.box<SettingModel>('setting').isEmpty) {
      Hive.box<SettingModel>('setting').add(
        SettingModel(subcategorySelectHintDismissed: true),
      );
    } else {
      Hive.box<SettingModel>('setting').put(
        0,
        SettingModel(
            subcategorySelectHintDismissed: true,
            theme: Hive.box<SettingModel>('setting').get(0).theme),
      );
    }

    subcategorySelectHintDismissed = true;
    update();
  }

  void updateDate(int id, int categoryId, DateTime givenDate) {
    categoryModels
        .firstWhere((element) => element.categoryId == categoryId)
        .categoryCardModels
        .firstWhere((element) => element.id == id)
        .date = givenDate;
    update();
  }
}
