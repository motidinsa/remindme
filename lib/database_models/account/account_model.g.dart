// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountDatabaseModelAdapter extends TypeAdapter<AccountDatabaseModel> {
  @override
  final int typeId = 5;

  @override
  AccountDatabaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountDatabaseModel(
      accountName: fields[0] as String,
      balance: fields[6] as double,
      dateAndTimeAdded: fields[1] as DateTime,
      lastModifiedDateAndTime: fields[2] as DateTime,
      dateType: fields[3] as String,
      id: fields[4] as int,
      userId: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AccountDatabaseModel obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.balance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AccountDatabaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
