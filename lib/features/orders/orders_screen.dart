import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moobazir_user/components/order/history_order_card.dart';
import 'package:moobazir_user/components/order/order_card.dart';
import 'package:moobazir_user/components/product/product_select.dart';
import 'package:moobazir_user/features/orders/ongoing_orders_page.dart';
import 'package:moobazir_user/features/orders/order_history_page.dart';
import 'package:moobazir_user/theme/app_theme.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  int selectedFilter = 0;
  final List<String> filterItems = ['Sedang Berlangsung', 'Riwayat Pesanan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFFEF),
      body: Container(
        margin: EdgeInsets.all(32),
        padding: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pesanan Saya',
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
                      backgroundColor: Color(0xffFAFFEF),
                      side: BorderSide(width: 2, color: Color(0xffA0AF67)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.notifications_rounded,
                      color: AppTheme.primaryColor,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Segmented Control
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

            // Tampilkan page sesuai selectedFilter
            Expanded(
              child: IndexedStack(
                index: selectedFilter,
                children: const [OngoingOrdersPage(), OrderHistoryPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
