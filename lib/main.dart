import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hw2/features/comments/data/comment_hive_adapter.dart';
import 'package:hw2/features/recipe/data/recipe_hive_adapter.dart';
import 'package:hw2/navigation/router.dart';

void main() async {
  await _initLocalDB();
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Рецепты',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(
            secondary: const Color.fromRGBO(46, 204, 113, 1),
          ),
        ),
      ),
    );
  }
}

Future<void> _initLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecordHiveAdapter());
  Hive.registerAdapter(RecipeInfoHiveAdapter());
  Hive.registerAdapter(RecipeDetailsHiveAdapter());
  Hive.registerAdapter(RecipeHiveAdapter());
  Hive.registerAdapter(CommentHiveAdapter());
}
