import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF3B4500),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Selamat datang di Halaman Home!',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF3B4500),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
