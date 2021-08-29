class Reason {
  final String name;
  final String amount;
  final int record;
  final int id;
  final int categoryID;
  final int subcategoryID;
  final String time;
  final String date;
  final String changedDate;
  final String changedTime;

  Reason(
      {this.amount,
      this.name,
      this.record,
      this.time,
      this.date,
      this.id,
      this.categoryID,
      this.changedDate,
      this.changedTime,
      this.subcategoryID});
}
