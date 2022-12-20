import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/model/favorite.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/api.dart';

class FavoriteAPI {
  static Future<bool> add({required Map<String, dynamic> body}) async {
    try {
      return await API.post(url: Connections.addToFavorite, body: body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> delete({required Map<String, dynamic> body}) async {
    try {
      return await API.post(url: Connections.removeFromFavorite, body: body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> validateFavorite({required Map<String, dynamic> body}) async {
    try {
      return await API.post(url: Connections.validateFavorites, body: body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Favorite>> fetchCurrentUserFavoriteList({required Map<String, dynamic> body}) async {
    try {
      final response = await API.post(url: Connections.getFavoriteList, body: body);
      return List<Favorite>.generate(response.length, (index) {
        final favorite = Favorite.fromMap(response[index]);
        favorite.product = Product.fromMap(response[index]);
        return favorite;
      });
    } catch (e) {
      rethrow;
    }
  }
}
