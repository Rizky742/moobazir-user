import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moobazir_user/components/navigation_bar.dart';
import 'package:moobazir_user/features/home/presentation/home_screen.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  final List<Widget> pages = const [HomeScreen()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: const AnimatedNavigationBar(),
    );
  }
}
