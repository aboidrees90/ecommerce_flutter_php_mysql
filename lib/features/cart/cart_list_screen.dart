import 'package:ecommerce_php/core/constants/shadows.dart';
import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:ecommerce_php/features/cart/cart_list_controller.dart';
import 'package:ecommerce_php/features/product/product_image.dart';
import 'package:ecommerce_php/services/cart_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final Auth _auth = Get.put(Auth());

  final cartListController = Get.put(CartListController());

  getCurrentUserCartList() async {
    final cartList = await CartAPI.fetchCurrentUserCartList(body: {"userID": _auth.currentUser!.id!.toString()});
    cartListController.setList(cartList);
    calculateTotalCost();
  }

  calculateTotalCost() {
    cartListController.setTotal(0);
    if (cartListController.selectedProductsInCartList.isNotEmpty) {
      for (var productInCart in cartListController.cartList) {
        if (cartListController.selectedProductsInCartList.contains(productInCart.id)) {
          var newTotal = cartListController.total + (productInCart.product!.price!) * double.parse(productInCart.quantity.toString());
          cartListController.setTotal(newTotal);
        }
      }
    }
  }

  @override
  void initState() {
    getCurrentUserCartList();
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
                  final product = cartItem.product;

                  return SizedBox(
                    width: Get.size.width,
                    child: Row(
                      children: [
                        // Checkbox
                        GetBuilder(
                          init: CartListController(),
                          builder: (controller) {
                            return IconButton(
                              onPressed: () {
                                cartListController.updateSelectedProduct(cartItem.id!);
                                calculateTotalCost();
                              },
                              icon: Icon(
                                cartListController.selectedProductsInCartList.contains(cartItem.id) ? Icons.check_box : Icons.check_box_outline_blank,
                                color: cartListController.isAllSelected ? Colors.grey : Colors.white,
                              ),
                            );
                          },
                        ),

                        // Product info
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, index == 0 ? 16 : 4, 16, index == cartListController.cartList.length - 1 ? 16 : 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                                boxShadow: const [
                                  BoxShadow(offset: Offset(0, 0), blurRadius: 3, color: Colors.white),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // name - color - size - price - +/-
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Product name
                                          Text(product!.name!, maxLines: 2, overflow: TextOverflow.ellipsis),
                                          const SizedBox(height: 20),

                                          // Color + Size + Price
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            textBaseline: TextBaseline.ideographic,
                                            children: [
                                              // Color size
                                              Expanded(
                                                child: Text(
                                                  "Color: ${cartItem.color} \nSize: ${cartItem.size}",
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(color: Colors.white60),
                                                ),
                                              ),

                                              //Price
                                              Text(
                                                "\$${product.price}",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(color: Colors.purpleAccent, fontSize: 16, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          // + / -
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              // + button
                                              IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline, color: Colors.grey, size: 30)),

                                              // Quantity
                                              Text(cartItem.quantity.toString(), style: const TextStyle(color: Colors.purpleAccent, fontSize: 16)),

                                              // - button
                                              IconButton(
                                                  onPressed: () {}, icon: const Icon(Icons.remove_circle_outline_outlined, color: Colors.grey, size: 30)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Image
                                  ProductImage(
                                    image: product.image!,
                                    width: 185,
                                    height: 150,
                                    borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
            decoration: const BoxDecoration(color: Colors.black, boxShadow: [glowingShadow]),
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
                    style: const TextStyle(color: Colors.purpleAccent, fontSize: 20, fontWeight: FontWeight.bold),
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
