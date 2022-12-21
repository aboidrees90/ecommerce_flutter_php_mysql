import 'dart:developer';

import 'package:ecommerce_php/core/classes/rx_nullable.dart';
import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:ecommerce_php/features/favorites/favorite_list_controller.dart';
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
  final Rx<Product?> _product = RxNullable<Product?>().setNull();
  final currentUser = Get.find<Auth>().currentUser;
  final favoriteListController = Get.find<FavoriteListController>();

  int get quantity => _quantity.value;
  bool get isFavorite => _isFavorite.value;
  String get size => _size.value;
  String get color => _color.value;
  Product? get product => _product.value;

  setProduct(Product product) async {
    _product.value = product;
    _isFavorite.value = await favoriteListController.isFavorite(product.id!);

    log(_isFavorite.value.toString());
  }

  setQuantity(int quantity) => _quantity.value = quantity;
  setSize(String size) => _size.value = size;
  setColor(String color) => _color.value = color;

  addToCart({required Product product}) async {
    final cartItem = Cart(userID: currentUser!.id!, productID: product.id!, product: product, quantity: quantity, color: color, size: size).toMap();
    try {
      await CartAPI.add(body: cartItem);
      Fluttertoast.showToast(msg: "product added successfully to your cart");
    } catch (e) {
      log(e.toString());
    }
  }

  setIsFavorite() async {
    if (_isFavorite.value) {
      try {
        await favoriteListController.removeFromFavorites(product!.id!);
        _isFavorite.value = await favoriteListController.isFavorite(product!.id!);
      } catch (e) {
        log(e.toString());
      }
    } else {
      try {
        await favoriteListController.addToFavorites(product!.id!);
        _isFavorite.value = await favoriteListController.isFavorite(product!.id!);
      } catch (e) {
        log(e.toString());
      }
    }

    update();
  }
}
