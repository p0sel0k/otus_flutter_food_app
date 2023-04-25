import 'package:hive/hive.dart';
import 'package:hw2/features/recipe/data/abstract_recipes_repository.dart';
import 'package:hw2/features/recipe/data/recipe_hive_adapter.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_repository.g.dart';

class RecipesRepository implements BaseRecipesRepository {
  @override
  Future<List<Recipe>> load() async {
    List<Recipe> recipes = [];
    final box = await Hive.openBox<RecipeHive>('recipes');
    for (final key in box.keys) {
      final recipeHive = box.get(key);
      if (recipeHive == null) {
        throw 'Hive Error! Key does not exist';
      }
      recipes.add(recipeHive.intoRecipe());
    }
    return recipes;
  }

  Future<Recipe> loadNamed(String name) async {
    final box = await Hive.openBox<RecipeHive>('recipes');
    final recipe = box.get(name)?.intoRecipe();
    if (recipe == null) {
      throw '[RecipesRepository]: There are no recipe with name: $name';
    }
    return recipe;
  }

  Future<void> save(Recipe recipe) async {
    final box = await Hive.openBox<RecipeHive>('recipes');
    await box.put(recipe.info.title, RecipeHive.fromRecipe(recipe));
  }
}

@riverpod
RecipesRepository recipesRepository(RecipesRepositoryRef ref) {
  return RecipesRepository();
}
