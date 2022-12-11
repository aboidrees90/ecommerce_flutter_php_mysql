import 'dart:convert';

import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:ecommerce_php/core/exceptions/auth.dart';
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
          if (resBody['message'] == "USER_NOT_EXISTS") throw UserNotExistsException;
          throw DatabaseErrorException;
        } else {
          return User.fromMap(resBody['data']);
        }
      } else {
        throw "Error: ${res.statusCode} - ${res.body}";
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<User?> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      var user = await _request(url: Connections.signUp, body: {"email": email, "password": password});

      // Save user in the shared preference cache
      if (user != null) UserCache.save(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  static Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      var user = await _request(url: Connections.signIn, body: {"email": email, "password": password});

      // Save user in the shared preference cache
      if (user == null) throw UserNotExistsException;

      UserCache.save(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
