import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/recipe/application/recipe_element_service.dart';

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
  late RecipeElementService recipeService;

  RecipeElementState get state => _state;

  RecipeElementController({
    required int index,
    required RecipeElementService recipeElementService,
  }) {
    var recipe = recipeElementService.loadRecipe(index);
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
