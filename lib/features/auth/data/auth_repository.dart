import 'package:hw2/features/auth/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final List<User> users = [
    const User(username: 'anton', password: '1'),
    const User(username: 'otus', password: 'otus'),
  ];

  Future<bool> login(User user) async {
    return users.contains(user);
  }

  Future<void> signup(User newUser) async {
    users.add(newUser);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}
