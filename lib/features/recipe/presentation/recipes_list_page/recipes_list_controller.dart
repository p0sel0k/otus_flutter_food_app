import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:hw2/features/recipe/application/recipes_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_list_controller.g.dart';

@riverpod
class RecipesListController extends _$RecipesListController {
  // final _recipesListService = RecipesListService();

  @override
  FutureOr<List<Recipe>> build() {
    return ref.watch(recipesServiceProvider).loadRecipes();
  }
}
