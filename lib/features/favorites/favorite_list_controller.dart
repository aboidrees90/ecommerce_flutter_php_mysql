import 'dart:developer';

import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:ecommerce_php/model/favorite.dart';
import 'package:ecommerce_php/services/favorite_api%20.dart';
import 'package:get/get.dart';

class FavoriteListController extends GetxController {
  final RxList<Favorite> _favoriteList = <Favorite>[].obs;
  final RxList<int> _selectedFavoriteItem = <int>[].obs;
  final RxBool _isAllItemsSelected = false.obs;
  final RxDouble _total = 0.0.obs;

  List<Favorite> get favoriteLits => _favoriteList;
  List<int> get selectedFavoriteItem => _selectedFavoriteItem;
  bool get isAllItemsSelected => _isAllItemsSelected.value;
  double get total => _total.value;

  final Auth _auth = Get.put(Auth());

  @override
  onInit() {
    _getCurrentUserFavoriteList();
    super.onInit();
  }

  _getCurrentUserFavoriteList() async {
    try {
      FavoriteAPI.fetchCurrentUserFavoriteList(body: {
        "userID": _auth.currentUser!.id!.toString(),
      }).then(_favoriteList);

      update();
    } catch (e) {
      log(e.toString());
    }
  }

  toggleFavoriteItemsSelection() {
    if (_isAllItemsSelected.value) {
      clearSelection();
    } else {
      for (var favorite in favoriteLits) {
        (!_selectedFavoriteItem.contains(favorite.id)) ? updateSelectedFavoriteItems(favorite.id) : "";
      }
    }
  }

  updateSelectedFavoriteItems(int favoriteID) {
    (_selectedFavoriteItem.contains(favoriteID)) ? _selectedFavoriteItem.remove(favoriteID) : _selectedFavoriteItem.add(favoriteID);
    _isAllItemsSelected.value = (_selectedFavoriteItem.length == favoriteLits.length) ? true : false;

    update();
  }

  sellectAll() {
    for (var favorite in _favoriteList) {
      _selectedFavoriteItem.add(favorite.id);
    }
    _isAllItemsSelected.value = true;
  }

  clearSelection() {
    _selectedFavoriteItem.clear();
    _isAllItemsSelected.value = false;
  }

  deleteFavoriteByID(int favoriteID) async {
    try {
      await FavoriteAPI.delete(body: {
        'id': favoriteID.toString(),
      });
      _getCurrentUserFavoriteList();

      update();
    } catch (e) {
      log(e.toString());
    }
  }

  deleteAllSelected() async {
    for (int favoriteID in _selectedFavoriteItem) {
      await deleteFavoriteByID(favoriteID);
    }
  }
}
