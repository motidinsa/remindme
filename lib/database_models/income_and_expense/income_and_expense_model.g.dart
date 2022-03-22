// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_and_expense_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IncomeAndExpenseModelAdapter extends TypeAdapter<IncomeAndExpenseModel> {
  @override
  final int typeId = 8;

  @override
  IncomeAndExpenseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IncomeAndExpenseModel(
      accountName: fields[18] as String,
      subcategoryId: fields[8] as int,
      dateAndTimeAdded: fields[1] as DateTime,
      lastModifiedDateAndTime: fields[2] as DateTime,
      dateType: fields[3] as String,
      id: fields[4] as int,
      userId: fields[5] as int,
      accountId: fields[17] as int,
      subAccountId: fields[19] as int,
      subSubcategoryName: fields[11] as String,
      categoryId: fields[6] as int,
      subcategoryName: fields[9] as String,
      categoryName: fields[7] as String,
      frequency: fields[13] as int,
      location: fields[16] as String,
      subSubcategoryId: fields[10] as int,
      name: fields[0] as String,
      netAmount: fields[12] as double,
      type: fields[14] as String,
      reasonId: fields[15] as int,
      subAccountName: fields[20] as String,
      subSubAccountId: fields[21] as int,
      subSubAccountName: fields[22] as String,
      orderNumber: fields[23] as int,
      selectedDateAndTime: fields[24] as DateTime,
      totalAmount: fields[25] as double,
    );
  }

  @override
  void write(BinaryWriter writer, IncomeAndExpenseModel obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.dateAndTimeAdded)
      ..writeByte(2)
      ..write(obj.lastModifiedDateAndTime)
      ..writeByte(3)
      ..write(obj.dateType)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(6)
      ..write(obj.categoryId)
      ..writeByte(7)
      ..write(obj.categoryName)
      ..writeByte(8)
      ..write(obj.subcategoryId)
      ..writeByte(9)
      ..write(obj.subcategoryName)
      ..writeByte(10)
      ..write(obj.subSubcategoryId)
      ..writeByte(11)
      ..write(obj.subSubcategoryName)
      ..writeByte(12)
      ..write(obj.netAmount)
      ..writeByte(13)
      ..write(obj.frequency)
      ..writeByte(14)
      ..write(obj.type)
      ..writeByte(15)
      ..write(obj.reasonId)
      ..writeByte(16)
      ..write(obj.location)
      ..writeByte(17)
      ..write(obj.accountId)
      ..writeByte(18)
      ..write(obj.accountName)
      ..writeByte(19)
      ..write(obj.subAccountId)
      ..writeByte(20)
      ..write(obj.subAccountName)
      ..writeByte(21)
      ..write(obj.subSubAccountId)
      ..writeByte(22)
      ..write(obj.subSubAccountName)
      ..writeByte(23)
      ..write(obj.orderNumber)
      ..writeByte(24)
      ..write(obj.selectedDateAndTime)
      ..writeByte(25)
      ..write(obj.totalAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeAndExpenseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
