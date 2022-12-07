import 'dart:developer';

import 'package:ecommerce_php/constants/exceptions/auth.dart';
import 'package:ecommerce_php/constants/routes.dart';
import 'package:ecommerce_php/controller/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class SignInBase extends GetxController {
  signIn();

  //
  goToSignUp();
  goToDashBoard();
  goToAdminSignIn();
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
      _auth.signIn(email: email.text.trim(), password: password.text.trim());
      goToDashBoard();
    } on UserNotExists {
      Fluttertoast.showToast(msg: "User with this credentials is not exists");
    } on DatabaseError {
      Fluttertoast.showToast(msg: "System failure, please, contact support");
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  goToSignUp() => Get.toNamed(AppRoutes.signUp);

  @override
  goToDashBoard() {
    Get.toNamed(AppRoutes.userDashboard);
  }

  @override
  goToAdminSignIn() => Get.toNamed(AppRoutes.adminSignIn);
}
