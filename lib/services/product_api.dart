import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/api.dart';

class ProductAPI {
  static Future<Product?> addNew({required Map<String, dynamic> body}) async {
    try {
      final response = await API.post(url: Connections.addNewProduct, body: body);

      return Product.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Product>> fetchTrending() async {
    try {
      final response = await API.get(url: Connections.listTrendingProducts);
      return List<Product>.generate(response.length, (index) => Product.fromMap(response[index]));
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Product>> fetchAll() async {
    try {
      final response = await API.get(url: Connections.listAllProducts);
      return List<Product>.generate(response.length, (index) => Product.fromMap(response[index]));
    } catch (e) {
      rethrow;
    }
  }
}
