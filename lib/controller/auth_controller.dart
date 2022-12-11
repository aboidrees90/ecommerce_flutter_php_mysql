import 'package:ecommerce_php/core/classes/rx_nullable.dart';
import 'package:ecommerce_php/model/user.dart';
import 'package:ecommerce_php/services/user_api.dart';
import 'package:ecommerce_php/services/user_cache.dart';
import 'package:get/get.dart';

abstract class AuthBase extends GetxController {
  User? get currentUser;

  Future<void> initializeAuth();

  Future<User?> signUp({required String email, required String password});

  Future<User?> signIn({required String email, required String password});

  Future<bool?> signOut();
}

class Auth extends AuthBase {
  final Rx<User?> _user = RxNullable<User?>().setNull();

  @override
  User? get currentUser => _user.value;

  bool get isAdmin => currentUser?.type == "admin";
  bool get isMod => currentUser?.type == "mode";
  bool get isUser => currentUser?.type == "user";

  @override
  Future<void> initializeAuth() async => _user.value = await UserCache.read();

  @override
  Future<User?> signUp({required String email, required String password}) async {
    try {
      _user.value = await UserAPI.createUserWithEmailAndPassword(email: email, password: password);
      return _user.value;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> signIn({required String email, required String password}) async {
    try {
      _user.value = await UserAPI.signInWithEmailAndPassword(email: email, password: password);
      return _user.value;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool?> signOut() async {
    var status = await UserCache.remove();
    if (status) _user.value = null;
    return _user.value == null;
  }
}
