import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/ui/user/products/build_name_and_price.dart';
import 'package:ecommerce_php/ui/user/products/build_rating_bar.dart';
import 'package:flutter/material.dart';

class ProductVerticalCard extends StatelessWidget {
  const ProductVerticalCard({Key? key, required this.height, required this.width, required this.product, this.margin}) : super(key: key);

  final double height;
  final double width;
  final Product product;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height,
        width: width,
        margin: margin ?? const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(offset: Offset(0, 0), blurRadius: 3, color: Colors.white)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: FadeInImage(
                height: 150,
                width: width,
                fit: BoxFit.cover,
                placeholder: const AssetImage('image/place_holder.png'),
                image: NetworkImage("${Connections.uploadsURL}/${product.image}"),
                imageErrorBuilder: (_, __, ___) => const SizedBox(height: 150, child: Icon(Icons.broken_image_outlined, size: 60, color: Colors.grey)),
                placeholderErrorBuilder: (_, __, ___) => const Center(child: CircularProgressIndicator()),
                placeholderFit: BoxFit.cover,
              ),
            ),
            // Item name & price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name & Price
                  buildNameAndPrice(name: product.name!, price: double.tryParse(product.price!) ?? 00.00),

                  const SizedBox(height: 8),
                  // Rating
                  buildRatingBar(rating: double.tryParse(product.rating!) ?? 0.0, onRatingUpdate: (updatedRating) {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
