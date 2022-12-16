import 'package:ecommerce_php/core/constants/shadows.dart';
import 'package:ecommerce_php/features/cart/cart_list_controller.dart';
import 'package:ecommerce_php/features/product/product_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final cartListController = Get.put(CartListController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => cartListController.cartList.isNotEmpty
            ? ListView.builder(
                itemCount: cartListController.cartList.length,
                itemBuilder: (context, index) {
                  final cartItem = cartListController.cartList[index];
                  final product = cartItem.product!;

                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(16, index == 0 ? 16 : 4, 16, index == cartListController.cartList.length - 1 ? 16 : 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF424242),
                      boxShadow: const [shadowDown],
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // name - color - size - price - +/-
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Product name
                                Text(
                                  product.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                // Color + Size + Price
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    // Color size
                                    Expanded(
                                      child: Text(
                                        "Color: ${cartItem.color} \nSize: ${cartItem.size}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(color: Colors.white60),
                                      ),
                                    ),

                                    //Price
                                    Text(
                                      "\$${product.price}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),

                                // + / -
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // + button
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline, color: Colors.amber, size: 32)),

                                    // Quantity
                                    Text(cartItem.quantity.toString(), style: const TextStyle(color: Colors.amber, fontSize: 16)),

                                    // - button
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle_outline_outlined, color: Colors.amber, size: 32)),
                                  ],
                                )
                              ],
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
                                      onTap: () {
                                        cartListController.updateSelectedProduct(cartItem.id!);
                                        // cartListController.calculateTotalCost();
                                      },
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
              )
            : const Center(child: Text("Cart is empty")),
      ),
      bottomNavigationBar: GetBuilder(
        init: CartListController(),
        builder: (controller) {
          return Container(
            height: 60,
            decoration: const BoxDecoration(color: Color(0xFF424242), boxShadow: [shadowUp]),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Total amount
                const Text("Total amount", style: TextStyle(color: Colors.white38, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                // total price
                Obx(
                  () => Text(
                    "\$${cartListController.total.toStringAsFixed(2)}",
                    maxLines: 1,
                    style: const TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
