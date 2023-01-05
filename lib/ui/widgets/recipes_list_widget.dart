import 'package:flutter/material.dart';
import 'package:hw2/ui/widgets/recipe_widget.dart';

class RecipesListWidget extends StatelessWidget {
  const RecipesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 80.0),
          itemCount: 7,
          itemBuilder: (context, index) => RecipeWidget.create(context, index),
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          destinations: const [
            NavigationDestination(
              label: 'Рецепты',
              selectedIcon: Icon(Icons.local_pizza,
                  color: Color.fromRGBO(46, 204, 113, 1)),
              icon: Icon(Icons.local_pizza,
                  color: Color.fromRGBO(194, 194, 194, 1)),
            ),
            NavigationDestination(
              label: 'Вход',
              selectedIcon:
                  Icon(Icons.person, color: Color.fromRGBO(46, 204, 113, 1)),
              icon: Icon(Icons.person, color: Color.fromRGBO(194, 194, 194, 1)),
            ),
          ],
        ));
  }
}
