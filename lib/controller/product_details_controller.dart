import 'package:get/state_manager.dart';

class ProductDetailsController extends GetxController {
  final RxInt _quantity = 1.obs;
  final RxInt _size = 0.obs;
  final RxInt _color = 0.obs;
  final RxBool _isFavorite = false.obs;

  int get quantity => _quantity.value;
  int get size => _size.value;
  int get color => _color.value;
  bool get isFavorite => _isFavorite.value;

  setQuantity(int quantity) => _quantity.value = quantity;
  setSize(int size) => _size.value = size;
  setColor(int color) => _color.value = color;
  setIsFavorite(bool isFavorite) => _isFavorite.value = isFavorite;
}
