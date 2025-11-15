// providers/product_form_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class ProductFormState {
  final File? photo;
  final String name;
  final String description;
  final String category;
  final int stock;
  final int weight;

  ProductFormState({
    this.photo,
    this.name = "",
    this.description = "",
    this.category = "",
    this.stock = 0,
    this.weight = 0,
  });

  ProductFormState copyWith({
    File? photo,
    String? name,
    String? description,
    String? category,
    int? stock,
    int? weight,
  }) {
    return ProductFormState(
      photo: photo ?? this.photo,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      stock: stock ?? this.stock,
      weight: weight ?? this.weight,
    );
  }
}

class ProductFormNotifier extends Notifier<ProductFormState> {
  @override
  ProductFormState build() => ProductFormState();

  void setPhoto(File file) => state = state.copyWith(photo: file);
  void setName(String v) => state = state.copyWith(name: v);
  void setDescription(String v) => state = state.copyWith(description: v);
  void setCategory(String v) => state = state.copyWith(category: v);
  void incrementStock() => state = state.copyWith(stock: state.stock + 1);
  void decrementStock() =>
      state = state.stock > 0 ? state.copyWith(stock: state.stock - 1) : state;

  void incrementWeight() => state = state.copyWith(weight: state.weight + 1);
  void decrementWeight() =>
      state =
          state.weight > 0 ? state.copyWith(weight: state.weight - 1) : state;
}

final productFormProvider =
    NotifierProvider<ProductFormNotifier, ProductFormState>(
      ProductFormNotifier.new,
    );

class ProductPhotoPicker extends ConsumerWidget {
  const ProductPhotoPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photo = ref.watch(productFormProvider).photo;

    return GestureDetector(
      onTap: () async {
        // image_picker
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.lightGreen.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffd3e18a)),
        ),
        child: Center(
          child:
              photo == null
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, color: Color(0XFF8AA624)),
                      const SizedBox(height: 6),
                      Text(
                        "Tambahkan Foto Makanan",
                        style: TextStyle(color: Color(0XFF8AA624)),
                      ),
                    ],
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(photo.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
        ),
      ),
    );
  }
}

class ProductTextField extends StatelessWidget {
  final String hint;
  final Function(String) onChanged;

  const ProductTextField({
    super.key,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.lightGreen.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class ProductDescriptionField extends StatelessWidget {
  final String hint;
  final int max;
  final Function(String) onChanged;

  const ProductDescriptionField({
    super.key,
    required this.hint,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      maxLength: max,
      onChanged: onChanged,
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        counterText: "",
        fillColor: Colors.lightGreen.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class ProductDropdown extends StatelessWidget {
  final String hint;
  final List<String> items;
  final Function(String) onSelect;

  const ProductDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.lightGreen.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      hint: Text(hint, style: TextStyle(fontSize: 12)),
      items:
          items.map((e) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),
      onChanged: (v) => onSelect(v!),
    );
  }
}

class ProductCounter extends StatelessWidget {
  final String hint;
  final int value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const ProductCounter({
    super.key,
    required this.hint,
    required this.value,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            enabled: false,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.lightGreen.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(onPressed: onMinus, icon: const Icon(Icons.remove)),
        IconButton(onPressed: onPlus, icon: const Icon(Icons.add)),
        Text("$value"),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.lightGreen.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
