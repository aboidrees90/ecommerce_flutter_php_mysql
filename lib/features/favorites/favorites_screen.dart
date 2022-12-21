import 'package:ecommerce_php/features/favorites/favorite_list_controller.dart';
import 'package:ecommerce_php/features/product/display_products/widgets/product_horizontal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.put(FavoriteListController());

    return SizedBox(
      height: Get.size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
              child: Text(
                "My Favorite Products:",
                style: TextStyle(color: Get.theme.colorScheme.primary, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 14, 8, 8),
              child: Text(
                "Order your favorites selected products:",
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),

            // display favoritelits
            Obx(() {
              return ListView.builder(
                itemCount: favoriteController.favoriteLits.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final product = favoriteController.favoriteLits[index].product;
                  final isFirst = index == 0 ? 16.0 : 8.0;
                  final isLast = index == favoriteController.favoriteLits.length - 1 ? 16.0 : 8.0;

                  return ProductHorizontalCard(
                    height: 120,
                    width: 120,
                    product: product!,
                    margin: EdgeInsets.fromLTRB(16, isFirst, 16, isLast),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
