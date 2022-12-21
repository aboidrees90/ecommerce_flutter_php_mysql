import 'package:get/state_manager.dart';

class OrderNowController extends GetxController {
  final RxString _deliverySys = 'QPost'.obs;
  final RxString _paymentSys = "Apple Pay".obs;

  String get deliverySys => _deliverySys.value;
  String get paymentSys => _paymentSys.value;

  setDeliverySys(String newDeliverySys) => _deliverySys.value = newDeliverySys;
  setPaymentSys(String newPaymentSys) => _paymentSys.value = newPaymentSys;
}
