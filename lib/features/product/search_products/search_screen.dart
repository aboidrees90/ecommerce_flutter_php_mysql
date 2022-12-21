import 'package:ecommerce_php/controller/products_controller.dart';
import 'package:ecommerce_php/features/product/display_products/widgets/product_horizontal_card.dart';
import 'package:ecommerce_php/features/product/search_products/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends SearchDelegate {
  final productsController = Get.find<ProductsController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear, color: Get.theme.colorScheme.primary), onPressed: () => query = '')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back, color: Get.theme.colorScheme.primary), onPressed: Get.back);
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) return emptyContainer("Search term must be longer than two letters.");
    return SizedBox(
      height: Get.size.height,
      child: GetBuilder<SearchController>(
        builder: (searchController) {
          if (searchController.result.isEmpty) {
            return const Center(child: Text("No Results Found."));
          } else {
            return ListView.builder(
              controller: searchController.scrollController,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: searchController.result.length,
              itemBuilder: (context, index) {
                return ProductHorizontalCard(
                  height: 120,
                  width: 140,
                  product: searchController.result[index],
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return emptyContainer("Write a keyword to search for products.");

    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (searchController) {
        searchController.search(query);

        return ListView.separated(
          itemCount: searchController.suggestions.length,
          itemBuilder: (context, index) => ListTile(title: Text(searchController.suggestions[index].name!)),
          separatorBuilder: (BuildContext context, int index) => Container(
            width: double.infinity,
            height: 1,
            color: Colors.white12,
          ),
        );
      },
    );
  }

  Center emptyContainer(msg) => Center(child: Text(msg));
}
