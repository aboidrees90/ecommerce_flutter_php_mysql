import 'package:get/get.dart';

class RxNullable<T> {
  Rx<T> setNull() => (null as T).obs;
}
