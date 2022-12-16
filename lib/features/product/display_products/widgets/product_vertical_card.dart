import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/core/constants/shadows.dart';
import 'package:ecommerce_php/features/product/display_products/widgets/building_product_info.dart';
import 'package:ecommerce_php/features/product/product_image.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductVerticalCard extends StatelessWidget {
  const ProductVerticalCard({Key? key, required this.height, required this.width, required this.product, this.margin}) : super(key: key);

  final double height;
  final double width;
  final Product product;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.productDetails, parameters: {"product": product.toJson()}),
      child: Container(
        height: height,
        width: width,
        margin: margin ?? const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF424242),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [shadowDown],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductImage(
              image: product.image!,
              width: width,
              height: 150,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            // Item name & price
            buildProductInfo(product: product),
          ],
        ),
      ),
    );
  }
}
