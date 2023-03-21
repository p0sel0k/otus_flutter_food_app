import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:hw2/utils/record.dart';

part 'recipe_dto.g.dart';
part 'recipe_dto.freezed.dart';

@freezed
class RecipeDto with _$RecipeDto {
  const factory RecipeDto({
    required String strMeal,
    required String strInstructions,
    required String strMealThumb,
    @Default('') String strIngredient1,
    @Default('') String strIngredient2,
    @Default('') String strIngredient3,
    @Default('') String strIngredient4,
    @Default('') String strIngredient5,
    @Default('') String strIngredient6,
    @Default('') String strIngredient7,
    @Default('') String strIngredient8,
    @Default('') String strIngredient9,
    @Default('') String strIngredient10,
    @Default('') String strIngredient11,
    @Default('') String strIngredient12,
    @Default('') String strIngredient13,
    @Default('') String strIngredient14,
    @Default('') String strIngredient15,
    @Default('') String strIngredient16,
    @Default('') String strIngredient17,
    @Default('') String strIngredient18,
    @Default('') String strIngredient19,
    @Default('') String strIngredient20,
    @Default('') String strMeasure1,
    @Default('') String strMeasure2,
    @Default('') String strMeasure3,
    @Default('') String strMeasure4,
    @Default('') String strMeasure5,
    @Default('') String strMeasure6,
    @Default('') String strMeasure7,
    @Default('') String strMeasure8,
    @Default('') String strMeasure9,
    @Default('') String strMeasure10,
    @Default('') String strMeasure11,
    @Default('') String strMeasure12,
    @Default('') String strMeasure13,
    @Default('') String strMeasure14,
    @Default('') String strMeasure15,
    @Default('') String strMeasure16,
    @Default('') String strMeasure17,
    @Default('') String strMeasure18,
    @Default('') String strMeasure19,
    @Default('') String strMeasure20,
  }) = _RecipeDto;

  factory RecipeDto.fromJson(Map<String, Object?> json) =>
      _$RecipeDtoFromJson(json);
}

Recipe dtoToRecipe(RecipeDto dto) {
  const int cookingTime = 45;
  final info = RecipeInfo(
      title: dto.strMeal, time: '$cookingTime min', imgPath: dto.strMealThumb);
  final details = RecipeDetails(
      stepsWithDescriprion: _getSteps(dto, cookingTime),
      ingredients: _getNonNullableIngredients(dto));
  return Recipe(
    info: info,
    details: details,
  );
}

List<CustomRecord> _getSteps(RecipeDto dto, int cookingTime) {
  final steps = dto.strInstructions.split('\r\n');
  final stepTime = cookingTime * 60 / steps.length;
  final time = Duration(seconds: stepTime.toInt());
  final minutes = '${(time.inSeconds / 60).floor()}:${time.inSeconds % 60}';
  final List<CustomRecord> stepsWithTime =
      steps.map((e) => CustomRecord(first: e, second: minutes)).toList();
  return stepsWithTime;
}

List<CustomRecord> _getNonNullableIngredients(RecipeDto dto) {
  final ingredients = [
    CustomRecord(first: dto.strIngredient1, second: dto.strMeasure1),
    CustomRecord(first: dto.strIngredient2, second: dto.strMeasure2),
    CustomRecord(first: dto.strIngredient3, second: dto.strMeasure3),
    CustomRecord(first: dto.strIngredient4, second: dto.strMeasure4),
    CustomRecord(first: dto.strIngredient5, second: dto.strMeasure5),
    CustomRecord(first: dto.strIngredient6, second: dto.strMeasure6),
    CustomRecord(first: dto.strIngredient7, second: dto.strMeasure7),
    CustomRecord(first: dto.strIngredient8, second: dto.strMeasure8),
    CustomRecord(first: dto.strIngredient9, second: dto.strMeasure9),
    CustomRecord(first: dto.strIngredient10, second: dto.strMeasure10),
    CustomRecord(first: dto.strIngredient11, second: dto.strMeasure11),
    CustomRecord(first: dto.strIngredient12, second: dto.strMeasure12),
    CustomRecord(first: dto.strIngredient13, second: dto.strMeasure13),
    CustomRecord(first: dto.strIngredient14, second: dto.strMeasure14),
    CustomRecord(first: dto.strIngredient15, second: dto.strMeasure15),
    CustomRecord(first: dto.strIngredient16, second: dto.strMeasure16),
    CustomRecord(first: dto.strIngredient17, second: dto.strMeasure17),
    CustomRecord(first: dto.strIngredient18, second: dto.strMeasure18),
    CustomRecord(first: dto.strIngredient19, second: dto.strMeasure19),
    CustomRecord(first: dto.strIngredient20, second: dto.strMeasure20),
  ];
  final result = ingredients.where((element) => element.first != '').toList();
  return result;
}
