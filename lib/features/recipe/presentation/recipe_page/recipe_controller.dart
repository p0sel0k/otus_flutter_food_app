import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:hw2/features/recipe/application/recipes_service.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:hw2/utils/record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_controller.g.dart';

@riverpod
class RecipeController extends _$RecipeController {
  @override
  FutureOr<RecipeState> build(int index) {
    return RecipeState.fromModel(
        ref.watch(recipesServiceProvider).getRecipe(index));
  }

  Future<CameraController> get cameraController =>
      ref.watch(recipesServiceProvider).cameraController;

  void changeFavoriteState(int id) {
    ref.read(recipesServiceProvider).changeFavoriteState(id);
    state = AsyncValue.data(
        RecipeState.fromModel(ref.watch(recipesServiceProvider).getRecipe(id)));
  }
}

class RecipeState {
  final String title;
  final String time;
  final String imgPath;
  final Uint8List base64;
  final List<CustomRecord> ingredients;
  final List<CustomRecord> steps;
  final bool isFavorite;

  RecipeState({
    required this.isFavorite,
    required this.title,
    required this.time,
    required this.imgPath,
    required this.base64,
    required this.ingredients,
    required this.steps,
  });

  factory RecipeState.fromModel(Recipe recipe) => RecipeState(
        steps: recipe.details.stepsWithDescriprion,
        imgPath: recipe.info.imgPath,
        base64: Uint8List.fromList(recipe.info.base64Img.codeUnits),
        ingredients: recipe.details.ingredients,
        isFavorite: recipe.info.isFavorite,
        time: recipe.info.time,
        title: recipe.info.title,
      );
}
