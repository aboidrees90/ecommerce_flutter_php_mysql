import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.height, required this.width, required this.product, this.margin}) : super(key: key);

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
          boxShadow: const [BoxShadow(offset: Offset(0, 3), blurRadius: 4, spreadRadius: -2, color: Colors.grey)],
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
                  buildNameAndPrice(),
                  const SizedBox(height: 8),
                  // Rating
                  buildRatingBar()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRatingBar() {
    return Row(
      children: [
        // rating stars
        RatingBar.builder(
          initialRating: double.tryParse(product.rating!) ?? 1.0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (updatedRating) {},
          ignoreGestures: true,
          unratedColor: Colors.grey,
          itemSize: 20,
        ),

        const SizedBox(width: 8),

        // rating number
        Text("(${product.rating!})", style: const TextStyle(color: Colors.grey, fontSize: 16))
      ],
    );
  }

  Row buildNameAndPrice() {
    return Row(
      children: [
        Expanded(
          child: Text(
            product.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 10),
        Text(product.price!, style: const TextStyle(color: Colors.purpleAccent, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
