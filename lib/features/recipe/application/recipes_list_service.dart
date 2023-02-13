import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:hw2/features/recipe/data/recipes_list_repositories/recipes_list_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_list_service.g.dart';

class RecipesListService {
  List<Recipe> recipes = [];
  final RecipesListRepository recipesListRepository;

  RecipesListService({required this.recipesListRepository});

  Future<List<Recipe>> loadRecipes() async {
    recipes = await recipesListRepository.load();
    return recipes;
  }
}

@riverpod
RecipesListService recipesListService(RecipesListServiceRef ref) {
  return RecipesListService(
      recipesListRepository: ref.watch(recipesListRepositoryProvider));
}
