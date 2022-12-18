import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

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
