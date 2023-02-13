import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:hw2/features/recipe/application/recipes_list_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_element_repository.g.dart';

class RecipeElementRepository {
  final RecipesListService recipesListService;

  const RecipeElementRepository({required this.recipesListService});

  Recipe load(int index) {
    return recipesListService.recipes[index];
  }
}

@riverpod
RecipeElementRepository recipeElementRepository(
    RecipeElementRepositoryRef ref) {
  return RecipeElementRepository(
      recipesListService: ref.watch(recipesListServiceProvider));
}
