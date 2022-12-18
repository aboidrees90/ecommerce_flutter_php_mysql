import 'package:ecommerce_php/features/cart/cart_list_controller.dart';
import 'package:ecommerce_php/features/cart/widgets/cart_bottom_bar.dart';
import 'package:ecommerce_php/features/cart/widgets/cart_products_list.dart';
import 'package:ecommerce_php/features/cart/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartListController = Get.put(CartListController());
    final colorScheme = Get.theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: TextStyle(color: colorScheme.primary)),
        actions: [
          // Remove from cart
          GetBuilder(
            init: cartListController,
            builder: ((controller) {
              if (controller.selectedItemsInCartList.isNotEmpty) {
                return IconButton(
                  onPressed: () async {
                    var response = await Get.dialog(
                      AlertDialog(
                        backgroundColor: Get.theme.colorScheme.primaryContainer,
                        title: Text("Clear Cart", style: TextStyle(color: colorScheme.primary, fontSize: 16, fontWeight: FontWeight.bold)),
                        content: const Text("Are you sure?\nyou want to remove all product from cart?"),
                        actions: [
                          TextButton(onPressed: Get.back, child: const Text("Cancel", style: TextStyle(fontSize: 20))),
                          TextButton(
                            child: const Text("Clear Cart", style: TextStyle(color: Colors.redAccent, fontSize: 16)),
                            onPressed: () => Get.back(result: "DELETE"),
                          ),
                        ],
                      ),
                    );

                    if (response == "DELETE") cartListController.clearSelectedItems();
                  },
                  icon: const Icon(Icons.delete_sweep, color: Colors.redAccent, size: 28),
                );
              }
              return Container();
            }),
          ),

          // Select all items
          Obx(
            () => IconButton(
              onPressed: cartListController.toggleAllItemsSelection,
              icon: Icon(
                cartListController.isAllItemsSelected ? Icons.check_box : Icons.check_box_outline_blank,
                color: cartListController.isAllItemsSelected ? colorScheme.primary : colorScheme.onSecondary,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() => cartListController.cartList.isNotEmpty ? const CartProductsList() : const EmptyCart()),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
