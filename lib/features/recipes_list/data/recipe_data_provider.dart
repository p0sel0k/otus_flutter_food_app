import 'package:hw2/features/recipes_list/application/recipes_list_service.dart';

import '../domain/recipe.dart';

class RecipeDataProvider {
  final RecipesListService recipesListService;

  const RecipeDataProvider({required this.recipesListService});

  Recipe load(int index) {
    return recipesListService.recipes[index];
  }
}
