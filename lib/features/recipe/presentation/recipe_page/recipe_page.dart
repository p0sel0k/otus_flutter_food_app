import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/comments/presentation/leave_comment_widget.dart';
import 'package:hw2/features/comments/presentation/comments_widget.dart';
import 'package:hw2/features/recipe/presentation/recipe_page/recipe_controller.dart';
import 'package:hw2/features/recipe/presentation/recipe_page/widgets/recipe_header.dart';
import 'package:hw2/features/recipe/presentation/recipe_page/widgets/recipe_ingredients.dart';

import 'widgets/recipe_steps.dart';

class RecipePage extends ConsumerWidget {
  final int id;
  const RecipePage({required this.id, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.watch(recipeControllerProvider(id));
    const color = Color.fromRGBO(22, 89, 50, 1);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title:
            const Center(child: Text('Рецепт', style: TextStyle(color: color))),
        actions: [
          IconButton(
            icon: const Icon(Icons.campaign_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: recipe.when(
          data: (data) => RecipeListView(recipe: data, id: id + 1),
          error: (error, _) => Text('error occured: $error'),
          loading: () => const CircularProgressIndicator()),
    ));
  }
}

class RecipeListView extends StatelessWidget {
  final RecipeState recipe;
  final int id;

  const RecipeListView({super.key, required this.recipe, required this.id});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RecipeHeader(
          title: recipe.title,
          imgPath: recipe.imgPath,
          time: recipe.time,
        ),
        Ingredients(
          ingredients: recipe.ingredients,
        ),
        CookingSteps(steps: recipe.steps),
        const SizedBox(height: 32),
        const Divider(color: Color.fromRGBO(121, 118, 118, 1)),
        const CommentsWidget(),
        const LeaveCommentWidget(),
      ],
    );
  }
}
