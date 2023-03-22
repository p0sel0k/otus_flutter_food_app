// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeHiveAdapter extends TypeAdapter<RecipeHive> {
  @override
  final int typeId = 1;

  @override
  RecipeHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeHive(
      info: fields[0] as RecipeInfoHive,
      details: fields[1] as RecipeDetailsHive,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.info)
      ..writeByte(1)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecipeInfoHiveAdapter extends TypeAdapter<RecipeInfoHive> {
  @override
  final int typeId = 2;

  @override
  RecipeInfoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeInfoHive(
      base64Img: fields[3] == null
          ? 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAIAQMAAAD+wSzIAAAABlBMVEX///+/v7+jQ3Y5AAAADklEQVQI12P5AIX8EAgALgAD/aNpbtEAAAAASUVORK5CYII'
          : fields[3] as String,
      title: fields[0] as String,
      time: fields[1] as String,
      imgPath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeInfoHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.imgPath)
      ..writeByte(3)
      ..write(obj.base64Img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeInfoHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecipeDetailsHiveAdapter extends TypeAdapter<RecipeDetailsHive> {
  @override
  final int typeId = 3;

  @override
  RecipeDetailsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeDetailsHive(
      stepsWithDesription: (fields[0] as List).cast<RecordHive>(),
      ingredients: (fields[1] as List).cast<RecordHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipeDetailsHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.stepsWithDesription)
      ..writeByte(1)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeDetailsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecordHiveAdapter extends TypeAdapter<RecordHive> {
  @override
  final int typeId = 4;

  @override
  RecordHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecordHive(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecordHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.first)
      ..writeByte(1)
      ..write(obj.second);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
