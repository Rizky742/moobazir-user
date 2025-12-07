import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrSection extends StatelessWidget {
  final String orderId;
  final String printedDate;

  const QrSection({
    super.key,
    required this.orderId,
    required this.printedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xffFAFBEF),
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: QrImageView(
              data: orderId,
              size: 260,
              version: QrVersions.auto,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "#$orderId",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff4B5A2A),
            ),
          ),

          const SizedBox(height: 2),

          Text(
            "Dicetak: $printedDate",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
