import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moobazir_user/theme/app_theme.dart';

class OrderCard extends ConsumerWidget {
  final String productName;
  final int quantity;
  final String unit;
  // final int price;
  final String shopName;
  final String time;
  final String status;
  final VoidCallback onDetailTap;
  final VoidCallback? onStatusTap;

  const OrderCard({
    super.key,
    required this.productName,
    required this.quantity,
    // required this.price,
    required this.unit,
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
    case "Siap Diambil":
      return Color(0xff00A500); // hijau
    case "Menunggu":
      return Color(0xffFEA405); // oranye
    case "Selesai":
      return Color(0xff1D2500); // coklat gelap
    default:
      return Colors.grey;
  }
}

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffFAFFEF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D2500).withOpacity(0.24),
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ROW ATAS: Nama produk + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // QTY & Product Name
              Row(
                children: [
                  Text(
                    "x$quantity  ",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    unit,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              // Status Button
              GestureDetector(
                onTap: onStatusTap,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xffFEA405),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.qr_code,
                      color: AppTheme.onPrimaryColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // PRICE
          Text(
            productName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppTheme.onSurfaceColor,
            ),
          ),
          // Text(
          //   "IDR ${price.toString().replaceAll('.', ',')}",
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.w800,
          //     color: AppTheme.onSurfaceColor,
          //   ),
          // ),

          // const SizedBox(height: 16),

          Text(
            shopName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.onSurfaceColor,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onDetailTap,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: getStatusColor(status).withOpacity(0.24) 
                  ),
                  child:  Text(
                    status,
                    style: TextStyle(fontSize: 12, color: getStatusColor(status)),
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Ambil Sebelum:", style: TextStyle(fontSize: 12)),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
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
  }
}
