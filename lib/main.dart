import 'package:flutter/material.dart';
import 'package:hw2/ui/widgets/recipes_list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Рецепты',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: const Color.fromRGBO(46, 204, 113, 1)),
      ),
      home: const RecipesListPage(),
    );
  }
}
