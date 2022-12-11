import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/ui/user/products/build_name_and_price.dart';
import 'package:ecommerce_php/ui/user/products/build_rating_bar.dart';
import 'package:flutter/material.dart';

Expanded buildProductInfo({required Product product}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name & Price
          buildNameAndPrice(name: product.name!, price: double.tryParse(product.price!) ?? 00.00),
          const SizedBox(height: 8),
          // Tags
          Text(
            "Tags:\n${product.tags.toString().replaceAll(']', "").replaceAll('[', '')}",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 8),
          // Rating
          buildRatingBar(rating: double.tryParse(product.rating!) ?? 0.0, onRatingUpdate: (updatedRating) {}),
        ],
      ),
    ),
  );
}
