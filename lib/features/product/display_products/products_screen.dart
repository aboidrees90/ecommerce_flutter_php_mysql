import 'package:ecommerce_php/features/product/display_products/widgets/products.dart';
import 'package:ecommerce_php/features/product/display_products/widgets/search_bar.dart';
import 'package:ecommerce_php/features/product/display_products/widgets/trending_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Search
          SearchBar(),

          // trending-popular items
          buildHeading(title: "Trending"),
          TrendingProduct(),
          // all Collections/items
          buildHeading(title: "New Collections"),
          Products(),
        ],
      ),
    );
  }

  buildHeading({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(title, style: TextStyle(color: Get.theme.colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 20)),
        )
      ],
    );
  }
}
