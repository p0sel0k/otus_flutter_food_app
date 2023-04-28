import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/auth/presentation/auth_controller.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authControllerProvider.notifier);

    return Scaffold(
        body: Center(
      child: Column(children: [
        TextField(
          controller: usernameController,
        ),
        TextField(
          controller: passwordController,
        ),
        TextButton(
          child: const Text('Log In'),
          onPressed: () {
            authController.login({
              'username': usernameController.text,
              'password': passwordController.text
            });
            usernameController.clear();
            passwordController.clear();
          },
        ),
      ]),
    ));
  }
}
