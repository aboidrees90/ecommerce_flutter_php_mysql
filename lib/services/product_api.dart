import 'dart:convert';

import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/api.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  static Future<dynamic> _get({required String url}) async {
    try {
      var res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        if (!resBody['success']) {
          throw resBody['message'];
        } else {
          return resBody['data'];
        }
      } else {
        throw "Error: ${res.statusCode} - ${res.body}";
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Product?> addNew({required Map<String, dynamic> body}) async {
    try {
      final response = await API.post(url: Connections.addNewProduct, body: body);

      return Product.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Product>> getTrending() async {
    try {
      final response = await _get(url: Connections.listTrendingProducts);
      // List<Product> trending = [];
      // for (var product in (response as List)) {
      //   trending.add(Product.fromMap(product));
      // }
      // return trending;
      var products = response.toList();
      return List<Product>.generate(products.length, (index) => products[index]);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Product>> getAllProducts() async {
    try {
      final response = await _get(url: Connections.listAllProducts);
      List<Product> products = [];
      for (var product in (response as List)) {
        products.add(Product.fromMap(product));
      }
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
