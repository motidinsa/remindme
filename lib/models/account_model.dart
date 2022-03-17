class AccountModel {
  final String accountName;

  final DateTime dateAndTimeAdded;

  final DateTime lastModifiedDateAndTime;

  final String dateType;

  final int id;

  final int userId;

  final double balance;
  final bool hasSubAccount;
  bool isSelected;
  bool isDefault;

  AccountModel(
      {this.accountName,
      this.balance,
      this.dateAndTimeAdded,
      this.lastModifiedDateAndTime,
      this.dateType,
      this.id,
      this.userId,
      this.hasSubAccount,
      this.isSelected,
      this.isDefault});
}
