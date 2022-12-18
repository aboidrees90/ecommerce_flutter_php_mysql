import 'package:ecommerce_php/core/constants/shadows.dart';
import 'package:ecommerce_php/features/cart/cart_list_controller.dart';
import 'package:ecommerce_php/features/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Get.theme.colorScheme;

    return GetBuilder(
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
                  "\$${controller.total.toStringAsFixed(2)}",
                  maxLines: 1,
                  style: TextStyle(color: colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Button(
                text: 'CHECKOUT',
                color: controller.selectedItemsInCartList.isEmpty ? colorScheme.primary.withOpacity(0.2) : colorScheme.primary,
                onTap: controller.selectedItemsInCartList.isEmpty ? null : () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
