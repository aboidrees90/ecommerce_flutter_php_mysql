import 'package:ecommerce_php/controller/upload_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadProductsController controller = Get.put(UploadProductsController());

    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black54, Get.theme.colorScheme.primary])),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: Get.height / 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () async => await controller.pickImage(ImageSource.camera),
            icon: const Icon(FontAwesomeIcons.camera, color: Colors.white54),
            selectedIcon: const Icon(Icons.add_photo_alternate, color: Colors.red),
            iconSize: 80,
          ),
          IconButton(
            onPressed: () async => await controller.pickImage(ImageSource.gallery),
            icon: const Icon(Icons.add_photo_alternate, color: Colors.white54),
            selectedIcon: const Icon(Icons.add_photo_alternate, color: Colors.red),
            iconSize: 80,
          ),
        ],
      ),
    );
  }
}
