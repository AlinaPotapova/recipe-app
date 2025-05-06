// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveRecipeAdapter extends TypeAdapter<HiveRecipe> {
  @override
  final int typeId = 0;

  @override
  HiveRecipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveRecipe(
      id: fields[0] as String?,
      photoUrl: fields[1] as String?,
      name: fields[2] as String?,
      isFavorite: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveRecipe obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.photoUrl)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveRecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
