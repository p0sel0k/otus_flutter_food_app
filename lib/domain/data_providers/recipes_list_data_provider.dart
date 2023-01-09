import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hw2/domain/entities/recipe.dart';

class RecipesListDataProvider {
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
