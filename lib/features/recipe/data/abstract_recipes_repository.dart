import 'package:hw2/features/recipe/domain/recipe.dart';

abstract class BaseRecipesRepository {
  Future<List<Recipe>> load();
}
