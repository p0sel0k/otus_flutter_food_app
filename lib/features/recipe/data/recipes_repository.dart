import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hw2/features/recipe/data/abstract_recipes_repository.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_repository.g.dart';

class RecipesRepository implements BaseRecipesRepository {
  Future<List> _readJson() async {
    final String recipes = await rootBundle.loadString('assets/recipes.json');
    return json.decode(recipes)['recipes'];
  }

  @override
  Future<List<Recipe>> load() async {
    var recipesJson = await _readJson();
    List<Recipe> recipes = [];
    for (var i = 0; i < recipesJson.length; i++) {
      Map<String, Object?> curr = recipesJson[i];
      recipes.add(Recipe.fromJson(curr));
    }
    return recipes;
  }
}

@riverpod
RecipesRepository recipesRepository(RecipesRepositoryRef ref) {
  return RecipesRepository();
}
