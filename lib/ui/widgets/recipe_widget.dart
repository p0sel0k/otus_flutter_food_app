import 'package:flutter/material.dart';
import 'package:hw2/domain/services/recipe_service.dart';
import 'package:provider/provider.dart';

class _RecipeState {
  final String title;
  final String time;
  final String img;

  _RecipeState({required this.title, required this.time, required this.img});
}

class _RecipeViewModel extends ChangeNotifier {
  late Future<bool> loadedRecipe;
  late _RecipeState _state;
  final recipeService = RecipeService();

  _RecipeState get state => _state;

  _RecipeViewModel(int index) {
    loadedRecipe = recipeService.loadRecipe(index);
  }

  void init() {
    var recipe = recipeService.recipe;
    _state = _RecipeState(
        title: recipe.title, img: recipe.imgPath, time: recipe.time);
  }
}

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({super.key});

  static Widget create(BuildContext context, int index) {
    return ChangeNotifierProvider(
      create: (context) => _RecipeViewModel(index),
      child: const RecipeWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipe = context.read<_RecipeViewModel>();
    return FutureBuilder(
        future: recipe.loadedRecipe,
        builder: (_, snapshot) {
          recipe.init();
          return snapshot.data == true
              ? Container(
                  margin: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 24.0),
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
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/${recipe.state.img}'),
                      ),
                      const Padding(padding: EdgeInsets.all(16.0)),
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
                                style: const TextStyle(fontSize: 22),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.schedule),
                                const Padding(
                                    padding: EdgeInsets.only(right: 11)),
                                Text(recipe.state.time,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromRGBO(46, 204, 113, 1))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(value: 1.0);
        });
  }
}
