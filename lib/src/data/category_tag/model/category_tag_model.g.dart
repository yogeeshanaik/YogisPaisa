// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_tag_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryTagModelAdapter extends TypeAdapter<CategoryTagModel> {
  @override
  final int typeId = 100;

  @override
  CategoryTagModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryTagModel(
      name: fields[0] as String,
      categoryId: fields[1] as int?,
      superId: fields[2] == null ? 0 : fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryTagModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.superId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTagModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
