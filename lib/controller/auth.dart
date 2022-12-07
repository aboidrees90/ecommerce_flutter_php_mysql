import 'dart:developer';

import 'package:ecommerce_php/constants/exceptions/auth.dart';
import 'package:ecommerce_php/constants/routes.dart';
import 'package:ecommerce_php/model/user.dart';
import 'package:ecommerce_php/services/user_api.dart';
import 'package:ecommerce_php/services/user_cache.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class AuthBase extends GetxController {
  User? get currentUser;

  loadCachedUserInfo();

  signUp({required String email, required String password});

  signIn({required String email, required String password});

  signOut();

  //
  goToDashBoard();
}

class Auth extends AuthBase {
  final Rx<User?> _user = RxNullable<User?>().setNull();

  @override
  User? get currentUser => _user.value;

  @override
  loadCachedUserInfo() async {
    User? userInfo = await UserCache.read();
    if (userInfo != null) _user.value = userInfo;
  }

  @override
  signUp({required String email, required String password}) async {
    try {
      return UserAPI.createUserWithEmailAndPassword(email: email, password: password);
    } on UserNotExists {
      Fluttertoast.showToast(msg: "User with this credentials is not exists");
    } on DatabaseError {
      Fluttertoast.showToast(msg: "System failure, please, contact support");
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  signIn({required String email, required String password}) async {
    try {
      return await UserAPI.signInWithEmailAndPassword(email: email, password: password);
    } on UserNotExists {
      Fluttertoast.showToast(msg: "User with this credentials is not exists");
    } on DatabaseError {
      Fluttertoast.showToast(msg: "System failure, please, contact support");
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  signOut() async {
    var status = await UserCache.remove();
    if (status) _user.value = null;
  }

  @override
  goToDashBoard() => Get.toNamed(AppRoutes.userDashboard);
}

class RxNullable<T> {
  Rx<T> setNull() => (null as T).obs;
}
