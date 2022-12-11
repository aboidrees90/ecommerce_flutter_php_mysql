import 'package:ecommerce_php/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsController controller = Get.put(ProductsController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: controller.searchTerm,
        decoration: InputDecoration(
          prefixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.purpleAccent)),
          hintText: "Search ...",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart, color: Colors.purpleAccent)),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.purpleAccent)),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.purpleAccent)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }
}
