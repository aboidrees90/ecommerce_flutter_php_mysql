import 'dart:developer' show log;

import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/core/exceptions/auth.dart';
import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class AdminSignInBase extends GetxController {
  signIn();

  //
  goToSignIn();
  goToHomeScreen();
}

class AdminSignInController extends AdminSignInBase {
  late TextEditingController email;
  late TextEditingController password;

  final login = Get.find<Auth>().signIn;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  signIn() async {
    try {
      await login(email: email.text.trim(), password: password.text.trim());

      goToHomeScreen();
    } on UserNotExistsException {
      Fluttertoast.showToast(msg: "User with this credentials is not exists");
    } on DatabaseErrorException {
      Fluttertoast.showToast(msg: "System failure, please, contact support");
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  goToSignIn() => Get.offNamed(AppRoutes.signIn);

  @override
  goToHomeScreen() => Get.offNamed(AppRoutes.home);
}
