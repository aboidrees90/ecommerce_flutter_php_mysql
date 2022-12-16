import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:ecommerce_php/model/cart.dart';
import 'package:ecommerce_php/services/cart_api.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  final RxList<Cart> _cartList = <Cart>[].obs;
  final RxList<int> _selectedProducts = <int>[].obs;
  final RxBool _isAllSelected = false.obs;
  final RxDouble _total = 0.0.obs;

  List<Cart> get cartList => _cartList;
  List<int> get selectedProductsInCartList => _selectedProducts;
  bool get isAllSelected => _isAllSelected.value;
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
  }

  _calculateTotalCost() {
    _total.value = 0;
    if (_selectedProducts.isNotEmpty) {
      for (var productInCart in _cartList) {
        if (_selectedProducts.contains(productInCart.id)) {
          _total.value += (productInCart.product!.price!) * double.parse(productInCart.quantity.toString());
        }
      }
    }
  }

  updateSelectedProduct(int selectedProductID) {
    if (_selectedProducts.contains(selectedProductID)) {
      _selectedProducts.remove(selectedProductID);
    } else {
      _selectedProducts.add(selectedProductID);
    }
    _calculateTotalCost();
    update();
  }

  setIsAllSelected() => _isAllSelected.value = !_isAllSelected.value;

  clearSelectedProducts() {
    _selectedProducts.clear();
    update();
  }
}
