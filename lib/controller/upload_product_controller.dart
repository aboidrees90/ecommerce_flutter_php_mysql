import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/services/file_api.dart';
import 'package:ecommerce_php/services/product_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadProductsController extends GetxController {
  late TextEditingController name;
  late TextEditingController rating;
  late TextEditingController tags;
  late TextEditingController price;
  late TextEditingController sizes;
  late TextEditingController colors;
  late TextEditingController description;

  var imagePath = ''.obs;
  var imageSize = ''.obs;

  @override
  void onInit() {
    name = TextEditingController();
    rating = TextEditingController();
    tags = TextEditingController();
    price = TextEditingController();
    sizes = TextEditingController();
    colors = TextEditingController();
    description = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    rating.dispose();
    tags.dispose();
    price.dispose();
    sizes.dispose();
    colors.dispose();
    description.dispose();
    super.dispose();
  }

  Future pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: imageSource);
    if (image != null) {
      log(image.path);

      imagePath.value = image.path;
      imageSize.value = "${(File(imagePath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)} MB";
    } else {
      Get.snackbar("Error", "No Selected Image", snackPosition: SnackPosition.BOTTOM);
    }
  }

  void clearImage() {
    imagePath.value = "";
    imageSize.value = "";
  }

  Future save() async {
    // Upload image
    if (imagePath.value == "") {
      log("No Image");
      return;
    }

    try {
      final res = await FileAPI.upload(path: imagePath.value);

      String image = res['data']['filename'];

      // Save Product
      final product = await ProductAPI.addNew(body: {
        'name': name.text,
        'rating': rating.text,
        'tags': tags.text,
        'price': price.text,
        'sizes': sizes.text,
        'colors': colors.text,
        'description': description.text,
        'image': image,
      });

      log(product.toString());

      if (product != null) {
        goToHomeScreen();
      } else {
        Get.snackbar("Error", "Product not added");
      }
    } catch (e) {
      log("Upload Product Controller:$e");
    }
  }

  goToHomeScreen() => Get.offNamed(AppRoutes.home);
}
