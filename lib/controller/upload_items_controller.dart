import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_php/core/constants/routes.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/product_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class UploadItemsBase extends GetxController {
  saveItem();
  goToHomeScreen();
}

class UploadItemsController extends UploadItemsBase {
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

  Future getImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: imageSource);

    if (image != null) {
      imagePath.value = image.path;
      imageSize.value = "${(File(imagePath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)} MB";
    } else {
      Get.snackbar("Error", "No Selected Image", snackPosition: SnackPosition.BOTTOM);
    }
    Get.back();
  }

  clearImage() {
    imagePath.value = "";
    imageSize.value = "";
  }

  @override
  Future saveItem() async {
    final newProd = Product(
      name: name.text,
      rating: rating.text,
      tags: tags.text.split(',').toString(),
      price: price.text,
      sizes: sizes.text.split(',').toString(),
      colors: colors.text.split(',').toString(),
      description: description.text,
      image: "",
    );
    final product = await ProductAPI.saveItem(newProd, imagePath.value);
    log(product.toString());
    if (product != null) {
      goToHomeScreen();
    } else {
      Get.snackbar("Error", "Product not added");
    }
  }

  @override
  goToHomeScreen() => Get.offNamed(AppRoutes.home);
}
