import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:flutter/material.dart';

ClipRRect buildProductImage({required String image, required double width, required double height, required BorderRadius borderRadius}) {
  return ClipRRect(
    borderRadius: borderRadius,
    child: FadeInImage(
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: const AssetImage('images/place_holder.png'),
      image: NetworkImage("${Connections.uploadsURL}/$image"),
      imageErrorBuilder: (_, __, ___) => SizedBox(height: 150, child: Image.asset('images/place_holder.png', width: width - 80, height: height - 80)),
      placeholderErrorBuilder: (_, __, ___) => const Center(child: CircularProgressIndicator()),
      placeholderFit: BoxFit.cover,
    ),
  );
}
