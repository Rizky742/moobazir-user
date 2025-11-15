import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moobazir_user/components/navigation_bar.dart';
import 'package:moobazir_user/features/home/presentation/home_screen.dart';
import 'package:moobazir_user/features/orders/orders_screen.dart';
import 'package:moobazir_user/features/products/add_product_screen.dart';
import 'package:moobazir_user/features/products/products_screen.dart';
import 'theme/app_theme.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const AnimatedNavigationBar(),
        );
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductsScreen(),
        ),
        GoRoute(
          path: '/add_product',
          builder: (context, state) => const AddProductsScreen(),
        ),
        GoRoute(
          path: '/orders',
          builder: (context, state) => const OrdersScreen(),
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
