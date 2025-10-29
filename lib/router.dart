import 'package:go_router/go_router.dart';
import 'package:moobazir_user/features/auth/presentation/login_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    // GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
