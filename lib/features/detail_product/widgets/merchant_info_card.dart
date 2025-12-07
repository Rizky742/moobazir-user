import 'package:flutter/material.dart';

class MerchantInfoCard extends StatelessWidget {
  final Map<String, dynamic> merchant;

  const MerchantInfoCard({super.key, required this.merchant});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // IMAGE
        ClipOval(
          child: Image.asset(
            merchant["imageUrl"] as String,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 14),

        // MAIN COLUMN
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NAME
              Text(
                merchant["name"] as String,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow:
                    TextOverflow.ellipsis, // agar teks panjang tidak overflow
              ),

              const SizedBox(height: 4),

              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.green),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      "${merchant["distance"] as String} • ${merchant["city"] as String}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 2),

              // ADDRESS
              Text(
                merchant["address"] as String,
                style: const TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green.shade900),
            ),
            child: Text(
              "Lihat di Peta",
              style: TextStyle(color: Colors.green.shade900, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
