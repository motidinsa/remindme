import 'package:hive/hive.dart';

part 'subcategory_model.g.dart';

@HiveType(typeId: 1)
class SubcategoryModel extends HiveObject {
  @HiveField(0)
  final String subcategoryName;

  @HiveField(1)
  final String iconName;

  @HiveField(2)
  final String iconType;

  @HiveField(3)
  final DateTime dateAndTimeAdded;

  @HiveField(4)
  final DateTime lastModifiedDateAndTime;

  @HiveField(5)
  final String dateType;

  @HiveField(6)
  final String subcategoryType;

  @HiveField(7)
  final int categoryId;

  @HiveField(8)
  final int id;

  @HiveField(9)
  final int userId;

  @HiveField(10)
  final int orderNumber;

  SubcategoryModel({
    this.subcategoryName,
    this.subcategoryType,
    this.dateAndTimeAdded,
    this.lastModifiedDateAndTime,
    this.iconName,
    this.dateType,
    this.iconType,
    this.id,
    this.userId,
    this.orderNumber,
    this.categoryId,
  });
}
