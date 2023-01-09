import 'package:flutter/material.dart';
import 'package:hw2/ui/widgets/recipe_widget.dart';

class RecipesListPage extends StatelessWidget {
  const RecipesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 80.0),
            itemCount: 7,
            itemBuilder: (context, index) =>
                RecipeWidget.create(context, index),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              label: 'Рецепты',
              activeIcon: Icon(Icons.local_pizza,
                  color: Color.fromRGBO(46, 204, 113, 1)),
              icon: Icon(Icons.local_pizza,
                  color: Color.fromRGBO(194, 194, 194, 1)),
            ),
            BottomNavigationBarItem(
              label: 'Вход',
              activeIcon:
                  Icon(Icons.person, color: Color.fromRGBO(46, 204, 113, 1)),
              icon: Icon(Icons.person, color: Color.fromRGBO(194, 194, 194, 1)),
            ),
          ],
        ));
  }
}
