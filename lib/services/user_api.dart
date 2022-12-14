import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/model/user.dart';
import 'package:ecommerce_php/services/api.dart';
import 'package:ecommerce_php/services/user_cache.dart';

class UserAPI {
  static Future<User?> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      var response = await API.post(url: Connections.signUp, body: {"email": email, "password": password});

      // Save user in the shared preference cache and return
      try {
        final user = User.fromMap(response);
        UserCache.save(user);
        return user;
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      var response = await API.post(url: Connections.signIn, body: {"email": email, "password": password});
      // Save user in the shared preference cache and return
      try {
        final user = User.fromMap(response);
        UserCache.save(user);
        return user;
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}
