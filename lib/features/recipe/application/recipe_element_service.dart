import 'package:hw2/features/recipe/data/recipes_list_repositories/recipe_element_repository.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_element_service.g.dart';

class RecipeElementService {
  final RecipeElementRepository recipeElementRepository;

  RecipeElementService({
    required this.recipeElementRepository,
  });

  Recipe loadRecipe(int index) {
    return recipeElementRepository.load(index);
  }
}

@riverpod
RecipeElementService recipeElementService(RecipeElementServiceRef ref) {
  return RecipeElementService(
      recipeElementRepository: ref.watch(recipeElementRepositoryProvider));
}
