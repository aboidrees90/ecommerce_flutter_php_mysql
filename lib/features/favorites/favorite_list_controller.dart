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

  List<Favorite> get favoriteList => _favoriteList;
  List<int> get selectedFavoriteItem => _selectedFavoriteItem;
  bool get isAllItemsSelected => _isAllItemsSelected.value;
  double get total => _total.value;

  final currentUser = Get.find<Auth>().currentUser;

  @override
  onInit() async {
    await _getCurrentUserFavoriteList();

    super.onInit();
  }

  _getCurrentUserFavoriteList() async {
    _favoriteList.clear();
    try {
      FavoriteAPI.fetchCurrentUserFavoriteList(body: {
        "userID": currentUser!.id!.toString(),
      }).then(_favoriteList);
    } catch (e) {
      log(e.toString());
    }
  }

  // Favorite selection
  selectAllFavorites() {
    if (_isAllItemsSelected.value) {
      unSelectAllFavorites();
    } else {
      for (var favorite in favoriteList) {
        if (!_selectedFavoriteItem.contains(favorite.id)) {
          _selectedFavoriteItem.add(favorite.id);
        }
      }
    }
  }

  updateSelectedFavoriteItems(int favoriteID) {
    (_selectedFavoriteItem.contains(favoriteID)) ? _selectedFavoriteItem.remove(favoriteID) : _selectedFavoriteItem.add(favoriteID);
    _isAllItemsSelected.value = (_selectedFavoriteItem.length == favoriteList.length) ? true : false;
  }

  unSelectAllFavorites() {
    _selectedFavoriteItem.clear();
    _isAllItemsSelected.value = false;
  }

  // Favorite CURD
  deleteFavoriteByID(int favoriteID) async {
    try {
      await FavoriteAPI.delete(body: {'id': favoriteID.toString()});
      _getCurrentUserFavoriteList();
    } catch (e) {
      log(e.toString());
    }
  }

  deleteAllSelected() async {
    for (int favoriteID in _selectedFavoriteItem) {
      await deleteFavoriteByID(favoriteID);
    }
  }

  Future addToFavorites(int productID) async {
    try {
      await FavoriteAPI.add(body: {
        'userID': currentUser!.id!.toString(),
        'productID': productID.toString(),
      });
      await _getCurrentUserFavoriteList();
    } catch (e) {
      log(e.toString());
      Get.snackbar("Failure", "didn't added to your favorites");
    }
  }

  Future removeFromFavorites(int productID) async {
    try {
      await FavoriteAPI.delete(body: {
        'userID': currentUser!.id!.toString(),
        'productID': productID.toString(),
      });
      await _getCurrentUserFavoriteList();
    } catch (e) {
      log(e.toString());
      Get.snackbar("Failure", "didn't removed from your favorites");
    }
  }

  Future<bool> isFavorite(int productID) async {
    try {
      return await FavoriteAPI.validateFavorite(body: {
        'userID': currentUser!.id!.toString(),
        'productID': productID.toString(),
      });
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
