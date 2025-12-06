import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moobazir_user/components/product/product_card.dart';
import 'package:moobazir_user/components/product/product_select.dart';
import 'package:moobazir_user/theme/app_theme.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();

  int selectedFilter = 0;
  final List<String> filterItems = [
    'Semua',
    'Aktif',
    'Habis',
    'Segera Kadaluarsa',
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
                      'Kelola Surplus',
                      style: TextStyle(
                        fontSize: 22,
                        color: AppTheme.onSurfaceColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Pantau dan tambah stok olahan",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/add_product');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppTheme.onPrimaryColor,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            TextField(
              controller: _searchController,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppTheme.onSurfaceColor,
              ),
              decoration: InputDecoration(
                hintText: 'Cari produk surplus',
                hintStyle: TextStyle(
                  color: AppTheme.subtitleColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(Icons.search, color: AppTheme.primaryColor),
                prefixStyle: TextStyle(
                  color: AppTheme.primaryColor,
                  height: 18,
                ),
                filled: true,
                fillColor: Colors.lightGreen.withOpacity(0.1),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppTheme.primaryColor,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),

            SizedBox(height: 16),
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

            ProductCard(
              title: "Croissant Coklat",
              price: 8000,
              originalPrice: 15000,
              stock: 5,
              deadline: "20.30",
              imageUrl: null, // akan pakai default
              onEdit: () {},
              onDelete: () {},
            ),
          ],
        ),
      ),
    );
  }
}
