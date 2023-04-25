import 'package:hw2/features/auth/application/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  void login(Map<String, String> user) async {
    state = const AsyncValue.loading();
    final isLoggedIn = await ref.read(authServiceProvider).login(user);
    state = AsyncValue.data(isLoggedIn);
  }

  void logout() {
    state = const AsyncValue.data(false);
  }
}
