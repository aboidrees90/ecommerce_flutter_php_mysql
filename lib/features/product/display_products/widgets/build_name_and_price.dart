import 'package:flutter/material.dart';
import 'package:get/get.dart';

Row buildNameAndPrice({required String name, required double price}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Get.theme.colorScheme.onPrimaryContainer, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(width: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text("\$$price", style: TextStyle(color: Get.theme.colorScheme.primary, fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ],
  );
}
