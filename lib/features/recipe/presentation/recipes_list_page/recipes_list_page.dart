import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:hw2/features/recipe/presentation/recipes_list_page/recipe_element_widget.dart';
import 'package:hw2/features/recipe/presentation/recipes_list_page/recipes_list_controller.dart';

class RecipesListPage extends ConsumerWidget {
  const RecipesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recipesListControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: state.when(
          data: (data) => buildListView(data),
          loading: () => const CircularProgressIndicator(),
          error: (Object error, StackTrace stackTrace) =>
              Text('error occured: $error'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: const Color.fromRGBO(46, 204, 113, 1),
        items: const [
          BottomNavigationBarItem(
            label: 'Рецепты',
            activeIcon: Icon(
              Icons.local_pizza,
              color: Color.fromRGBO(46, 204, 113, 1),
            ),
            icon: Icon(
              Icons.local_pizza,
              color: Color.fromRGBO(194, 194, 194, 1),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Вход',
            activeIcon: Icon(
              Icons.person,
              color: Color.fromRGBO(46, 204, 113, 1),
            ),
            icon: Icon(
              Icons.person,
              color: Color.fromRGBO(194, 194, 194, 1),
            ),
          ),
        ],
      ),
    );
  }

  ListView buildListView(List<Recipe> recipes) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 80.0),
      itemCount: recipes.length,
      itemBuilder: (context, index) => RecipeElementWidget.create(
        index,
      ),
    );
  }
}
