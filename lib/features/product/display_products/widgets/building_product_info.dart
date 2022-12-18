import 'package:ecommerce_php/features/product/build_rating_bar.dart';
import 'package:ecommerce_php/features/product/display_products/widgets/build_name_and_price.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Expanded buildProductInfo({required Product product}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name & Price
          buildNameAndPrice(name: product.name!, price: product.price!),
          const SizedBox(height: 8),
          // Tags
          Text(
            "Tags:\n${product.tags.toString().replaceAll('[', '').replaceAll(']', '').capitalize!}",
            style: TextStyle(color: Get.theme.colorScheme.onSecondaryContainer, fontSize: 12),
          ),
          const SizedBox(height: 8),
          // Rating
          buildRatingBar(rating: product.rating!, onRatingUpdate: (updatedRating) {}),
        ],
      ),
    ),
  );
}
