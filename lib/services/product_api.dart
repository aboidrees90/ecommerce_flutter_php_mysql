import 'dart:convert';

import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/core/exceptions/auth.dart';
import 'package:ecommerce_php/model/product.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  static Future<dynamic> _post({required String url, required Map<String, dynamic> body}) async {
    try {
      var res = await http.post(Uri.parse(url), body: body);

      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        if (!resBody['success']) {
          if (resBody['message'] == "ALL_FIELDS_REQUIRED") throw AllFieldsRequired();
          throw DatabaseErrorException();
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

  static Future<Map<String, dynamic>> _uploadImage(path) async {
    var request = http.MultipartRequest("POST", Uri.parse(Connections.uploadImg));

    request.fields['submit'] = "Ok";

    var imgFile = await http.MultipartFile.fromPath('image', path, filename: "${DateTime.now().microsecondsSinceEpoch.toString()}.jpeg");

    request.files.add(imgFile);

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    return json.decode(String.fromCharCodes(responseData));
  }

  static Future<Product?> saveItem(Product product, String imagePath) async {
    final imageUploadResponse = await _uploadImage(imagePath);

    if (imageUploadResponse['success'] == true) {
      try {
        final response = await _post(
          url: Connections.productSave,
          body: product.copyWith(image: imageUploadResponse['data']['filename']).toMap(),
        );

        return Product.fromJson(response);
      } catch (e) {
        rethrow;
      }
    } else {
      throw "Image upload failure";
    }
  }

  static Future<List<Product>> getTrending() async {
    try {
      final response = await _get(url: Connections.trendingProducts);
      List<Product> trending = [];
      for (var product in (response as List)) {
        trending.add(Product.fromMap(product));
      }
      return trending;
    } catch (e) {
      rethrow;
    }
  }
}
