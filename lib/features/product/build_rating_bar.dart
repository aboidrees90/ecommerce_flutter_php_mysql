import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Row buildRatingBar({required double rating, required void Function(double) onRatingUpdate}) {
  return Row(
    children: [
      // rating stars
      RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
        onRatingUpdate: onRatingUpdate,
        ignoreGestures: true,
        unratedColor: Colors.grey,
        itemSize: 18,
      ),

      const SizedBox(width: 8),

      // rating number
      Text("($rating)", style: const TextStyle(color: Colors.amber, fontSize: 16))
    ],
  );
}
