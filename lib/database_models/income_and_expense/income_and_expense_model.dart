import 'package:hive/hive.dart';

part 'income_and_expense_model.g.dart';

@HiveType(typeId: 8)
class IncomeAndExpenseModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime dateAndTimeAdded;

  @HiveField(2)
  final DateTime lastModifiedDateAndTime;

  @HiveField(3)
  final String dateType;

  @HiveField(4)
  final int id;

  @HiveField(5)
  final int userId;

  @HiveField(6)
  final int categoryId;

  @HiveField(7)
  final String categoryName;

  @HiveField(8)
  final int subcategoryId;

  @HiveField(9)
  final String subcategoryName;

  @HiveField(10)
  final int subSubcategoryId;

  @HiveField(11)
  final String subSubcategoryName;

  @HiveField(12)
  final double netAmount;

  @HiveField(13)
  final int frequency;

  @HiveField(14)
  final String type;

  @HiveField(15)
  final int reasonId;

  @HiveField(16)
  final String location;

  @HiveField(17)
  final int accountId;

  @HiveField(18)
  final String accountName;

  @HiveField(19)
  final int subAccountId;

  @HiveField(20)
  final String subAccountName;

  @HiveField(21)
  final int subSubAccountId;

  @HiveField(22)
  final String subSubAccountName;

  @HiveField(23)
  int orderNumber;

  @HiveField(24)
  final DateTime selectedDateAndTime;

  IncomeAndExpenseModel({
    this.accountName,
    this.subcategoryId,
    this.dateAndTimeAdded,
    this.lastModifiedDateAndTime,
    this.dateType,
    this.id,
    this.userId,
    this.accountId,
    this.subAccountId,
    this.subSubcategoryName,
    this.categoryId,
    this.subcategoryName,
    this.categoryName,
    this.frequency,
    this.location,
    this.subSubcategoryId,
    this.name,
    this.netAmount,
    this.type,
    this.reasonId,
    this.subAccountName,
    this.subSubAccountId,
    this.subSubAccountName,
    this.orderNumber,
    this.selectedDateAndTime,
  });
}
