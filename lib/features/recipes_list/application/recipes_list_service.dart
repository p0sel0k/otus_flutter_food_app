import 'package:hw2/features/recipes_list/data/recipes_list_data_provider.dart';
import 'package:hw2/features/recipes_list/domain/recipe.dart';

class RecipesListService {
  final _recipesDataProvider = RecipesListDataProvider();
  List<Recipe> recipes = [];

  Future<bool> loadRecipes() async {
    recipes = await _recipesDataProvider.load();
    return true;
  }
}
