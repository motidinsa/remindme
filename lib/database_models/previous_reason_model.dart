import 'package:hive/hive.dart';

part 'previous_reason_model.g.dart';

@HiveType(typeId: 4)
class PreviousReasonModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int categoryId;

  @HiveField(2)
  final int subcategoryId;

  @HiveField(3)
  final int subSubcategoryId;

  @HiveField(4)
  final String name;

  @HiveField(5)
  final String dateAndTimeAdded;

  @HiveField(6)
  final String lastModifiedDateAndTime;

  @HiveField(7)
  final String location;

  @HiveField(8)
  final int userId;

  @HiveField(9)
  final String dateType;

  PreviousReasonModel({
    this.lastModifiedDateAndTime,
    this.name,
    this.dateAndTimeAdded,
    this.id,
    this.categoryId,
    this.subcategoryId,
    this.subSubcategoryId,
    this.location,
    this.userId,
    this.dateType,
  });
}
