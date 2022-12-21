import 'package:ecommerce_php/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends SearchDelegate {
  final productsController = Get.find<ProductsController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[Center(child: Text("Search term must be longer than two letters."))],
      );
    }

    productsController.search(query);
    return Column(
      children: <Widget>[
        productsController.obx(
          (state) {
            var results = productsController.searchResult;
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) => ListTile(title: Text(results[index].name!)),
            );
          },
          onLoading: const Center(child: CircularProgressIndicator()),
        ),

        // Obx(
        //   () {
        //     if (!productsController.searchResult) {
        //       return const ;
        //     } else if (productsController.searchResult.isEmpty) {
        //       return const Center(child: Text("No Results Found."));
        //     } else {
        //       var results = productsController.searchResult;
        //       return ListView.builder(
        //         itemCount: results.length,
        //         itemBuilder: (context, index) => ListTile(title: Text(results[index].name!)),
        //       );
        //     }
        //   },
        // ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
