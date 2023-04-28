import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/recipe/application/recipes_service.dart';

class RecipeElementState {
  final String title;
  final String time;
  final String imgPath;
  final Uint8List base64;

  RecipeElementState({
    required this.title,
    required this.time,
    required this.imgPath,
    required this.base64,
  });
}

class RecipeElementController extends ChangeNotifier {
  late RecipeElementState _state;

  RecipeElementState get state => _state;

  RecipeElementController({
    required int index,
    required RecipesService recipesService,
  }) {
    updateRecipe(index, recipesService);
  }

  void updateRecipe(int index, RecipesService recipesService) {
    var recipe = recipesService.getRecipeInfo(index);
    _state = RecipeElementState(
      title: recipe.title,
      imgPath: recipe.imgPath,
      time: recipe.time,
      base64: Uint8List.fromList(recipe.base64Img.codeUnits),
    );
  }
}

final recipeElementControllerProvider = ChangeNotifierProvider.autoDispose
    .family<RecipeElementController, int>((ref, index) {
  throw UnimplementedError();
});
