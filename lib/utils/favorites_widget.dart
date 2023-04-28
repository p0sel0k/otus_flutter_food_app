import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/recipe/presentation/recipe_page/recipe_controller.dart';
import 'package:rive/rive.dart';

class FavoriteIconButton extends ConsumerStatefulWidget {
  final int id;

  const FavoriteIconButton({super.key, required this.id});

  @override
  ConsumerState<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends ConsumerState<FavoriteIconButton> {
  SMITrigger? like;
  SMITrigger? unlike;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), checkState);
  }

  void checkState() {
    final recipeController =
        ref.read(recipeControllerProvider(widget.id).notifier);
    final state = ref.watch(recipeControllerProvider(widget.id));
    state.whenData((value) => value.isFavorite ? like?.fire() : null);
  }

  void _toggleFavorite(RecipeController recipeController, RecipeState state) {
    if (state.isFavorite) {
      unlike?.fire();
    } else {
      like?.fire();
    }
    recipeController.changeFavoriteState(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final recipeController =
        ref.read(recipeControllerProvider(widget.id).notifier);
    final state = ref.watch(recipeControllerProvider(widget.id));
    return state.when(
      data: (data) => SizedBox(
        height: 48,
        width: 48,
        child: InkWell(
          onTap: () => _toggleFavorite(recipeController, data),
          child: Center(
            child: RiveAnimation.asset(
              'assets/animations/animheartbeat.riv',
              onInit: (artboard) {
                final controller =
                    StateMachineController.fromArtboard(artboard, 'favorite');
                artboard.addController(controller!);
                like = controller.findInput<bool>('Like') as SMITrigger;
                unlike = controller.findInput<bool>('Unlike') as SMITrigger;
              },
            ),
          ),
        ),
      ),
      error: (Object error, StackTrace stackTrace) =>
          const Text("Can't load recipe state"),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
