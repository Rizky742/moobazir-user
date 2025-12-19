import 'package:flutter/material.dart';
import 'package:moobazir_user/components/order/order_card.dart';

class OngoingOrdersPage extends StatelessWidget {
  const OngoingOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        OrderCard(
          productName: "Chicken Bento",
          quantity: 1,
          unit: "pack",
          shopName: "Oishii Kitchen",
          time: "19:45 WIB",
          status: "Siap Diambil",
          onDetailTap: () {
            
          },
          onStatusTap: null,
        ),
        OrderCard(
          productName: "Croissant Coklat",
          quantity: 4,
          unit: "pcs",
          shopName: "Morning Bakery",
          time: "20:30 WIB",
          status: "Menunggu",
          onDetailTap: () {
            
          },
          onStatusTap: null,
        ),
        OrderCard(
          productName: "Fruit Mix Cup",
          quantity: 1,
          unit: "pack",
          shopName: "Fresh & Go",
          time: "18:00 WIB",
          status: "Menunggu",
          onDetailTap: () {
            
          },
          onStatusTap: null,
        ),
      ],
    );
  }
}
