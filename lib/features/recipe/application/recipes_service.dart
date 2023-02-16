import 'package:hw2/features/recipe/data/abstract_recipes_repository.dart';
import 'package:hw2/features/recipe/data/recipes_repository.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_service.g.dart';

class RecipesService {
  List<Recipe> recipes = [];
  final BaseRecipesRepository recipesRepository;

  RecipesService({required this.recipesRepository});

  Future<List<Recipe>> loadRecipes() async {
    recipes = await recipesRepository.load();
    return recipes;
  }

  RecipeInfo loadRecipeInfo(int index) {
    return recipes[index].info;
  }

  Recipe loadRecipe(int index) {
    return recipes[index];
  }
}

@riverpod
RecipesService recipesService(RecipesServiceRef ref) {
  return RecipesService(
      recipesRepository: ref.watch(recipesRepositoryProvider));
}
