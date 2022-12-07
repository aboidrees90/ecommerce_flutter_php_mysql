import 'dart:developer';

import 'package:ecommerce_php/constants/exceptions/auth.dart';
import 'package:ecommerce_php/constants/routes.dart';
import 'package:ecommerce_php/controller/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class SignUpBase extends GetxController {
  signUp();

  //
  goToSignIn();
  goToDashBoard();
}

class SignUpController extends SignUpBase {
  late TextEditingController email;
  late TextEditingController password;

  final _auth = Get.find<Auth>();

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
      _auth.signUp(email: email.text.trim(), password: password.text.trim());
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
  goToSignIn() => Get.toNamed(AppRoutes.signIn);

  @override
  goToDashBoard() => Get.toNamed(AppRoutes.userDashboard);
}
