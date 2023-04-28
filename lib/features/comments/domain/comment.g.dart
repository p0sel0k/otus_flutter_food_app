// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      username: json['username'] as String,
      date: DateTime.parse(json['date'] as String),
      comment: json['comment'] as String,
      img: json['img'] as String,
      recipeId: json['recipeId'] as int,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'username': instance.username,
      'date': instance.date.toIso8601String(),
      'comment': instance.comment,
      'img': instance.img,
      'recipeId': instance.recipeId,
    };
