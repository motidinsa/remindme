import 'package:hive/hive.dart';

part 'sub_subcategory_model.g.dart';

@HiveType(typeId: 2)
class SubSubcategoryModel extends HiveObject {
  @HiveField(0)
  final String subSubcategoryName;

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
  final String subSubcategoryType;

  @HiveField(7)
  final int categoryId;

  @HiveField(8)
  final int subcategoryId;

  @HiveField(9)
  final int id;

  @HiveField(10)
  final int userId;


  SubSubcategoryModel({
    this.subSubcategoryName,
    this.subSubcategoryType,
    this.dateAndTimeAdded,
    this.lastModifiedDateAndTime,
    this.iconName,
    this.dateType,
    this.iconType,
    this.id,
    this.userId,
    this.categoryId,
    this.subcategoryId,
  });
}
