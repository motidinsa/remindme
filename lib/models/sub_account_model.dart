class SubAccountModel {
  final String subAccountName;
  final DateTime dateAndTimeAdded;
  final DateTime lastModifiedDateAndTime;
  final String dateType;
  final int id;
  final int accountId;
  final String accountName;
  final int userId;
  final double balance;

  SubAccountModel(
      {this.subAccountName,
      this.balance,
      this.dateAndTimeAdded,
      this.lastModifiedDateAndTime,
      this.dateType,
      this.id,
      this.userId,
      this.accountId,
      this.accountName});
}
