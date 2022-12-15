import 'package:ecommerce_php/controller/upload_product_controller.dart';
import 'package:ecommerce_php/features/product/new_product/widgets/display_image.dart';
import 'package:ecommerce_php/features/product/new_product/widgets/new_product_form.dart';
import 'package:ecommerce_php/features/product/new_product/widgets/select_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadProductsController controller = Get.put(UploadProductsController());

    return Scaffold(
      body: ListView(
        children: [
          Obx(() => controller.imagePath.value == "" ? const SelectImage() : const DisplayImage()),
          UploadItemForm(),
        ],
      ),
    );
  }
}
