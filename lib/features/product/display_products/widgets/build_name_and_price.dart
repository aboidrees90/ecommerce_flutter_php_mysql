import 'package:flutter/material.dart';

Row buildNameAndPrice({required String name, required double price}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(width: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text("\$$price", style: const TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ],
  );
}
