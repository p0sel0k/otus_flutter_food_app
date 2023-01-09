import 'package:hw2/domain/data_providers/recipe_data_provider.dart';
import 'package:hw2/domain/entities/recipe.dart';
import 'package:hw2/domain/services/recipes_list_service.dart';

class RecipeService {
  late RecipeDataProvider recipeDataProvider;
  var _recipe = const Recipe(imgPath: '', time: '', title: '');

  RecipeService({
    required int index,
    required RecipesListService recipesListService,
  }) {
    recipeDataProvider =
        RecipeDataProvider(recipesListService: recipesListService);
    loadRecipe(index);
  }

  Recipe get recipe => _recipe;

  bool loadRecipe(int index) {
    _recipe = recipeDataProvider.load(index);
    return true;
  }
}
