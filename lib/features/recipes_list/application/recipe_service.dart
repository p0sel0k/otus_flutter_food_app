import 'package:hw2/features/recipes_list/data/recipe_data_provider.dart';
import 'package:hw2/features/recipes_list/domain/recipe.dart';
import 'package:hw2/features/recipes_list/application/recipes_list_service.dart';

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
