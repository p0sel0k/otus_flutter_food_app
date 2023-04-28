import 'package:hw2/features/auth/data/auth_repository.dart';
import 'package:hw2/features/auth/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  final AuthRepository authRepository;

  AuthService({required this.authRepository});

  Future<bool> login(Map<String, String> user) async {
    if (!_loginGuard(user['username'])) {
      throw 'Incorrect username';
    }
    return authRepository.login(User.fromJson(user));
  }

  Future<void> signup(Map<String, String> newUser) async {
    if (!_loginGuard(newUser['username'])) {
      throw 'Incorrect username';
    }
    authRepository.login(User.fromJson(newUser));
  }

  bool _loginGuard(String? username) {
    if (username == null) {
      throw "There are no usernmae. Please Try again!";
    }
    return true;
  }
}

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService(authRepository: ref.read(authRepositoryProvider));
}
