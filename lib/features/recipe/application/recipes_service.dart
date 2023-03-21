import 'package:dio/dio.dart';
import 'package:hw2/features/recipe/data/recipes_repository.dart';
import 'package:hw2/features/recipe/data/recipes_web_api_repository.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_service.g.dart';

class RecipesService {
  List<Recipe> recipes = [];
  final RecipesRepository recipesRepository;
  final RecipesWebApiRepository recipesWebApiRepository;

  RecipesService({
    required this.recipesRepository,
    required this.recipesWebApiRepository,
  });

  Future<List<Recipe>> loadRecipes() async {
    try {
      recipes = await recipesWebApiRepository.load();
    } on DioError catch (_) {
      recipes = await recipesRepository.load();
    }
    return recipes;
  }

  RecipeInfo getRecipeInfo(int index) {
    return recipes[index].info;
  }

  Recipe getRecipe(int index) {
    return recipes[index];
  }
}

@riverpod
RecipesService recipesService(RecipesServiceRef ref) {
  return RecipesService(
      recipesWebApiRepository: ref.watch(recipesWebApiRepositoryProvider),
      recipesRepository: ref.watch(recipesRepositoryProvider));
}
