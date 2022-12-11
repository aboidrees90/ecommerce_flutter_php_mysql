import 'dart:developer' show log;

import 'package:ecommerce_php/controller/auth.dart';
import 'package:ecommerce_php/core/constants/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class SignInBase extends GetxController {
  signIn();

  //
  goToSignUp();
  goToAdminSignIn();
  goToHomeScreen();
}

class SignInController extends SignInBase {
  late TextEditingController email;
  late TextEditingController password;

  final Auth _auth = Get.put(Auth());

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
      final user = await _auth.signIn(email: email.text.trim(), password: password.text.trim());
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
  goToAdminSignIn() => Get.offNamed(AppRoutes.adminSignIn);

  @override
  goToHomeScreen() {
    log(_auth.currentUser.toString());
    Get.offNamed(AppRoutes.home);
  }
}
