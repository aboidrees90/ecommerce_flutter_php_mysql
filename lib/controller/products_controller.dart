import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/product_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController with StateMixin {
  late TextEditingController searchTerm;

  final RxList<Product> _searchResult = <Product>[].obs;

  List<Product> get searchResult => _searchResult;

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

  Future<List<Product>> search(String term) async {
    change(null, status: RxStatus.loading());
    final result = await ProductAPI.search(body: {'q': term});
    change(null, status: RxStatus.success());
    return result;
  }

  Future<List<Product>> getTrending() async => await ProductAPI.fetchTrending();

  Future<List<Product>> getAllProducts() async => await ProductAPI.fetchAll();
}
