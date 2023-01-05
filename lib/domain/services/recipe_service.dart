import 'package:hw2/domain/data_providers/recipe_data_provider.dart';
import 'package:hw2/domain/entities/recipe.dart';

class RecipeService {
  final recipeDataProvider = RecipeDataProvider();
  var _recipe = const Recipe('', '', '');

  Recipe get recipe => _recipe;

  Future<bool> loadRecipe(int index) async {
    _recipe = await recipeDataProvider.load(index);
    return true;
  }
}
