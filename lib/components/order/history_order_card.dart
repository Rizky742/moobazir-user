import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moobazir_user/theme/app_theme.dart';

class HistoryOrderCard extends ConsumerWidget {
  final String productName;
  final int price;
  final String image;
  final String shopName;
  final String time;
  final String status;
  final VoidCallback onDetailTap;
  final VoidCallback? onStatusTap;

  const HistoryOrderCard({
    super.key,
    required this.productName,
    required this.price,
    required this.image,
    required this.shopName,
    required this.time,
    required this.status,
    required this.onDetailTap,
    this.onStatusTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color getStatusColor(String status) {
      switch (status) {
        case "Selesai":
          return Color(0xff646464); // coklat gelap
        default:
          return Color(0xffEA0000);
      }
    }

    String formatPrice(int price) {
      final formatter = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR ',
        decimalDigits: 0,
      );
      return formatter.format(price);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xffFAFFEF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              // "assets/images/nasi_ayam.png",
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff181E00),
                  ),
                ),
                Text(
                  shopName,
                  style: TextStyle(fontSize: 12, color: Color(0xff384700)),
                ),
                const Text(
                  "23/11/2025 • 19:45",
                  style: TextStyle(fontSize: 10, color: Colors.black54),
                ),
                Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(status).withOpacity(0.24),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: getStatusColor(status),
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color(0xfff4a261),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
              Text(
                formatPrice(price),
                style: TextStyle(
                  color: Color(0xff283618),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
