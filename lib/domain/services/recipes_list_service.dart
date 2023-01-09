import 'package:hw2/domain/data_providers/recipes_list_data_provider.dart';
import 'package:hw2/domain/entities/recipe.dart';

class RecipesListService {
  final _recipesDataProvider = RecipesListDataProvider();
  List<Recipe> recipes = [];

  Future<bool> loadRecipes() async {
    recipes = await _recipesDataProvider.load();
    return true;
  }
}
