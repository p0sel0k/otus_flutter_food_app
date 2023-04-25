// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommentHiveAdapter extends TypeAdapter<CommentHive> {
  @override
  final int typeId = 5;

  @override
  CommentHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommentHive(
      recipeId: fields[4] as int,
      username: fields[0] as String,
      date: fields[1] as String,
      comment: fields[2] as String,
      img: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CommentHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(3)
      ..write(obj.img)
      ..writeByte(4)
      ..write(obj.recipeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
