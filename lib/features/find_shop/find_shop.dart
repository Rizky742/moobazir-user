import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:moobazir_user/components/find_shop/shop_modal.dart';
import 'package:moobazir_user/features/find_shop/menu.dart';
import 'package:moobazir_user/features/find_shop/shop.dart';

class FindShop extends StatefulWidget {
  FindShop({super.key});

  static final LatLng myLocation = LatLng(-7.2721, 112.7953);

  @override
  State<FindShop> createState() => _FindShopState();
}

class _FindShopState extends State<FindShop> {
  final TextEditingController searchController = TextEditingController();

  static final List<Shop> shops = [
    Shop(
      distanceInKm: 1.2,
      name: 'Morning Bakery',
      address: 'Jl. Ahmad Yani No. 25, Surabaya',
      description: 'Menyediakan sembako, minuman, dan kebutuhan harian.',
      // phone: '081234567890',
      city: 'Surabaya',
      menuItem: [
        MenuItem(name: 'Roti Tawar', qty: '1 Bungkus', price: 15000),
        MenuItem(name: 'Susu UHT', qty: '1 Liter', price: 20000),
        MenuItem(name: 'Telur Ayam', qty: '1 Kg', price: 25000),
      ],
      closeHour: '20:30',
      location: LatLng(-7.2708, 112.7939),
    ),
    Shop(
      distanceInKm: 2.4,
      name: 'Oishii Kitchen',
      address: 'Jl. Diponegoro No. 10, Surabaya',
      description: 'Menjual sayur segar dan buah setiap hari.',
      menuItem: [
        MenuItem(name: 'Bayam', qty: '1 Ikat', price: 8000),
        MenuItem(name: 'Apel Fuji', qty: '1 Kg', price: 30000),
        MenuItem(name: 'Wortel', qty: '1 Kg', price: 12000),
      ],
      city: 'Surabaya',
      // phone: '081298765432',
      closeHour: '20:30',
      location: LatLng(-7.2715, 112.7970),
    ),
  ];

  late List<Shop> filteredShops;
  @override
  void initState() {
    super.initState();
    filteredShops = shops;
  }

  void onSearch(String query) {
    setState(() {
      filteredShops =
          shops
              .where(
                (shop) => shop.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Peta Toko')),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: FindShop.myLocation,
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                subdomains: ['a', 'b', 'c', 'd'],
              ),

              CircleLayer(
                circles: [
                  CircleMarker(
                    point: FindShop.myLocation,
                    radius: 100, // meter
                    color: Colors.green.withOpacity(0.25),
                    borderColor: Colors.green,
                    borderStrokeWidth: 2,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: FindShop.myLocation,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                  ...shops.map(
                    (shop) => Marker(
                      point: shop.location,
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () => _showShopModal(context, shop),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.store, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 16,
            right: 16,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(12),
                    child: TextField(
                      controller: searchController,
                      onChanged: onSearch,
                      decoration: InputDecoration(
                        hintText: 'Cari toko terdekat...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon:
                            searchController.text.isNotEmpty
                                ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    searchController.clear();
                                    onSearch('');
                                  },
                                )
                                : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /* =========================
     MODAL TOKO (2 STATE)
  ========================= */
  void _showShopModal(BuildContext context, Shop shop) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ShopModal(shop: shop);
      },
    );
  }
}
