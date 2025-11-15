import 'package:flutter/material.dart';

class CustomSegmentedControl extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final Function(int) onSelected;

  const CustomSegmentedControl({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(items.length, (index) {
        final isSelected = index == selectedIndex;

        return GestureDetector(
          onTap: () => onSelected(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF94A83D) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF94A83D), width: 1.3),
            ),
            child: Text(
              items[index],
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : const Color(0xFF94A83D),
              ),
            ),
          ),
        );
      }),
    );
  }
}
