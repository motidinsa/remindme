import 'package:hive/hive.dart';

part 'account_model.g.dart';

@HiveType(typeId: 5)
class AccountModel extends HiveObject {
  @HiveField(0)
  final String accountName;

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
  final double balance;

  AccountModel({
    this.accountName,
    this.balance,
    this.dateAndTimeAdded,
    this.lastModifiedDateAndTime,
    this.dateType,
    this.id,
    this.userId,
  });
}
