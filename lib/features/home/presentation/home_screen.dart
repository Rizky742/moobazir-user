import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moobazir_user/features/home/presentation/widgets/dashboard_card.dart';
import 'package:moobazir_user/features/home/presentation/widgets/order_card.dart';

final orders = [
  {
    "title": "Nasi Campur Ayam Geprek",
    "qty": 2,
    "unit": "porsi",
    "time": "09.45",
    "status": "Menunggu",
  },
  {
    "title": "Ayam Katsu Bento",
    "qty": 1,
    "unit": "porsi",
    "time": "10.12",
    "status": "Diproses",
  },
  {
    "title": "Salad Buah",
    "qty": 3,
    "unit": "pack",
    "time": "10.30",
    "status": "Selesai",
  },
  {
    "title": "Salad Buah",
    "qty": 3,
    "unit": "pack",
    "time": "10.30",
    "status": "Selesai",
  },
];

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFFEF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Halo, Ikon AYCE",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff384700),
                        ),
                      ),
                      Text(
                        'Yuk, selamatkan makanan lagi hari ini',
                        style: TextStyle(color: Color(0xff8AA624)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/profile_picture.png'),
                  ),
                ],
              ),

              const SizedBox(height: 36),

              // GRID CARD
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.3,
                  children: const [
                    DashboardCard(
                      type: DashboardType.greenLight,
                      title: "Produk Surplus Aktif",
                      value: 8,
                      background: Color(0xffEEF4D6),
                    ),
                    DashboardCard(
                      type: DashboardType.greenDark,
                      background: Color(0xff384700),
                      title: "Pesanan Hari Ini",
                      value: 5,
                    ),
                    DashboardCard(
                      type: DashboardType.greenDark,
                      background: Color(0xff384700),
                      title: "Pesanan Hari Ini",
                      value: 5,
                    ),
                    DashboardCard(
                      type: DashboardType.greenLight,
                      title: "Produk Surplus Aktif",
                      value: 8,
                      background: Color(0xffEEF4D6),
                    ),
                  ],
                ),
              ),

              // PESANAN TERBARU
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Pesanan Terbaru",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff384700),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Lihat Semua",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8AA624),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // CARD PESANAN
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(top: 8),
                        itemCount: orders.length, // contoh, nanti bisa diganti dynamic
                        separatorBuilder: (_, __) => SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final o = orders[index];
                          return OrderCard(
                            title: o["title"] as String,
                            qty: o["qty"] as int,
                            unit: o["unit"] as String,
                            time: o["time"] as String,
                            status: o["status"] as String,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
