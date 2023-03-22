// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeInfo _$$_RecipeInfoFromJson(Map<String, dynamic> json) =>
    _$_RecipeInfo(
      title: json['title'] as String,
      time: json['time'] as String,
      imgPath: json['imgPath'] as String? ?? '',
      base64Img: json['base64Img'] as String? ?? baseImg,
    );

Map<String, dynamic> _$$_RecipeInfoToJson(_$_RecipeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'time': instance.time,
      'imgPath': instance.imgPath,
      'base64Img': instance.base64Img,
    };

_$_RecipeDetails _$$_RecipeDetailsFromJson(Map<String, dynamic> json) =>
    _$_RecipeDetails(
      stepsWithDescriprion: (json['steps'] as List<dynamic>?)
              ?.map((e) => CustomRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => CustomRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RecipeDetailsToJson(_$_RecipeDetails instance) =>
    <String, dynamic>{
      'steps': instance.stepsWithDescriprion,
      'ingredients': instance.ingredients,
    };

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      info: RecipeInfo.fromJson(json['info'] as Map<String, dynamic>),
      details: RecipeDetails.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'info': instance.info,
      'details': instance.details,
    };
