import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moobazir_user/components/order/order_card.dart';
import 'package:moobazir_user/components/product/product_select.dart';
import 'package:moobazir_user/theme/app_theme.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  final TextEditingController _searchController = TextEditingController();

  int selectedFilter = 0;
  final List<String> filterItems = [
    'Semua',
    'Menunggu',
    'Siap Diambil',
    'Selesai',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(32),
        padding: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pesanan masuk',
                      style: TextStyle(
                        fontSize: 22,
                        color: AppTheme.onSurfaceColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Perbarui status pesanan",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/scan_order');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.qr_code,
                      color: AppTheme.onPrimaryColor,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomSegmentedControl(
                items: filterItems,
                selectedIndex: selectedFilter,
                onSelected: (index) {
                  setState(() {
                    selectedFilter = index;
                  });
                },
              ),
            ),

            SizedBox(height: 24),

            OrderCard(
              productName: "Croissant Coklat",
              quantity: 2,
              price: 16000,
              customerName: "Dewi Ramadhani",
              time: "09.45 WIB",
              status: "Menunggu",
              onDetailTap: () {
                context.go('/order/detail');
              },
              onStatusTap: () {
                // buka bottom sheet ubah status
              },
            ),
          ],
        ),
      ),
    );
  }
}
