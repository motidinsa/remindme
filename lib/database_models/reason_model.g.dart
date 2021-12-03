// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReasonModelAdapter extends TypeAdapter<ReasonModel> {
  @override
  final int typeId = 3;

  @override
  ReasonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReasonModel(
      lastModifiedDateAndTime: fields[6] as String,
      name: fields[4] as String,
      dateAndTimeAdded: fields[5] as String,
      id: fields[0] as int,
      categoryId: fields[1] as int,
      subcategoryId: fields[2] as int,
      subSubcategoryId: fields[3] as int,
      location: fields[7] as String,
      userId: fields[8] as int,
      dateType: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReasonModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.subcategoryId)
      ..writeByte(3)
      ..write(obj.subSubcategoryId)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.dateAndTimeAdded)
      ..writeByte(6)
      ..write(obj.lastModifiedDateAndTime)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.userId)
      ..writeByte(9)
      ..write(obj.dateType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReasonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
