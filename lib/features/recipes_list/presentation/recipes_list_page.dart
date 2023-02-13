import 'package:flutter/material.dart';
import 'package:hw2/features/recipes_list/domain/recipe.dart';
import 'package:hw2/features/recipes_list/application/recipes_list_service.dart';
import 'package:hw2/features/recipes_list/presentation/recipe_widget.dart';
import 'package:provider/provider.dart';

class _RecipesListViewModel extends ChangeNotifier {
  final _recipesListService = RecipesListService();
  late Future<bool> isLoaded;

  List<Recipe> get recipes => _recipesListService.recipes;

  _RecipesListViewModel() {
    isLoaded = _recipesListService.loadRecipes();
  }
}

class RecipesListPage extends StatelessWidget {
  const RecipesListPage({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => _RecipesListViewModel(),
      child: const RecipesListPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<_RecipesListViewModel>();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: vm.isLoaded,
          builder: (_, snapshot) => snapshot.hasData
              ? ListView.builder(
                  padding: const EdgeInsets.only(top: 80.0),
                  itemCount: vm.recipes.length,
                  itemBuilder: (context, index) => RecipeWidget.create(
                    context,
                    index,
                    vm._recipesListService,
                  ),
                )
              : const CircularProgressIndicator(),
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
}
