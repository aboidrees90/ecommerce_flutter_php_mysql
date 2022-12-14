import 'dart:io';

import 'package:ecommerce_php/controller/upload_product_controller.dart';
import 'package:ecommerce_php/ui/admin/upload_items/new_product_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadProductsController controller = Get.put(UploadProductsController());

    return ListView(
      children: [
        Obx(() => controller.imagePath.value == "" ? buildImagePicker() : buildDisplaySelectedImage()),
        UploadItemForm(),
      ],
    );
  }

  Widget buildDisplaySelectedImage() {
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

  Widget buildImagePicker() {
    final UploadProductsController controller = Get.put(UploadProductsController());

    return Container(
      decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.black54, Colors.deepPurple])),
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
