import 'dart:developer';

import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:ecommerce_php/model/cart.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/cart_api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final RxInt _quantity = 1.obs;
  final RxString _size = "".obs;
  final RxString _color = "".obs;
  final RxBool _isFavorite = false.obs;

  int get quantity => _quantity.value;
  String get size => _size.value;
  String get color => _color.value;
  bool get isFavorite => _isFavorite.value;

  setQuantity(int quantity) => _quantity.value = quantity;
  setSize(String size) => _size.value = size;
  setColor(String color) => _color.value = color;
  setIsFavorite(bool isFavorite) => _isFavorite.value = isFavorite;

  addToCart({required Product product}) async {
    Auth auth = Get.put(Auth());
    final cartItem = Cart(userID: auth.currentUser!.id!, productID: product.id!, product: product, quantity: quantity, color: color, size: size).toMap();
    try {
      await CartAPI.add(body: cartItem);
      Fluttertoast.showToast(msg: "product added successfully to your cart");
    } catch (e) {
      log(e.toString());
    }
  }
}
