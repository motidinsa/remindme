// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 0;

  @override
  CategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModel(
      categoryName: fields[0] as String,
      categoryType: fields[6] as String,
      dateAndTimeAdded: fields[3] as DateTime,
      lastModifiedDateAndTime: fields[4] as DateTime,
      iconName: fields[1] as String,
      dateType: fields[5] as String,
      iconType: fields[2] as String,
      id: fields[7] as int,
      userId: fields[8] as int,
      orderNumber: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.categoryName)
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
      ..write(obj.categoryType)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.userId)
      ..writeByte(9)
      ..write(obj.orderNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
