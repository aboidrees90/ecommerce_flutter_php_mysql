import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/product_api.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController with StateMixin {
  Future<List<Product>> getTrending() async => await ProductAPI.fetchTrending();

  Future<List<Product>> getAllProducts() async => await ProductAPI.fetchAll();

  Future<List<Product>> getNextPageProducts({int limit = 5, int offset = 0}) async {
    return await ProductAPI.fetchLimited(body: {
      'offset': offset.toString(),
      'limit': limit.toString(),
    });
  }
}
