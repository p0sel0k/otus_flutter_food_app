import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_list_repository.g.dart';

class RecipesListRepository {
  Future<List> _readJson() async {
    final String recipes = await rootBundle.loadString('assets/recipes.json');
    return json.decode(recipes)['recipes'];
  }

  Future<List<Recipe>> load() async {
    var recipesJson = await _readJson();
    List<Recipe> recipes = [];
    for (var i = 0; i < recipesJson.length; i++) {
      Map<String, dynamic> curr = recipesJson[i];
      recipes.add(
        Recipe(
          title: curr["title"] ?? '',
          time: curr["time"] ?? '',
          imgPath: curr["image"] ?? '',
        ),
      );
    }
    return recipes;
  }
}

@riverpod
RecipesListRepository recipesListRepository(RecipesListRepositoryRef ref) {
  return RecipesListRepository();
}
