import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/recipe/application/recipes_service.dart';

class RecipeElementState {
  final String title;
  final String time;
  final String img;

  RecipeElementState({
    required this.title,
    required this.time,
    required this.img,
  });
}

class RecipeElementController extends ChangeNotifier {
  late RecipeElementState _state;

  RecipeElementState get state => _state;

  RecipeElementController({
    required int index,
    required RecipesService recipesService,
  }) {
    var recipe = recipesService.loadRecipeInfo(index);
    _state = RecipeElementState(
      title: recipe.title,
      img: recipe.imgPath,
      time: recipe.time,
    );
  }
}

final recipeElementControllerProvider = ChangeNotifierProvider.autoDispose
    .family<RecipeElementController, int>((ref, index) {
  throw UnimplementedError();
});
