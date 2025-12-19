import 'package:flutter/material.dart';
import 'package:moobazir_user/features/find_shop/shop.dart';

class ShopModal extends StatefulWidget {
  final Shop shop;

  const ShopModal({super.key, required this.shop});

  @override
  State<ShopModal> createState() => _ShopModalState();
}

class _ShopModalState extends State<ShopModal> {
  bool showDetail = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/merchant/morning-bakery.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.shop.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff384700),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Color(0xff384700),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.shop.distanceInKm} km',
                          style: TextStyle(
                            color: Color(0xff384700),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          ' • ',
                          style: TextStyle(color: Color(0xff384700)),
                        ),
                        Text(
                          widget.shop.city,
                          style: TextStyle(
                            color: Color(0xff384700),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Ambil Sebelum: "),
                    Text(
                      widget.shop.closeHour,
                      style: TextStyle(
                        color: Color(0xff384700),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Text(
                    //   widget.shop.address,
                    //   style: TextStyle(color: Colors.grey[600]),
                    // ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            if (!showDetail) ...[
              // ================= RINGKAS =================
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff384700),
                  ),
                  onPressed: () {
                    setState(() => showDetail = true);
                  },
                  child: const Text('Lihat Detail Toko'),
                ),
              ),
            ] else ...[
              SizedBox(height: 20),
              Text(
                "Surplus Tersedia Hari Ini",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff384700),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                spacing: 8,
                children:
                    widget.shop.menuItem.map((menu) {
                      return Row(
                        children: [
                          Text('${menu.name} (${menu.qty})'),
                          Spacer(),
                          Text('Rp ${menu.price}'),
                        ],
                      );
                    }).toList(),
              ),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Lokasi Ambil", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff384700),
                  ),),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        border: Border.all(color: Color(0xff384700), width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Text(
                        "Buka Di Google Maps",
                        style: TextStyle(color: Color(0xff384700), fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Text(widget.shop.address,),
              // ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() => showDetail = false);
                  },
                  child: const Text('Tutup Detail'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _detailItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
