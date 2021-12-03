// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_reason_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreviousReasonModelAdapter extends TypeAdapter<PreviousReasonModel> {
  @override
  final int typeId = 4;

  @override
  PreviousReasonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreviousReasonModel(
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
  void write(BinaryWriter writer, PreviousReasonModel obj) {
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
      other is PreviousReasonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
