import 'package:hw2/domain/services/recipes_list_service.dart';

import '../entities/recipe.dart';

class RecipeDataProvider {
  final RecipesListService recipesListService;

  const RecipeDataProvider({required this.recipesListService});

  Recipe load(int index) {
    return recipesListService.recipes[index];
  }
}
