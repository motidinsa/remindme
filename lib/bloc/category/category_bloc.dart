import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/models/expense_and_income_subcategory.dart';
import 'package:mytask/models/expense_and_income_subsubcategory.dart';
import 'package:mytask/repository/expense_repository.dart';

import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ExpenseRepository expenseRepository;

  CategoryBloc({this.expenseRepository})
      :
        // : assert(expenseRepository != null),
        super(NoCategoryAdded());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CheckInitialization) {
      try {
        final settings = await expenseRepository.getInitializedParameters();
        if (settings.length == 0) {
          await expenseRepository.initializeCategoryAndSubcategory();
        }
        final categories = await expenseRepository.getAllCategories();
        final subcategories = await expenseRepository.getAllSubCategories();
        final subSubcategories =
            await expenseRepository.getAllSubSubCategories();
        yield CategoryInitialized(
            categories: categories,
            subcategories: subcategories,
            subSubcategories: subSubcategories);
      } catch (e) {
        print(e);
        yield CategoryInsertErrorOccurred();
      }
    }
    if (event is AddCategoryName) {
      yield CategoryNameAdded(event.categoryName);
    }
    if (event is AddCategoryIcon) {
      yield CategoryIconAdded(
          iconName: event.iconName, iconType: event.iconType);
      // yield CategoryIconCleared();
    }
    if (event is Clear) {
      yield Cleared();
    }
    if (event is AddCategoryType) {
      yield CategoryTypeAdded(categoryType: event.categoryType);
    }
    if (event is AddSubcategoryName) {
      yield SubcategoryNameAdded(
          subcategoryName: event.subcategoryName, tempID: event.tempID);
    }
    if (event is AddSubcategoryIcon) {
      yield SubcategoryIconAdded(
          tempID: event.tempID, subcategoryIcon: event.subcategoryIcon);
    }
    if (event is AddSubSubcategoryName) {
      yield SubSubcategoryNameAdded(
          tempID: event.tempID,
          subSubcategoryName: event.subSubcategoryName,
          tempCategoryID: event.tempSubCategoryID);
    }
    if (event is AddSubSubcategoryIcon) {
      yield SubSubcategoryIconAdded(
          tempID: event.tempID,
          subSubcategoryIcon: event.subSubcategoryIcon,
          categoryID: event.categoryID);
    }
    if (event is RemoveSubcategory) {
      yield SubcategoryRemoved(event.id);
    }
    if (event is RemoveSubSubcategory) {
      yield SubSubcategoryRemoved(id: event.id, categoryID: event.categoryID);
    }
    if (event is AddSubSubCategory) {
      yield SubSubcategoryAdded(subcategories: event.subcategories);
    }
    if (event is InsertCategory) {
      try {
        int categoryID = await expenseRepository.insertCategory(event.category);
        // print(event.subSubcategories)
        int subcategoryID;
        if (event.subcategories.length > 0) {
          List<ExpenseAndIncomeSubCategoryModel> subcategories = [
            ...event.subcategories
          ];
          subcategories.forEach((element) {
            element.categoryID = categoryID;
          });
          print(event.subSubcategories.length);
          for (int i = 0; i < event.subcategories.length; i++) {
// List<ExpenseAndIncomeSubSubCategoryModel> a =
//             var subSubcategory =
//                 event.subSubcategories.where((element) =>
//                     element.subcategoryID == event.subcategories[i].id).toList();
//             print(subSubcategory.toString()+' ooooooo');

            subcategoryID = await expenseRepository.insertSubCategory(
                event.subcategories[i], categoryID);
            if (event.subSubcategories.length > 0) {
              for (int j = 0; j < event.subSubcategories.length; j++) {
                if (event.subSubcategories[j][0].subcategoryID ==
                    event.subcategories[i].id) {
                  print('yooooooooop');
                  try {
                    await expenseRepository.insertSubSubCategory(
                        event.subSubcategories[j], categoryID, subcategoryID);
                  } catch (e) {
                    print(e);
                  }

                  print('nonon');
                }
              }
            }
          }
        }

        yield CategoryInserted();
      } catch (e) {
        print(e);
        yield CategoryInsertErrorOccurred();
      }
    }
  }
}
