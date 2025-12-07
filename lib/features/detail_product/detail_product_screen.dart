import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moobazir_user/data/merchant_data.dart';
import 'package:moobazir_user/data/product_data.dart';
import 'package:moobazir_user/features/detail_product/widgets/confirm_order_sheet.dart';
import 'package:moobazir_user/features/detail_product/widgets/merchant_info_card.dart';
import 'package:moobazir_user/features/detail_product/widgets/product_header_card.dart';
import 'package:moobazir_user/theme/app_theme.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;
  ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final product = products.firstWhere((p) => p["id"] == id);
    final formatter = NumberFormat("#,###", "id_ID");

    return Scaffold(
      backgroundColor: const Color(0xffF6F7E9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER IMAGE
                  ProductHeaderCard(imageUrl: product["image"] as String),

                  /// CONTENT
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product["title"] as String,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Available:",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Text(
                                  "${product["available"]} packs left",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Text(
                          product["description"] as String,
                          style: TextStyle(fontSize: 14, height: 1.4),
                        ),

                        const SizedBox(height: 24),

                        MerchantInfoCard(
                          merchant: merchants.firstWhere(
                            (m) => m["id"] == product["merchantId"],
                          ),
                        ),

                        const SizedBox(height: 24),

                        /// PICKUP WARNING
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 22,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.redAccent),
                            color: Colors.red.withOpacity(0.20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Ambil sebelum pukul ${product["time"]}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Harap diambil sebelum batas waktu untuk memastikan kesegaran makanan",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 26),
        decoration: BoxDecoration(
          color: Colors.white38,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Total Harga", style: TextStyle(fontSize: 16)),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Discount -60% ",
                        style: TextStyle(color: AppTheme.primaryColor),
                      ),
                      TextSpan(
                        text: "(IDR ${product["oldPrice"]})",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Text(
              "IDR ${formatter.format(product["price"])}",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder:
                      (_) => ConfirmOrderSheet(
                        merchant: merchants.firstWhere(
                          (m) => m["id"] == product["merchantId"],
                        ),
                        product: product,
                      ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Color(0xff4A5D23),
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Buat Pesanan",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
