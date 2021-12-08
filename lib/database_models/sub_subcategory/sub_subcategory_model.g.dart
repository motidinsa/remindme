// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_subcategory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubSubcategoryModelAdapter extends TypeAdapter<SubSubcategoryModel> {
  @override
  final int typeId = 2;

  @override
  SubSubcategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubSubcategoryModel(
      subSubcategoryName: fields[0] as String,
      subSubcategoryType: fields[6] as String,
      dateAndTimeAdded: fields[3] as DateTime,
      lastModifiedDateAndTime: fields[4] as DateTime,
      iconName: fields[1] as String,
      dateType: fields[5] as String,
      iconType: fields[2] as String,
      id: fields[9] as int,
      userId: fields[10] as int,
      categoryId: fields[7] as int,
      subcategoryId: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubSubcategoryModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.subSubcategoryName)
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
      ..write(obj.subSubcategoryType)
      ..writeByte(7)
      ..write(obj.categoryId)
      ..writeByte(8)
      ..write(obj.subcategoryId)
      ..writeByte(9)
      ..write(obj.id)
      ..writeByte(10)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubSubcategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
