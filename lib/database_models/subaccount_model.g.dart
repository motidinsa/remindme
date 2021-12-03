// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subaccount_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubAccountModelAdapter extends TypeAdapter<SubAccountModel> {
  @override
  final int typeId = 6;

  @override
  SubAccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubAccountModel(
      accountName: fields[0] as String,
      balance: fields[6] as double,
      dateAndTimeAdded: fields[1] as DateTime,
      lastModifiedDateAndTime: fields[2] as DateTime,
      dateType: fields[3] as String,
      id: fields[4] as int,
      userId: fields[5] as int,
      accountId: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubAccountModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.accountName)
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
      ..write(obj.balance)
      ..writeByte(7)
      ..write(obj.accountId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubAccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
