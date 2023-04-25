import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hw2/utils/constants.dart';
import 'package:hw2/utils/record.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class RecipeInfo with _$RecipeInfo {
  const factory RecipeInfo({
    required String title,
    required String time,
    @Default('') String imgPath,
    @Default(baseImg) String base64Img,
    @Default(false) bool isFavorite,
  }) = _RecipeInfo;

  factory RecipeInfo.fromJson(Map<String, Object?> json) =>
      _$RecipeInfoFromJson(json);
}

@freezed
class RecipeDetails with _$RecipeDetails {
  const factory RecipeDetails({
    @JsonKey(name: 'steps')
    @Default([])
        List<CustomRecord> stepsWithDescriprion,
    @Default([]) List<CustomRecord> ingredients,
  }) = _RecipeDetails;

  factory RecipeDetails.fromJson(Map<String, Object?> json) =>
      _$RecipeDetailsFromJson(json);
}

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required RecipeInfo info,
    required RecipeDetails details,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
