import 'package:ecommerce_php/core/constants/shadows.dart';
import 'package:ecommerce_php/features/cart/cart_list_controller.dart';
import 'package:ecommerce_php/features/product/product_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartListController = Get.put(CartListController());

    return Obx(() {
      return ListView.builder(
        itemCount: cartListController.cartList.length,
        itemBuilder: (context, index) {
          final cartItem = cartListController.cartList[index];
          final product = cartItem.product!;
          final colorScheme = Get.theme.colorScheme;

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
                              IconButton(
                                onPressed: () => cartListController.updateCartItem(
                                  body: {'id': product.id!.toString(), 'quantity': (cartItem.quantity + 1).toString()},
                                ),
                                icon: Icon(Icons.add_circle_outline, color: colorScheme.primary, size: 32),
                              ),

                              // Quantity
                              Text(cartItem.quantity.toString(), style: TextStyle(color: colorScheme.primary, fontSize: 16)),

                              // - button
                              IconButton(
                                onPressed: () async {
                                  if (cartItem.quantity > 1) {
                                    cartListController.updateCartItem(
                                      body: {'id': product.id!.toString(), 'quantity': (cartItem.quantity - 1).toString()},
                                    );
                                  } else {
                                    var response = await Get.dialog(
                                      AlertDialog(
                                        backgroundColor: colorScheme.primaryContainer,
                                        title: Text(
                                          "Remove From Cart",
                                          style: TextStyle(color: colorScheme.primary, fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        content: const Text("Are you sure?\nyou want to remove item from cart?"),
                                        actions: [
                                          TextButton(onPressed: Get.back, child: const Text("Cancel", style: TextStyle(fontSize: 20))),
                                          TextButton(
                                            child: const Text("Delete", style: TextStyle(color: Colors.redAccent, fontSize: 16)),
                                            onPressed: () => Get.back(result: "DELETE"),
                                          ),
                                        ],
                                      ),
                                    );

                                    if (response == "DELETE") cartListController.deleteCartByID(product.id!);
                                  }
                                },
                                icon: Icon(
                                  cartItem.quantity < 2 ? Icons.delete_outline : Icons.remove_circle_outline_outlined,
                                  color: cartItem.quantity < 2 ? Colors.redAccent : colorScheme.primary,
                                  size: 32,
                                ),
                              ),
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
                                cartListController.selectedItemsInCartList.contains(cartItem.id) ? Icons.check_box : Icons.check_box_outline_blank,
                                color: cartListController.selectedItemsInCartList.contains(cartItem.id) ? colorScheme.primary : colorScheme.onSecondary,
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
    });
  }
}
