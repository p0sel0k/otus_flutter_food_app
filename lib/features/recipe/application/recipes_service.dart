import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:hw2/features/recipe/data/camera_api_repository.dart';
import 'package:hw2/features/recipe/data/recipes_repository.dart';
import 'package:hw2/features/recipe/data/recipes_web_api_repository.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_service.g.dart';

class RecipesService {
  List<Recipe> recipes = [];
  final RecipesRepository recipesRepository;
  final RecipesWebApiRepository recipesWebApiRepository;
  final CameraApiRepository cameraApiRepository;

  RecipesService({
    required this.cameraApiRepository,
    required this.recipesRepository,
    required this.recipesWebApiRepository,
  });

  Future<CameraController> get cameraController =>
      cameraApiRepository.controller;

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

  Future<void> changeFavoriteState(int id) async {
    final recipe = getRecipe(id);
    final newRecipe = recipe.copyWith(
        info: recipe.info.copyWith(isFavorite: !recipe.info.isFavorite));
    recipes[id] = newRecipe;
    await recipesRepository.save(newRecipe);
  }
}

@riverpod
RecipesService recipesService(RecipesServiceRef ref) {
  return RecipesService(
      cameraApiRepository: ref.watch(cameraApiRepositoryProvider),
      recipesWebApiRepository: ref.watch(recipesWebApiRepositoryProvider),
      recipesRepository: ref.watch(recipesRepositoryProvider));
}
