import 'package:ecommerce_php/controller/products_controller.dart';
import 'package:ecommerce_php/features/product/display_products/widgets/product_horizontal_card.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  Products({super.key});

  final ProductsController _controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    const cardWidth = 120.0;
    const cardHeight = 120.0;

    return FutureBuilder(
      future: _controller.getAllProducts(),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        if (!snapshot.hasData) return const Center(child: Text("No Products Found!"));

        if (snapshot.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              Product product = snapshot.data![index];
              final isFirst = index == 0 ? 16.0 : 8.0;
              final isLast = index == snapshot.data!.length - 1 ? 16.0 : 8.0;

              return ProductHorizontalCard(
                height: cardHeight,
                width: cardWidth,
                product: product,
                margin: EdgeInsets.fromLTRB(16, isFirst, 16, isLast),
              );
            },
          );
        } else {
          return const Center(child: Text("Empty, No Data!"));
        }
      },
    );
  }
}
