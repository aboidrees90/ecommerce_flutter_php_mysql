import 'package:ecommerce_php/controller/product_details_controller.dart';
import 'package:ecommerce_php/features/product/build_rating_bar.dart';
import 'package:ecommerce_php/features/product/product_details/widget/selectable_tile.dart';
import 'package:ecommerce_php/features/product/product_image.dart';
import 'package:ecommerce_php/features/widgets/button.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final product = Product.fromJson(Get.parameters['product']!);
  final ProductDetailsController _controller = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //product image
          ProductImage(
            image: product.image!,
            width: Get.size.width,
            height: Get.size.height * 0.5,
            borderRadius: const BorderRadius.all(Radius.zero),
          ),

          // name and price
          Align(
            alignment: Alignment.bottomCenter,
            child: productInfo(),
          ),
        ],
      ),
    );
  }

  productInfo() {
    return Container(
      height: Get.size.height * 0.6,
      width: Get.size.width,
      decoration: const BoxDecoration(
        color: Color(0xFF424242),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [BoxShadow(offset: Offset(1, -1), spreadRadius: -1, blurRadius: 3, color: Colors.black)],
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
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
            const SizedBox(height: 18),

            // name
            Text(
              product.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                        style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                      ),

                      const SizedBox(height: 12),

                      // price
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(color: Colors.amber, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Quantity product counter
                Obx(
                  () => Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    // plus button
                    IconButton(
                      onPressed: () => _controller.setQuantity(_controller.quantity + 1),
                      icon: const Icon(Icons.add_circle, color: Colors.amber, size: 32),
                    ),

                    // display quantity value
                    Text(
                      _controller.quantity.toString(),
                      style: const TextStyle(fontSize: 24, color: Colors.amber, fontWeight: FontWeight.bold),
                    ),

                    // minus button
                    IconButton(
                      onPressed: () => _controller.setQuantity(_controller.quantity <= 1 ? _controller.quantity : _controller.quantity - 1),
                      icon: const Icon(Icons.remove_circle, color: Colors.amber, size: 32),
                    ),
                  ]),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),

            // Sizes
            SelectableTile(label: "Sizes:", items: product.sizes!, onPress: (size) => _controller.setSize(size)),
            const SizedBox(height: 20),

            // Colors
            SelectableTile(label: "Colors:", items: product.colors!, onPress: (color) => _controller.setColor(color)),

            const SizedBox(height: 20),

            // description
            const Text("Description:", style: TextStyle(fontSize: 18, color: Colors.amber, fontWeight: FontWeight.bold)),
            Text(product.description!, textAlign: TextAlign.justify, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),

            // Add to cart button
            Button(text: "Add To Cart", color: Colors.amber, onTap: () => _controller.addToCart(product: product)),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
