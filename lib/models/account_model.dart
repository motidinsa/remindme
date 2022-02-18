class AccountModel {
  final String accountName;

  final DateTime dateAndTimeAdded;

  final DateTime lastModifiedDateAndTime;

  final String dateType;

  final int id;

  final int userId;

  final double balance;
  final bool hasSubAccount;

  AccountModel({
    this.accountName,
    this.balance,
    this.dateAndTimeAdded,
    this.lastModifiedDateAndTime,
    this.dateType,
    this.id,
    this.userId,
    this.hasSubAccount,
  });
}
