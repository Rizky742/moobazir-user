import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moobazir_user/components/product/product_form.dart';
import 'package:moobazir_user/theme/app_theme.dart';

class AddProductsScreen extends ConsumerStatefulWidget {
  const AddProductsScreen({super.key});

  @override
  ConsumerState<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends ConsumerState<AddProductsScreen> {
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
                SizedBox(
                  height: 36,
                  width: 36,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/products');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: AppTheme.onPrimaryColor,
                      size: 24,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Tambah Produk Surplus',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppTheme.onSurfaceColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Yuk, bagikan makanan berlebihmu",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 24),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Foto Produk",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const ProductPhotoPicker(),
                    const SizedBox(height: 20),

                    // NAMA PRODUK
                    const Text(
                      "Nama Produk",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ProductTextField(
                      hint: "Masukkan nama makanan",
                      onChanged:
                          (v) =>
                              ref.read(productFormProvider.notifier).setName(v),
                    ),
                    const SizedBox(height: 20),

                    // DESKRIPSI
                    const Text(
                      "Deskripsi Produk",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ProductDescriptionField(
                      hint: "Tuliskan deskripsi singkat",
                      max: 200,
                      onChanged:
                          (v) => ref
                              .read(productFormProvider.notifier)
                              .setDescription(v),
                    ),
                    const SizedBox(height: 20),

                    // KATEGORI
                    const Text(
                      "Kategori Produk",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ProductDropdown(
                      hint: "Pilih kategori",
                      items: [
                        "Roti & Pastry",
                        "Makanan Berat",
                        "Minuman",
                        "Cemilan",
                      ],
                      onSelect:
                          (v) => ref
                              .read(productFormProvider.notifier)
                              .setCategory(v),
                    ),
                    const SizedBox(height: 20),

                    // STOCK
                    const Text(
                      "Jumlah Stok",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Consumer(
                      builder: (context, ref, _) {
                        final state = ref.watch(productFormProvider);
                        return ProductCounter(
                          hint: "Porsi tersedia",
                          value: state.stock,
                          onMinus:
                              () =>
                                  ref
                                      .read(productFormProvider.notifier)
                                      .decrementStock(),
                          onPlus:
                              () =>
                                  ref
                                      .read(productFormProvider.notifier)
                                      .incrementStock(),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Estimasi Berat",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Consumer(
                      builder: (context, ref, _) {
                        final state = ref.watch(productFormProvider);
                        return ProductCounter(
                          hint: "(gram)",
                          value: state.weight,
                          onMinus:
                              () =>
                                  ref
                                      .read(productFormProvider.notifier)
                                      .decrementWeight(),
                          onPlus:
                              () =>
                                  ref
                                      .read(productFormProvider.notifier)
                                      .incrementWeight(),
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    PrimaryButton(
                      text: "Selanjutnya",
                      onTap: () {
                        final form = ref.read(productFormProvider);

                        if (form.name.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Nama produk harus diisi"),
                            ),
                          );
                          return;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
