import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConfirmOrderSheet extends StatelessWidget {
  final Map<String, dynamic> merchant;
  final Map<String, dynamic> product;

  const ConfirmOrderSheet({
    super.key,
    required this.merchant,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            // ======== SCROLL CONTENT ========
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF5F5E9),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: _buildContent(context),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(color: const Color(0xffF5F5E9)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Text(
                        "Batalkan",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xff4A5D23),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Text(
                        "Konfirmasi Pesanan",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    final formatter = NumberFormat("#,###", "id_ID");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Konfirmasi Pesanan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Nama + PCS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product["title"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(product["pcs"], style: const TextStyle(fontSize: 16)),
          ],
        ),

        const SizedBox(height: 16),

        // Lokasi
        const Text("Lokasi:"),
        Text(
          merchant['address'],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 16),

        // Harga & Waktu Ambil
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Harga:"),
                Text(
                  "IDR ${formatter.format(product["price"])}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text("Ambil sebelum:"),
                Text(
                  product["time"],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xffFEECDC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xffF29B7F)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.error_outline, color: Color(0xffD9534F)),
                  SizedBox(width: 8),
                  Text(
                    "Tidak perlu pembayaran online",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD9534F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                "Tunjukkan kode QR Anda saat mengambil pesanan",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Color(0xffD9534F)),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
