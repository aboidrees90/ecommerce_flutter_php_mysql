import 'package:ecommerce_php/controller/products_controller.dart';
import 'package:ecommerce_php/features/product/display_products/widgets/product_vertical_card.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingProduct extends StatelessWidget {
  TrendingProduct({super.key});

  final ProductsController _controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    final cardWidth = (size.width - 48) / 2;
    final cardHeight = cardWidth * 5 / 3.1;

    return FutureBuilder(
      future: _controller.getTrending(),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        if (!snapshot.hasData) return const Center(child: Text("No Trending Products Found!"));
        if (snapshot.data!.isNotEmpty) {
          return SizedBox(
            height: cardHeight,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Product product = snapshot.data![index];
                final isFirst = index == 0 ? 16.0 : 8.0;
                final isLast = index == snapshot.data!.length - 1 ? 16.0 : 8.0;

                return ProductVerticalCard(
                  height: cardHeight,
                  width: cardWidth,
                  product: product,
                  margin: EdgeInsets.fromLTRB(isFirst, 10, isLast, 10),
                );
              },
            ),
          );
        } else {
          return const Center(child: Text("Empty, No Data!"));
        }
      },
    );
  }
}
