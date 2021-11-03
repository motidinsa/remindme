import 'package:equatable/equatable.dart';
import 'package:remindme/models/expense_tobe_added.dart';
import 'package:remindme/models/income_and_expense.dart';
import 'package:remindme/models/finished_category.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/income_and_expense_category.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/expense_detail.dart';
import 'package:remindme/pages/setting/add_reason/sub_subcategory_reason_page.dart';
import 'package:remindme/pages/setting/add_reason/subcategory_reason_page.dart';

abstract class ReasonEvent extends Equatable {
  const ReasonEvent();
}

class GetAllCategories extends ReasonEvent {
  const GetAllCategories();

  @override
  List<Object> get props => [];
}

class GetAllSubCategoriesWithCategoryID extends ReasonEvent {
  final int categoryID;

  const GetAllSubCategoriesWithCategoryID(this.categoryID);

  @override
  List<Object> get props => [categoryID];
}

class GetAllSubSubCategoriesWithSubCategoryID extends ReasonEvent {
  final int subcategoryID;

  const GetAllSubSubCategoriesWithSubCategoryID(this.subcategoryID);

  @override
  List<Object> get props => [];
}

class AddReasonCategoryName extends ReasonEvent {
  final int categoryID;

  const AddReasonCategoryName(this.categoryID);

  @override
  List<Object> get props => [categoryID];
}

class AddReasonSubCategoryName extends ReasonEvent {
  final int subcategoryID;

  const AddReasonSubCategoryName(this.subcategoryID);

  @override
  List<Object> get props => [subcategoryID];
}

class AddReasonSubSubCategoryName extends ReasonEvent {
  final int subsubcategoryID;

  const AddReasonSubSubCategoryName(this.subsubcategoryID);

  @override
  List<Object> get props => [subsubcategoryID];
}

class ClearReason extends ReasonEvent {
  @override
  List<Object> get props => [];
}

class AddCategoryReason extends ReasonEvent {
  final String categoryName;
  final int categoryID;
  final int id;

  const AddCategoryReason({this.categoryName, this.categoryID, this.id});

  @override
  List<Object> get props => [categoryName];
}

class AddSubCategoryReason extends ReasonEvent {
  final String subcategoryName;
  final int categoryID;
  final int subcategoryID;
  final int id;

  const AddSubCategoryReason(
      {this.subcategoryName, this.categoryID, this.id, this.subcategoryID});

  @override
  List<Object> get props => [subcategoryName];
}

class AddSubSubCategoryReason extends ReasonEvent {
  final String subcategoryName;
  final int categoryID;
  final int subcategoryID;
  final int subsubcategoryID;
  final int id;

  const AddSubSubCategoryReason(
      {this.subcategoryName,
      this.categoryID,
      this.id,
      this.subcategoryID,
      this.subsubcategoryID});

  @override
  List<Object> get props => [subcategoryName];
}

class AddCategoryAmount extends ReasonEvent {
  final String categoryAmount;
  final int categoryID;
  final int id;

  const AddCategoryAmount({this.categoryAmount, this.categoryID, this.id});

  @override
  List<Object> get props => [categoryAmount, categoryID, id];
}

class AddSubCategoryAmount extends ReasonEvent {
  final String subcategoryAmount;
  final int categoryID;
  final int subcategoryID;
  final int id;

  const AddSubCategoryAmount(
      {this.subcategoryAmount, this.categoryID, this.id, this.subcategoryID});

  @override
  List<Object> get props => [subcategoryAmount, categoryID, id];
}

class AddSubSubCategoryAmount extends ReasonEvent {
  final String subsubcategoryAmount;
  final int categoryID;
  final int subcategoryID;
  final int subsubcategoryID;
  final int id;

  const AddSubSubCategoryAmount(
      {this.subsubcategoryAmount,
      this.categoryID,
      this.id,
      this.subcategoryID,
      this.subsubcategoryID});

  @override
  List<Object> get props => [subsubcategoryAmount, categoryID, id];
}

class RemoveCategoryReason extends ReasonEvent {
  // final String categoryAmount;
  final int categoryID;
  final int id;

  const RemoveCategoryReason({this.categoryID, this.id});

  @override
  List<Object> get props => [categoryID, id];
}

class InsertCategoryReason extends ReasonEvent {
  // final String categoryAmount;
  final List<Reason> categoryReason;

  const InsertCategoryReason({this.categoryReason});

  @override
  List<Object> get props => [];
}

class InsertSubCategoryReason extends ReasonEvent {
  // final String categoryAmount;
  final List<SubCategoryReasonPage> subcategoryReason;

  const InsertSubCategoryReason({this.subcategoryReason});

  @override
  List<Object> get props => [];
}

class InsertSubSubCategoryReason extends ReasonEvent {
  // final String categoryAmount;
  final List<List<Reason>> subsubcategoryReason;

  const InsertSubSubCategoryReason({this.subsubcategoryReason});

  @override
  List<Object> get props => [];
}
// class RemoveExpenseCategory extends ExpenseEvent {
//   final int categoryID;
//
//   const RemoveExpenseCategory(this.categoryID);
//
//   @override
//   List<Object> get props => [categoryID];
// }
//
// class AddAnotherItem extends ExpenseEvent {
//   final int categoryID;
//
//   const AddAnotherItem(this.categoryID);
//
//   @override
//   List<Object> get props => [];
// }
//
// class AddExpenseDate extends ExpenseEvent {
//   final int categoryID;
//   final int index;
//   final String date;
//
//   const AddExpenseDate(this.categoryID, this.index, this.date);
//
//   @override
//   List<Object> get props => [];
// }
//
// class AddExpenseAmount extends ExpenseEvent {
//   final int categoryID;
//   final int index;
//   final double amount;
//
//   const AddExpenseAmount(this.categoryID, this.index, this.amount);
//
//   @override
//   List<Object> get props => [];
// }
//
// class AddExpenseNumberOfTimes extends ExpenseEvent {
//   final int categoryID;
//   final int index;
//   final int numberOfTimes;
//
//   const AddExpenseNumberOfTimes(
//       this.categoryID, this.index, this.numberOfTimes);
//
//   @override
//   List<Object> get props => [];
// }
//
// class AddExpenseReason extends ExpenseEvent {
//   final int categoryID;
//   final int index;
//   final String reason;
//
//   const AddExpenseReason(this.categoryID, this.index, this.reason);
//
//   @override
//   List<Object> get props => [];
// }
//
// class AddExpenseReasonAndAmount extends ExpenseEvent {
//   final int categoryID;
//   final int subcategoryID;
//   final int index;
//   final String reason;
//   final String amount;
//
//   const AddExpenseReasonAndAmount(
//       {this.categoryID,
//         this.index,
//         this.reason,
//         this.amount,
//         this.subcategoryID});
//
//   @override
//   List<Object> get props => [];
// }
//
// class FinishCategory extends ExpenseEvent {
//   final int id;
//
//   const FinishCategory(this.id);
//
//   @override
//   List<Object> get props => [];
// }
//
// class RemoveFinishedCategory extends ExpenseEvent {
//   final int id;
//
//   const RemoveFinishedCategory(this.id);
//
//   @override
//   List<Object> get props => [];
// }
//
// class NoCategory extends ExpenseEvent {
//   const NoCategory();
//
//   @override
//   List<Object> get props => [];
// }
//
// class ClearCategory extends ExpenseEvent {
//   const ClearCategory();
//
//   @override
//   List<Object> get props => [];
// }
//
// class AddExpense extends ExpenseEvent {
//   final List<FinishedCategory> finishedCategories;
//   final List<List<ExpenseDetail>> expenseDetails;
//
//   const AddExpense({this.finishedCategories, this.expenseDetails});
//
//   @override
//   List<Object> get props => [];
// }
//
// class LoadAllExpense extends ExpenseEvent {
//   const LoadAllExpense();
//
//   @override
//   List<Object> get props => [];
// }
//
// class LoadDailyExpense extends ExpenseEvent {
//   const LoadDailyExpense();
//
//   @override
//   List<Object> get props => [];
// }
//
// class LoadWeeklyExpense extends ExpenseEvent {
//   const LoadWeeklyExpense();
//
//   @override
//   List<Object> get props => [];
// }
//
// class LoadMonthlyExpense extends ExpenseEvent {
//   const LoadMonthlyExpense();
//
//   @override
//   List<Object> get props => [];
// }
//
// class InitializeCategoryAndSubcategory extends ExpenseEvent {
//   const InitializeCategoryAndSubcategory();
//
//   @override
//   List<Object> get props => [];
// }
