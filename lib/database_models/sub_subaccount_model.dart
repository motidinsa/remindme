import 'package:hive/hive.dart';

part 'sub_subaccount_model.g.dart';

@HiveType(typeId: 7)
class SubSubAccountModel extends HiveObject {
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

  @HiveField(7)
  final int accountId;

  @HiveField(8)
  final int subAccountId;

  SubSubAccountModel({
    this.accountName,
    this.balance,
    this.dateAndTimeAdded,
    this.lastModifiedDateAndTime,
    this.dateType,
    this.id,
    this.userId,
    this.accountId,
    this.subAccountId,
  });
}
