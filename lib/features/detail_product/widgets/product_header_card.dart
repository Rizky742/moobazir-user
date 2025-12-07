import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductHeaderCard extends StatelessWidget {
  final String imageUrl;

  const ProductHeaderCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 330,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          top: 50,
          left: 20,
          child: GestureDetector(
            onTap: () {
              if (GoRouter.of(context).canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),

        Positioned(
          top: 50,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "60% OFF",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const Positioned(
          bottom: 20,
          right: 20,
          child: Text(
            "Ready to Pick Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(offset: Offset(0, 0), blurRadius: 6)],
            ),
          ),
        ),
      ],
    );
  }
}
