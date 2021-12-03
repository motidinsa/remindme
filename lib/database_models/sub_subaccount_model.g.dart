// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_subaccount_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubSubAccountModelAdapter extends TypeAdapter<SubSubAccountModel> {
  @override
  final int typeId = 7;

  @override
  SubSubAccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubSubAccountModel(
      accountName: fields[0] as String,
      balance: fields[6] as double,
      dateAndTimeAdded: fields[1] as DateTime,
      lastModifiedDateAndTime: fields[2] as DateTime,
      dateType: fields[3] as String,
      id: fields[4] as int,
      userId: fields[5] as int,
      accountId: fields[7] as int,
      subAccountId: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubSubAccountModel obj) {
    writer
      ..writeByte(9)
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
      ..write(obj.accountId)
      ..writeByte(8)
      ..write(obj.subAccountId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubSubAccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
