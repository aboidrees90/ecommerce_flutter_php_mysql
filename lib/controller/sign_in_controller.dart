import 'dart:developer' show log;

import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class SignInBase extends GetxController {
  signIn();

  //
  goToSignUp();
  goToHomeScreen();
}

class SignInController extends SignInBase {
  late TextEditingController email;
  late TextEditingController password;

  final login = Get.put(Auth()).signIn;

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
      final user = await login(email: email.text.trim(), password: password.text.trim());
      if (user != null) {
        goToHomeScreen();
      } else {
        Fluttertoast.showToast(msg: "User with this credentials is not exists");
      }
    } catch (e, s) {
      if (e.toString() == "UserNotExistsException") {
        Fluttertoast.showToast(msg: "User with this credentials is not exists");
        return;
      } else if (e.toString() == "DatabaseErrorException") {
        Fluttertoast.showToast(msg: "System failure, please, contact support");
        return;
      }
      log("${e.toString()}, ${s.toString()}");
      Fluttertoast.showToast(msg: "Unknown Error");
    }
  }

  @override
  goToSignUp() => Get.offNamed(AppRoutes.signUp);

  @override
  goToHomeScreen() => Get.offNamed(AppRoutes.home);
}
