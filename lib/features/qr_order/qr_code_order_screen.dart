import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moobazir_user/data/merchant_data.dart';
import 'package:moobazir_user/data/order_data.dart';
import 'package:moobazir_user/data/product_data.dart';
import 'package:moobazir_user/features/qr_order/widgets/oder_information_sheet.dart';
import 'package:moobazir_user/features/qr_order/widgets/qr_header.dart';
import 'package:moobazir_user/features/qr_order/widgets/qr_section.dart';

class QrCodeOrderScreen extends StatelessWidget {
  final String id;

  const QrCodeOrderScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final order = orders.firstWhere((o) => o["id"] == id);

    final product = products.firstWhere(
      (p) => p["id"] == order["productId"],
      orElse: () => {},
    );

    final merchant = merchants.firstWhere(
      (m) => m["id"] == order["merchantId"],
      orElse: () => {},
    );

    final printedDate = DateFormat(
      "d MMMM yyyy HH:mm:ss",
      "id_ID",
    ).format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xffF6F7E9),
      body: SafeArea(
        child: SingleChildScrollView(
          // <-- gunakan scroll
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrHeader(),
              SizedBox(height: 12),

              QrSection(orderId: id, printedDate: printedDate),

              SizedBox(height: 20),
              Container(
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.black12,
              ),

              SizedBox(
                height: 50,
              ), // tambahan ruang agar tidak nempel ke bottom bar
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
              child: Row(
                children: [
                  Text(
                    "Detail Pesanan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4B5A2A),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.expand_more, color: Color(0xff4B5A2A)),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder:
                            (_) => OderInformationSheet(
                              merchant: merchant,
                              product: product,
                              order: order,
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4A5D23),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    "Lihat Semua Pesanan",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
