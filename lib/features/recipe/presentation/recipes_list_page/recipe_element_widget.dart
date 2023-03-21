import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/recipe/application/recipes_service.dart';
import 'package:hw2/features/recipe/data/recipes_web_api_repository.dart';
import 'package:hw2/features/recipe/presentation/recipe_page/recipe_page.dart';
import 'package:hw2/features/recipe/presentation/recipes_list_page/recipe_element_controller.dart';

class RecipeElementWidget extends ConsumerWidget {
  const RecipeElementWidget({required this.index, super.key});
  final int index;

  static Widget create(
    int index,
  ) {
    return ProviderScope(
      overrides: [
        recipeElementControllerProvider.overrideWith(
          (ref, i) => RecipeElementController(
            index: i,
            recipesService: ref.watch(recipesServiceProvider),
          ),
        ),
      ],
      child: RecipeElementWidget(index: index),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(recipeElementControllerProvider(index));
    final connectivity = ref.watch(connectivityProvider);
    print(controller.state.img);
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => RecipePage(id: index))),
      child: Container(
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
            connectivity.when(
              data: (bool data) => Image.network(
                '${controller.state.img}/preview',
              ),
              error: (Object error, StackTrace stackTrace) => Image.asset(
                'assets/images/${controller.state.img}',
                errorBuilder: (context, error, stackTrace) => Text(
                    "An error occured while\nloading the image!\nThere're no image in\nassets with name:\n${controller.state.img}"),
              ),
              loading: () => const SizedBox(
                width: 136,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Flexible(
                    child: Text(
                      controller.state.title,
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
                        controller.state.time,
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
      ),
    );
  }
}
