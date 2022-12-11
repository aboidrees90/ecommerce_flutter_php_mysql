import 'package:ecommerce_php/ui/user/products/products.dart';
import 'package:ecommerce_php/ui/user/products/search_bar.dart';
import 'package:ecommerce_php/ui/user/products/trending_products.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Search
          const SearchBar(),

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
          child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
        )
      ],
    );
  }
}
