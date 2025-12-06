import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moobazir_user/theme/app_theme.dart';
import '../main.dart';

class AnimatedNavigationBar extends ConsumerWidget {
  const AnimatedNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _animatedNavItem(
            context,
            ref,
            icon: Icons.home_filled,
            index: 0,
            route: '/',
            label: 'Home',
          ),
          _animatedNavItem(
            context,
            ref,
            icon: Icons.list_alt_rounded,
            index: 1,
            route: '/orders',
            label: 'Pesanan',
          ),
          _animatedNavItem(
            context,
            ref,
            icon: Icons.bar_chart,
            index: 2,
            route: '/contributions',
            label: 'Kontribusi',
          ),
          _animatedNavItem(
            context,
            ref,
            icon: Icons.person_outline,
            index: 3,
            route: '/profile',
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _animatedNavItem(
    BuildContext context,
    WidgetRef ref, {
    required IconData icon,
    required int index,
    required String route,
    required String label,
  }) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        ref.read(selectedIndexProvider.notifier).state = index;
        context.go(route);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(4),
            child: Icon(
              icon,
              color: isSelected ? AppTheme.primaryColor : Colors.grey,
              size: 28,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppTheme.primaryColor : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _middleNavItem(
    BuildContext context,
    WidgetRef ref, {
    required String imagePath,
    required int index,
    required String route,
  }) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        ref.read(selectedIndexProvider.notifier).state = index;
        context.go(route);
      },
      child: Transform.translate(
        offset: const Offset(0, -30),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryColor : Colors.orange,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: const AlwaysStoppedAnimation(45 / 360),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                imagePath,
                width: 20,
                height: 20,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 1.2, 0);
    path.lineTo(size.width, size.height / 1.2);
    path.lineTo(size.width / 1.2, size.height);
    path.lineTo(0, size.height / 1.2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
