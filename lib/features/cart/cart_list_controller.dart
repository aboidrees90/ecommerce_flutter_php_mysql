import 'package:ecommerce_php/model/cart.dart';
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

  setList(List<Cart> list) => _cartList.value = list;

  updateSelectedProduct(int selectedProductID) {
    if (_selectedProducts.contains(selectedProductID)) {
      _selectedProducts.remove(selectedProductID);
    } else {
      _selectedProducts.add(selectedProductID);
    }
    update();
  }

  removeSelectedProduct(int selectedProduct) {
    _selectedProducts.remove(selectedProduct);
    update();
  }

  setIsAllSelected() => _isAllSelected.value = !_isAllSelected.value;

  clearSelectedProducts() {
    _selectedProducts.clear();
    update();
  }

  setTotal(double total) => _total.value = total;
}
