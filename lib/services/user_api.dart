import 'dart:convert';

import 'package:ecommerce_php/constants/connection.dart';
import 'package:ecommerce_php/constants/exceptions/auth.dart';
import 'package:ecommerce_php/model/user.dart';
import 'package:ecommerce_php/services/user_cache.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  static Future<User?> _request({required String url, required Map<String, dynamic> body}) async {
    try {
      var res = await http.post(Uri.parse(url), body: body);

      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        if (!resBody['success']) {
          if (resBody['message'] == "EMAIL_ALREADY_EXISTS") throw EmailAlreadyUsed;
          if (resBody['message'] == "ALL_FIELDS_REQUIRED") throw AllFieldsRequired;
          if (resBody['message'] == "USER_NOT_EXISTS") throw UserNotExists;
          throw DatabaseError;
        } else {
          return User.fromMap(resBody['data']);
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  static Future<User?> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      var user = await _request(
        url: API.signUp,
        body: {"email": email, "password": password},
      );

      // Save user in the shared preference cache
      if (user == null) throw UserNotExists;

      UserCache.save(user);
    } catch (e) {
      rethrow;
    }
    return null;
  }

  static Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      var user = await _request(
        url: API.signIn,
        body: {"email": email, "password": password},
      );

      // Save user in the shared preference cache
      if (user == null) throw UserNotExists;

      UserCache.save(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
