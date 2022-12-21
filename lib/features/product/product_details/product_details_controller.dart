import 'dart:developer';

import 'package:ecommerce_php/core/classes/rx_nullable.dart';
import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:ecommerce_php/model/cart.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/cart_api.dart';
import 'package:ecommerce_php/services/favorite_api%20.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final RxInt _quantity = 1.obs;
  final RxString _size = "".obs;
  final RxString _color = "".obs;
  final RxBool _isFavorite = false.obs;
  final Rx<Product?> _product = RxNullable<Product?>().setNull();
  final currentUser = Get.find<Auth>().currentUser;

  int get quantity => _quantity.value;
  bool get isFavorite => _isFavorite.value;
  String get size => _size.value;
  String get color => _color.value;
  Product? get product => _product.value;

  setProduct(Product product) => _product.value = product;

  @override
  onInit() {
    super.onInit();
    _validateFavorite();
  }

  setQuantity(int quantity) => _quantity.value = quantity;
  setSize(String size) => _size.value = size;
  setColor(String color) => _color.value = color;

  _setIsFavorite(bool isFavorite) => _isFavorite.value = isFavorite;

  addToCart({required Product product}) async {
    final cartItem = Cart(userID: currentUser!.id!, productID: product.id!, product: product, quantity: quantity, color: color, size: size).toMap();
    try {
      await CartAPI.add(body: cartItem);
      Fluttertoast.showToast(msg: "product added successfully to your cart");
    } catch (e) {
      log(e.toString());
    }
  }

  toggleIsFavorite() => _isFavorite.value ? _removeFromFavorites() : _addToFavorites();

  _addToFavorites() async {
    if (_product.value == null) return;
    try {
      FavoriteAPI.add(body: {
        'userID': currentUser!.id!.toString(),
        'productID': _product.value!.id!.toString(),
      }).then(_setIsFavorite);
    } catch (e) {
      log(e.toString());
      Get.snackbar("Failure", "didn't added to your favorites");
    }
  }

  _removeFromFavorites() {
    if (_product.value == null) return;

    try {
      FavoriteAPI.delete(body: {
        'userID': currentUser!.id!.toString(),
        'productID': _product.value!.id!.toString(),
      }).then(_setIsFavorite);
    } catch (e) {
      log(e.toString());
      Get.snackbar("Failure", "didn't removed from your favorites");
    }
  }

  _validateFavorite() {
    if (_product.value == null) return;

    try {
      FavoriteAPI.validateFavorite(body: {
        'userID': currentUser!.id!.toString(),
        'productID': _product.value!.id!.toString(),
      }).then(_setIsFavorite);
    } catch (e) {
      log(e.toString());
    }
  }
}
