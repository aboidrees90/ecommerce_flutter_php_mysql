import 'dart:developer' show log;

import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class SignUpBase extends GetxController {
  signUp();

  //
  goToSignIn();
  goToHomeScreen();
}

class SignUpController extends SignUpBase {
  late TextEditingController email;
  late TextEditingController password;

  final register = Get.find<Auth>().signUp;

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
  signUp() async {
    try {
      final user = await register(email: email.text.trim(), password: password.text.trim());

      if (user != null) {
        goToHomeScreen();
      } else {
        Fluttertoast.showToast(msg: "User with this credentials is not exists");
      }
    } catch (e, s) {
      if (e.toString() == "EmailAlreadyUsed") {
        Fluttertoast.showToast(msg: "This email is already exists");
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
  goToSignIn() => Get.offNamed(AppRoutes.signIn);

  @override
  goToHomeScreen() => Get.offNamed(AppRoutes.home);
}
