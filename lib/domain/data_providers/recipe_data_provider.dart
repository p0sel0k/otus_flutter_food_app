import 'package:flutter/services.dart';

import '../entities/recipe.dart';
import 'dart:convert';

class RecipeDataProvider {
  Future<List> _readJson() async {
    final String recipes = await rootBundle.loadString('assets/recipes.json');
    return json.decode(recipes)['recipes'];
  }

  Future<Recipe> load(int index) async {
    var recipes = await _readJson();
    Map<String, dynamic> curr = recipes[index];
    return Recipe(curr["title"] ?? '', curr["time"] ?? '', curr["image"] ?? '');
  }
}
