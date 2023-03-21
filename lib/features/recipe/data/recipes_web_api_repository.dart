import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hw2/features/recipe/data/abstract_recipes_repository.dart';
import 'package:hw2/features/recipe/data/recipe_dto.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'recipe_hive_adapter.dart';

part 'recipes_web_api_repository.g.dart';

class RecipesWebApiRepository implements BaseRecipesRepository {
  final dio = Dio();

  @override
  Future<List<Recipe>> load() async {
    final List<Recipe> recipes = [];
    final Response<dynamic> response;
    try {
      response = await dio
          .get('https://www.themealdb.com/api/json/v1/1/search.php?f=a');
    } on DioError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    final List<dynamic> recipesJson = response.data['meals'];
    for (var rec in recipesJson) {
      recipes.add(dtoToRecipe(RecipeDto.fromJson(rec)));
      if (recipes.length > 10) break;
    }
    await save(recipes);
    return recipes;
  }

  Future<void> save(List<Recipe> recipes) async {
    final box = await Hive.openBox<RecipeHive>('recipes');
    for (final recipe in recipes) {
      box.put(recipe.info.title, RecipeHive.fromRecipe(recipe));
    }
  }
}

@riverpod
RecipesWebApiRepository recipesWebApiRepository(
    RecipesWebApiRepositoryRef ref) {
  return RecipesWebApiRepository();
}

final connectivityProvider = StreamProvider((ref) =>
    FlutterNetworkConnectivity(isContinousLookUp: true)
        .getInternetAvailabilityStream());
