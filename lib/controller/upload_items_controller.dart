import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class UploadItemsBase extends GetxController {
  saveItem();
}

class UploadItemsController extends UploadItemsBase {
  late TextEditingController name;
  late TextEditingController rating;
  late TextEditingController tags;
  late TextEditingController price;
  late TextEditingController sizes;
  late TextEditingController colors;
  late TextEditingController description;

  String imageLink = "";

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

  @override
  saveItem() {}
}
