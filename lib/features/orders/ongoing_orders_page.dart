import 'package:flutter/material.dart';
import 'package:moobazir_user/components/order/order_card.dart';

class OngoingOrdersPage extends StatelessWidget {
  const OngoingOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        OrderCard(
          productName: "Croissant Coklat",
          quantity: 2,
          unit: "packs",
          price: 16000,
          shopName: "Oishii Kitchen",
          time: "09.45 WIB",
          status: "Menunggu",
          onDetailTap: () {
            
          },
          onStatusTap: null,
        ),
        OrderCard(
          productName: "Croissant Coklat",
          quantity: 2,
          unit: "packs",
          price: 16000,
          shopName: "Oishii Kitchen",
          time: "09.45 WIB",
          status: "Menunggu",
          onDetailTap: () {
            
          },
          onStatusTap: null,
        ),
        OrderCard(
          productName: "Croissant Coklat",
          quantity: 2,
          unit: "packs",
          price: 16000,
          shopName: "Oishii Kitchen",
          time: "09.45 WIB",
          status: "Menunggu",
          onDetailTap: () {
            
          },
          onStatusTap: null,
        ),
      ],
    );
  }
}
