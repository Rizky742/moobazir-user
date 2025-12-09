import 'package:flutter/material.dart';
import 'package:moobazir_user/components/order/history_order_card.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> historyOrders = [
      {
        "productName": "Nasi Ayam Teriyaki",
        "image": "assets/images/nasi_ayam.png",
        "price": 12000,
        "shopName": "Kantin Finna",
        "time": "08.30 WIB",
        "status": "Selesai",
      },
      {
        "productName": "Cupcake Vanilla",
        "image": "assets/images/cup_cake_vanilla.png",
        "price": 6000,
        "shopName": "Oyahoo Bakery",
        "time": "19.45 WIB",
        "status": "Selesai",
      },
      {
        "productName": "Ayam Pop Sawahan",
        "image": "assets/images/ayam_pop_sawahan.png",
        "price": 7000,
        "shopName": "Payakumbuah",
        "time": "10.20 WIB",
        "status": "Batal",
      },
      {
        "productName": "Mie Ayam Bakso",
        "image": "assets/images/mie_ayam_bakso.png",
        "price": 15000,
        "shopName": "Mie Langgeng",
        "time": "10.20 WIB",
        "status": "Selesai",
      },
    ];

    return ListView.separated(
      itemCount: historyOrders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = historyOrders[index];

        return HistoryOrderCard(
          productName: item["productName"],
          image: item["image"],
          price: item["price"],
          shopName: item["shopName"],
          time: item["time"],
          status: item["status"],
          onDetailTap: () {},
          onStatusTap: null,
        );
      },
    );
  }
}
