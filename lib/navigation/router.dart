import 'package:go_router/go_router.dart';
import 'package:hw2/features/auth/presentation/auth_page.dart';
import 'package:hw2/features/recipe/presentation/recipe_page/recipe_page.dart';
import 'package:hw2/features/recipe/presentation/recipes_list_page/recipes_list_page.dart';
import 'package:hw2/utils/camera_widget.dart';

bool isLoggedIn = true;

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => const RecipesListPage(),
      redirect: (context, state) {
        //TODO: заменить на использование значения из authController
        if (!isLoggedIn) {
          return '/auth';
        }
        return '/';
      }),
  GoRoute(
    path: '/auth',
    builder: (context, state) => const AuthPage(),
  ),
  GoRoute(
    path: '/recipe/:id',
    builder: (context, state) =>
        RecipePage(id: int.parse(state.params["id"] ?? '0')),
  ),
  GoRoute(
      path: '/recipe/:id/camera',
      builder: (context, state) => CameraWidget(
            id: int.parse(state.params["id"] ?? '0'),
          ))
]);
