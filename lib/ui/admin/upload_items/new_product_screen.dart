import 'dart:io';

import 'package:ecommerce_php/controller/upload_items_controller.dart';
import 'package:ecommerce_php/ui/admin/upload_items/new_product_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({super.key});

  final UploadItemsController _controller = Get.put(UploadItemsController());

  showDialogBoxForImagePickingAndCapturing() {
    Get.defaultDialog(
      backgroundColor: Colors.black87,
      title: "Select Image",
      titleStyle: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.all(30),
      content: Column(
        children: [
          TextButton(
            onPressed: () async => await _controller.getImage(ImageSource.camera),
            child: const Text("Capture with Phone Camera", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () async => await _controller.getImage(ImageSource.gallery),
            child: const Text("Select Image From Phone Gallery", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
      cancel: const Text("Cancel", textAlign: TextAlign.center, style: TextStyle(color: Colors.red)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Obx(() => _controller.imagePath.value == "" ? buildImagePicker() : buildDisplaySelectedImage()),
        UploadItemForm(),
      ],
    );
  }

  buildDisplaySelectedImage() {
    return Stack(
      children: [
        Container(
          height: Get.height / 4,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image: FileImage(File(_controller.imagePath.value)), fit: BoxFit.cover)),
        ),
        IconButton(
          alignment: Alignment.topLeft,
          icon: const Icon(Icons.clear),
          color: Colors.white,
          onPressed: _controller.clearImage,
        ),
      ],
    );
  }

  Container buildImagePicker() {
    return Container(
      decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.black54, Colors.deepPurple])),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: Get.height / 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () async => await _controller.getImage(ImageSource.camera),
            icon: const Icon(FontAwesomeIcons.camera, color: Colors.white54),
            selectedIcon: const Icon(Icons.add_photo_alternate, color: Colors.red),
            iconSize: 80,
          ),
          IconButton(
            onPressed: () async => await _controller.getImage(ImageSource.gallery),
            icon: const Icon(Icons.add_photo_alternate, color: Colors.white54),
            selectedIcon: const Icon(Icons.add_photo_alternate, color: Colors.red),
            iconSize: 80,
          ),
        ],
      ),
    );
  }
}
