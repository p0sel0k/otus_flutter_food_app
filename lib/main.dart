import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hw2/features/recipe/data/recipe_hive_adapter.dart';
import 'package:hw2/features/recipe/presentation/recipes_list_page/recipes_list_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecordHiveAdapter());
  Hive.registerAdapter(RecipeInfoHiveAdapter());
  Hive.registerAdapter(RecipeDetailsHiveAdapter());
  Hive.registerAdapter(RecipeHiveAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Рецепты',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(
            secondary: const Color.fromRGBO(46, 204, 113, 1),
          ),
        ),
        home: const RecipesListPage(),
      ),
    );
  }
}
