import 'package:ecommerce_php/core/constants/shadows.dart';
import 'package:ecommerce_php/features/cart/cart_list_controller.dart';
import 'package:ecommerce_php/features/product/product_image.dart';
import 'package:ecommerce_php/features/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartListController = Get.put(CartListController());
    final colorScheme = Get.theme.colorScheme;

    return Scaffold(
      body: Obx(
        () => cartListController.cartList.isNotEmpty ? const CartProductsList() : const EmptyCart(),
      ),
      bottomNavigationBar: GetBuilder(
        init: CartListController(),
        builder: (controller) {
          return Container(
            height: 60,
            decoration: BoxDecoration(color: colorScheme.primaryContainer, boxShadow: const [shadowUp]),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total amount
                Text("Total amount", style: TextStyle(color: colorScheme.onSecondary, fontSize: 20, fontWeight: FontWeight.bold)),
                // total price
                Obx(
                  () => Text(
                    "\$${cartListController.total.toStringAsFixed(2)}",
                    maxLines: 1,
                    style: TextStyle(color: colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Button(text: 'CHECKOUT', color: colorScheme.primary, onTap: () {}),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartProductsList extends StatelessWidget {
  const CartProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartListController = Get.put(CartListController());

    final colorScheme = Get.theme.colorScheme;

    return ListView.builder(
      itemCount: cartListController.cartList.length,
      itemBuilder: (context, index) {
        final cartItem = cartListController.cartList[index];
        final product = cartItem.product!;

        return Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(16, index == 0 ? 16 : 4, 16, index == cartListController.cartList.length - 1 ? 16 : 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colorScheme.primaryContainer,
            boxShadow: const [shadowDown],
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // name - color - size - price - +/-
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Product name
                        Text(
                          product.name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: colorScheme.onPrimaryContainer, fontSize: 16),
                        ),

                        // Color + Size + Price
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Color size
                            Expanded(
                              child: Text(
                                "Color: ${cartItem.color} \nSize: ${cartItem.size}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: colorScheme.onSecondary),
                              ),
                            ),

                            //Price
                            Text(
                              "\$${product.price}",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: colorScheme.primary, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        // + / -
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // + button
                            IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline, color: colorScheme.primary, size: 32)),

                            // Quantity
                            Text(cartItem.quantity.toString(), style: TextStyle(color: colorScheme.primary, fontSize: 16)),

                            // - button
                            IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle_outline_outlined, color: colorScheme.primary, size: 32)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Image

                Stack(
                  children: [
                    ProductImage(
                      image: product.image!,
                      width: 160,
                      height: 160,
                      borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GetBuilder(
                        init: CartListController(),
                        builder: (controller) {
                          return GestureDetector(
                            onTap: () => cartListController.updateSelectedProduct(cartItem.id!),
                            child: Icon(
                              cartListController.selectedProductsInCartList.contains(cartItem.id) ? Icons.check_box : Icons.check_box_outline_blank,
                              color: cartListController.isAllSelected ? Colors.grey : Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Get.theme.colorScheme;
    return Stack(
      children: [
        Positioned(
          top: (Get.size.height - Get.size.width) / 2,
          left: (Get.size.width - Get.size.width * .90) / 2,
          width: Get.size.width * .90,
          child: Image.asset('images/empty_cart.png', width: Get.size.width * .90, height: Get.size.width * .90),
        ),
        Positioned(
          top: (Get.size.height - Get.size.width + Get.size.width / 3.4),
          left: Get.size.width / 2 - 70,
          width: 140,
          child: Text(
            "Empty Cart",
            textAlign: TextAlign.center,
            style: TextStyle(color: colorScheme.primary, fontSize: 24),
          ),
        ),
      ],
    );
  }
}
