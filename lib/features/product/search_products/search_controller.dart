import 'dart:developer';

import 'package:ecommerce_php/model/product.dart';
import 'package:ecommerce_php/services/product_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  String _term = '';

  final List<Product> result = <Product>[];
  final List<Product> suggestions = <Product>[];

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    log('about to load scrolling Listener');
    scrollingListener();

    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future loadMoreSearchResults(String term, {int limit = 5, int offset = 0}) async {
    try {
      ProductAPI.search(body: {
        'q': term,
        'limit': limit.toString(),
        'offset': offset.toString(),
      }).then((nextPage) {
        if (nextPage.isNotEmpty) result.addAll(nextPage.toList());
        update();
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future search(String term, {int limit = 7, int offset = 0}) async {
    result.clear();
    ProductAPI.search(body: {
      'q': term,
      'limit': limit.toString(),
      'offset': offset.toString(),
    }).then((searchResult) {
      suggestions.clear();
      if (searchResult.isNotEmpty) suggestions.addAll(searchResult.toList());
    });
    if (suggestions.isNotEmpty) result.addAll(suggestions.toList());
    _term = term;
    update();
  }

  scrollingListener() {
    scrollController.addListener(() {
      log(result.length.toString());
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        loadMoreSearchResults(_term, offset: result.length - 1);
        update();
      }
    });
  }
}
