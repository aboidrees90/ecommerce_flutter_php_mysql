import 'dart:io';

import 'package:ecommerce_php/controller/upload_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadProductsController controller = Get.put(UploadProductsController());

    return Stack(
      children: [
        Container(
          height: Get.height / 4,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image: FileImage(File(controller.imagePath.value)), fit: BoxFit.cover)),
        ),
        IconButton(
          alignment: Alignment.topLeft,
          icon: const Icon(Icons.clear),
          color: Colors.white,
          onPressed: controller.clearImage,
        ),
      ],
    );
  }
}
