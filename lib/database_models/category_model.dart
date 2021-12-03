import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String categoryName;

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
  final String categoryType;

  @HiveField(7)
  final int id;

  @HiveField(8)
  final int userId;

  @HiveField(9)
  final int orderNumber;

  CategoryModel({
    this.categoryName,
    this.categoryType,
    this.dateAndTimeAdded,
    this.lastModifiedDateAndTime,
    this.iconName,
    this.dateType,
    this.iconType,
    this.id,
    this.userId,
    this.orderNumber,
  });
}
