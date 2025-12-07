import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moobazir_user/data/product_data.dart';
import 'package:moobazir_user/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7E9),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            left: 26,
            right: 26,
            top: 40,
            bottom: 30,
          ),
          children: [
            _LocationAndSearch(),

            SizedBox(height: 16),
            _CategoryFilter(),

            SizedBox(height: 20),
            _NearestButton(),

            SizedBox(height: 24),
            Text(
              "Makanan Surplus Terdekat",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 16),
            _ProductGrid(),
          ],
        ),
      ),
    );
  }
}

class _LocationAndSearch extends StatelessWidget {
  const _LocationAndSearch();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Location
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Color(0xff4A5D23)),
                SizedBox(width: 6),
                Text(
                  "Surabaya, Indonesia",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4A5D23),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff4A5D23),
                      width: 1.6,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.trolley,
                      size: 20,
                      color: Color(0xff4A5D23),
                    ),
                  ),
                ),

                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff4A5D23),
                      width: 1.6,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      size: 20,
                      color: Color(0xff4A5D23),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Search Bar
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffEEF3D4),
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: AppTheme.primaryColor),
              hintText: "Cari produk surplus",
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              labelStyle: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoryFilter extends StatefulWidget {
  const _CategoryFilter();

  @override
  State<_CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<_CategoryFilter> {
  int activeIndex = 0;

  final List<String> categories = [
    "Terdekat",
    "Kue",
    "Restoran",
    "Kafe",
    "Siap Saji",
    "Roti",
    "Minuman",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: _FilterButton(
                categories[index],
                isActive: activeIndex == index,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String title;
  final bool isActive;
  const _FilterButton(this.title, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primaryColor : Colors.white,
        border: Border.all(color: AppTheme.primaryColor),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : AppTheme.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _NearestButton extends StatelessWidget {
  const _NearestButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xff4A5D23),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.location_on, color: Colors.white, size: 20),
          SizedBox(width: 10),
          Text(
            "Lihat Produk Surplus Terdekat Melalui Peta",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductGrid extends StatelessWidget {
  const _ProductGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dummyProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        final p = dummyProducts[index];
        return ProductCard(
          title: p["title"],
          store: p["store"],
          distance: p["distance"],
          price: p["price"],
          oldPrice: p["oldPrice"],
          pcs: p["pcs"],
          discount: p["discount"],
          time: p["time"],
          image: p["image"],
          onTap: () => GoRouter.of(context).go('/product/${p["id"]}'),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title, store, distance, pcs, discount, time, image;
  final int price, oldPrice;

  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.store,
    required this.distance,
    required this.price,
    required this.oldPrice,
    required this.pcs,
    required this.discount,
    required this.time,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),

                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      discount,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "Ambil sebelum $time",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        pcs,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),

                  Text(
                    store,
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Text(
                    distance,
                    style: const TextStyle(color: Colors.black45, fontSize: 11),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "IDR $oldPrice",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "IDR $price",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4A5D23),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
