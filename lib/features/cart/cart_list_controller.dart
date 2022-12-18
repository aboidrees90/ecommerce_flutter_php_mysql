import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:ecommerce_php/model/cart.dart';
import 'package:ecommerce_php/services/cart_api.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  final RxList<Cart> _cartList = <Cart>[].obs;
  final RxList<int> _selectedItems = <int>[].obs;
  final RxBool _isAllItemsSelected = false.obs;
  final RxDouble _total = 0.0.obs;

  List<Cart> get cartList => _cartList;
  List<int> get selectedItemsInCartList => _selectedItems;
  bool get isAllItemsSelected => _isAllItemsSelected.value;
  double get total => _total.value;

  final Auth _auth = Get.put(Auth());

  @override
  onInit() {
    _getCurrentUserCartList();
    super.onInit();
  }

  _getCurrentUserCartList() async {
    final cartList = await CartAPI.fetchCurrentUserCartList(body: {"userID": _auth.currentUser!.id!.toString()});
    _cartList.value = cartList;
    _calculateTotalCost();
    update();
  }

  _calculateTotalCost() {
    _total.value = 0;
    if (_selectedItems.isNotEmpty) {
      for (var productInCart in _cartList) {
        if (_selectedItems.contains(productInCart.id)) {
          _total.value += (productInCart.product!.price!) * double.parse(productInCart.quantity.toString());
        }
      }
    }
  }

  toggleAllItemsSelection() {
    if (_isAllItemsSelected.value) {
      clearSelectedProducts();
    } else {
      for (var e in cartList) {
        (!_selectedItems.contains(e.id)) ? updateSelectedProduct(e.id!) : "";
      }
    }
    _calculateTotalCost();
  }

  updateSelectedProduct(int selectedProductID) {
    (_selectedItems.contains(selectedProductID)) ? _selectedItems.remove(selectedProductID) : _selectedItems.add(selectedProductID);
    _isAllItemsSelected.value = (_selectedItems.length == cartList.length) ? true : false;

    _calculateTotalCost();

    update();
  }

  setIsAllSelected() => _isAllItemsSelected.value = !_isAllItemsSelected.value;

  clearSelectedProducts() {
    _selectedItems.clear();
    _isAllItemsSelected.value = false;
    update();
  }

  clearSelectedItems() async {
    for (var item in _selectedItems) {
      await CartAPI.delete(body: {'id': item.toString()});
    }

    _getCurrentUserCartList();
    if (_selectedItems.isEmpty) {
      Get.snackbar('Success', "Done");
    }

    update();
  }
}
