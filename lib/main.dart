import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moobazir_user/components/navigation_bar.dart';
import 'package:moobazir_user/features/auth/presentation/login_screen.dart';
import 'package:moobazir_user/features/auth/presentation/register_screen.dart';
import 'package:moobazir_user/features/detail_product/detail_product_screen.dart';
import 'package:moobazir_user/features/home/presentation/home_screen.dart';
import 'package:moobazir_user/features/onboarding/presentation/onboarding_screen.dart';
import 'package:moobazir_user/features/orders/orders_screen.dart';
import 'package:moobazir_user/features/products/add_product_screen.dart';
import 'package:moobazir_user/features/profile/presentation/profile_screen.dart';
import 'package:moobazir_user/features/splash/presentation/splash_screen.dart';
import 'theme/app_theme.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return ProductDetailPage(id: id!);
      },
    ),

    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const AnimatedNavigationBar(),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/orders',
          name: 'orders',
          builder: (context, state) => const OrdersScreen(),
        ),
        GoRoute(
          path: '/contributions',
          name: 'contributions',
          builder: (context, state) => const AddProductsScreen(),
        ),

        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const ProviderScope(child: MoobazirSellerApp()));
}

class MoobazirSellerApp extends StatelessWidget {
  const MoobazirSellerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Moobazir Seller',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
