import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends ConsumerWidget {
  final String title;
  final String? imageUrl;
  final int price;
  final int? originalPrice;
  final int stock;
  final String deadline;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    this.originalPrice,
    required this.stock,
    required this.deadline,
    required this.onEdit,
    required this.onDelete,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FCEB),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      imageUrl ??
                          "https://ehs.stanford.edu/wp-content/uploads/missing-image.png",
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(height: 12),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF5D6),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "Aktif",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7A9A32),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3A3A3A),
                      ),
                    ),

                    SizedBox(height: 2),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "IDR $price",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF556B2F),
                          ),
                        ),
                        if (originalPrice != null) ...[
                          SizedBox(width: 8),
                          Text(
                            "IDR $originalPrice",
                            style: TextStyle(
                              fontSize: 12,
                              color: const Color(0xFF8BA266),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Edit & Delete
                  Row(
                    children: [
                      _roundIconButton(
                        icon: Icons.edit,
                        background: Colors.white,
                        iconColor: Colors.grey[700]!,
                        onTap: onEdit,
                        size: 28,
                        iconSize: 16,
                      ),
                      SizedBox(width: 10),
                      _roundIconButton(
                        icon: Icons.delete,
                        background: const Color(0xFFE84C3D),
                        iconColor: Colors.white,
                        onTap: onDelete,
                        size: 28,
                        iconSize: 16,
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Sisa: $stock pcs",
                        style: TextStyle(
                          fontSize: 11,
                          color: const Color(0xFF556B2F),
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        "Deadline: $deadline WIB",
                        style: TextStyle(
                          fontSize: 11,
                          color: const Color(0xFF556B2F),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _roundIconButton({
    required IconData icon,
    required Color background,
    required Color iconColor,
    required VoidCallback onTap,
    required double size,
    required double iconSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: background),
        child: Icon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}
