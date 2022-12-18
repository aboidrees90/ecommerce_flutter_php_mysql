import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/model/cart.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/api.dart';

class CartAPI {
  static Future<Cart> add({required Map<String, dynamic> body}) async {
    try {
      final res = await API.post(url: Connections.addToCart, body: body);
      return Cart.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  static Future delete({required Map<String, dynamic> body}) async {
    try {
      final res = await API.post(url: Connections.removeFromCart, body: body);
      if (res != '') throw "UNKNOWN_ERROR";
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Cart>> fetchCurrentUserCartList({required Map<String, dynamic> body}) async {
    try {
      final response = await API.post(url: Connections.getCartList, body: body);
      return List<Cart>.generate(response.length, (index) {
        final cart = Cart.fromMap(response[index]);
        cart.product = Product.fromMap(response[index]);
        return cart;
      });
    } catch (e) {
      rethrow;
    }
  }
}
