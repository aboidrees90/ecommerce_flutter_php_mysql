import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/product_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ProductsBase extends GetxController {
  Future<List<Product>> getTrending();
  Future<List<Product>> getAllProducts();
}

class ProductsController extends ProductsBase {
  late TextEditingController searchTerm;

  @override
  void onInit() {
    searchTerm = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchTerm.dispose();
    super.dispose();
  }

  @override
  Future<List<Product>> getTrending() async => await ProductAPI.getTrending();

  @override
  Future<List<Product>> getAllProducts() async => await ProductAPI.getAllProducts();
}
