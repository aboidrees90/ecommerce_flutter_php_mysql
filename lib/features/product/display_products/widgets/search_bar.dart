import 'package:ecommerce_php/controller/products_controller.dart';
import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  final ProductsController _products = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _products.searchTerm,
        decoration: InputDecoration(
          prefixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.purpleAccent)),
          hintText: "Search ...",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          suffixIcon: IconButton(onPressed: () => Get.toNamed(AppRoutes.cart), icon: const Icon(Icons.shopping_cart, color: Colors.purpleAccent)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(width: 2, color: Colors.white24)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(width: 2, color: Colors.purpleAccent)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }
}
