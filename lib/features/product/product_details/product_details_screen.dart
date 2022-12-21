import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/features/product/build_rating_bar.dart';
import 'package:ecommerce_php/features/product/product_details/product_details_controller.dart';
import 'package:ecommerce_php/features/product/product_details/widget/selectable_tile.dart';
import 'package:ecommerce_php/features/product/product_image.dart';
import 'package:ecommerce_php/features/widgets/button.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Get.theme.colorScheme;
    final product = Product.fromJson(Get.parameters['product']!);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Stack(
            children: [
              //product image
              ProductImage(
                image: product.image!,
                width: Get.size.width,
                height: Get.size.height * 0.5,
                borderRadius: BorderRadius.zero,
              ),

              // name and price
              Align(alignment: Alignment.bottomCenter, child: ProductDetails(product: product)),

              // favorite - shopping cart - back
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      //back button
                      IconButton(icon: Icon(Icons.keyboard_backspace, color: colorScheme.primary), onPressed: Get.back),

                      const Spacer(),
                      // favorite button
                      GetX<ProductDetailsController>(builder: (controller) {
                        controller.setProduct(product);
                        return IconButton(
                          icon: Icon(controller.isFavorite ? Icons.bookmark : Icons.bookmark_add_outlined, color: colorScheme.primary),
                          onPressed: controller.setIsFavorite,
                        );
                      }),

                      // cart button
                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: colorScheme.primary),
                        onPressed: () => Get.toNamed(AppRoutes.cart),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Product product;
  ProductDetails({super.key, required this.product});

  final controller = Get.put(ProductDetailsController());
  final colorScheme = Get.theme.colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height * 0.6,
      width: Get.size.width,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: const [BoxShadow(offset: Offset(1, -1), spreadRadius: -1, blurRadius: 3, color: Colors.black)],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                height: 5,
                width: 140,
                decoration: BoxDecoration(color: colorScheme.primary, borderRadius: const BorderRadius.all(Radius.circular(5))),
              ),
            ),
            const SizedBox(height: 18),

            // name
            Text(
              product.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: colorScheme.onPrimaryContainer, fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rating + rating num
                      buildRatingBar(rating: product.rating!, onRatingUpdate: ((p0) {})),

                      const SizedBox(height: 12),

                      // tags
                      Text(
                        product.tags.toString().replaceAll('[', '').replaceAll(']', '').capitalize!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: colorScheme.onSecondary, fontSize: 16),
                      ),

                      const SizedBox(height: 12),

                      // price
                      Text(
                        "\$${product.price}",
                        style: TextStyle(color: colorScheme.primary, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Quantity product counter
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  // plus button
                  IconButton(
                    onPressed: () => controller.setQuantity(controller.quantity + 1),
                    icon: Icon(Icons.add_circle, color: colorScheme.primary, size: 32),
                  ),

                  // display quantity value
                  Obx(
                    () => Text(
                      controller.quantity.toString(),
                      style: TextStyle(fontSize: 24, color: colorScheme.primary, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // minus button
                  IconButton(
                    onPressed: () => controller.setQuantity(controller.quantity <= 1 ? controller.quantity : controller.quantity - 1),
                    icon: Icon(Icons.remove_circle, color: colorScheme.primary, size: 32),
                  ),
                ]),

                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),

            // Sizes
            SelectableTile(label: "Sizes:", items: product.sizes!, onPress: (size) => controller.setSize(size)),
            const SizedBox(height: 20),

            // Colors
            SelectableTile(label: "Colors:", items: product.colors!, onPress: (color) => controller.setColor(color)),

            const SizedBox(height: 20),

            // description
            const Text("Description:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(product.description!, textAlign: TextAlign.justify, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),

            // Add to cart button
            Button(text: "Add To Cart", color: colorScheme.primary, onTap: () => controller.addToCart(product: product)),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
