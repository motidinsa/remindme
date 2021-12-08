// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubcategoryModelAdapter extends TypeAdapter<SubcategoryModel> {
  @override
  final int typeId = 1;

  @override
  SubcategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubcategoryModel(
      subcategoryName: fields[0] as String,
      subcategoryType: fields[6] as String,
      dateAndTimeAdded: fields[3] as DateTime,
      lastModifiedDateAndTime: fields[4] as DateTime,
      iconName: fields[1] as String,
      dateType: fields[5] as String,
      iconType: fields[2] as String,
      id: fields[8] as int,
      userId: fields[9] as int,
      categoryId: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubcategoryModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.subcategoryName)
      ..writeByte(1)
      ..write(obj.iconName)
      ..writeByte(2)
      ..write(obj.iconType)
      ..writeByte(3)
      ..write(obj.dateAndTimeAdded)
      ..writeByte(4)
      ..write(obj.lastModifiedDateAndTime)
      ..writeByte(5)
      ..write(obj.dateType)
      ..writeByte(6)
      ..write(obj.subcategoryType)
      ..writeByte(7)
      ..write(obj.categoryId)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubcategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
