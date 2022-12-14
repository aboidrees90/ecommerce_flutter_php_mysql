import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/model/cart.dart';
import 'package:ecommerce_php/services/api.dart';

class CartAPI extends API {
  Future<Cart> add({required Map<String, dynamic> body}) async {
    try {
      final res = await API.post(url: Connections.addToCart, body: body);
      return Cart.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  static fetchCartProducts({required Map<String, dynamic> userID}) {}
}
