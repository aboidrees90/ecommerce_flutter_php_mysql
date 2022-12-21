import 'package:ecommerce_php/controller/products_controller.dart';
import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/features/product/display_products/search_screen.dart';
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
        onTap: () => showSearch(
          context: context,
          delegate: SearchScreen(),
        ),
        style: const TextStyle(color: Colors.white),
        controller: _products.searchTerm,
        decoration: InputDecoration(
          prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Get.theme.colorScheme.primary)),
          hintText: "Search ...",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          suffixIcon: IconButton(onPressed: () => Get.toNamed(AppRoutes.cart), icon: Icon(Icons.shopping_cart, color: Get.theme.colorScheme.primary)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 2, color: Get.theme.colorScheme.primary.withAlpha(100)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 2, color: Get.theme.colorScheme.primary),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }
}
