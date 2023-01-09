import 'package:flutter/material.dart';
import 'package:hw2/domain/services/recipe_service.dart';
import 'package:hw2/domain/services/recipes_list_service.dart';
import 'package:provider/provider.dart';

class _RecipeState {
  final String title;
  final String time;
  final String img;

  _RecipeState({
    required this.title,
    required this.time,
    required this.img,
  });
}

class _RecipeViewModel extends ChangeNotifier {
  late _RecipeState _state;
  late RecipeService recipeService;

  _RecipeState get state => _state;

  _RecipeViewModel({
    required int index,
    required RecipesListService recipesListService,
  }) {
    recipeService = RecipeService(
      index: index,
      recipesListService: recipesListService,
    );
    var recipe = recipeService.recipe;
    _state = _RecipeState(
      title: recipe.title,
      img: recipe.imgPath,
      time: recipe.time,
    );
  }
}

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({super.key});

  static Widget create(
    BuildContext context,
    int index,
    RecipesListService recipesListService,
  ) {
    return ChangeNotifierProvider(
      create: (context) => _RecipeViewModel(
        index: index,
        recipesListService: recipesListService,
      ),
      child: const RecipeWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipe = context.read<_RecipeViewModel>();
    return Container(
      margin: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 24.0,
      ),
      height: 136,
      width: 396,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(149, 146, 146, 0.2),
            offset: Offset.fromDirection(0.0, 4.0),
            blurRadius: 4.0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/${recipe.state.img}',
            errorBuilder: (context, error, stackTrace) => Text(
                "An error occured while\nloading the image!\nThere're no image in\nassets with name:\n${recipe.state.img}"),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Flexible(
                  child: Text(
                    recipe.state.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(width: 11),
                    Text(
                      recipe.state.time,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(46, 204, 113, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 23),
        ],
      ),
    );
  }
}
