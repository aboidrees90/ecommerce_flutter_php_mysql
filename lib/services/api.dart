import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<dynamic> post({required String url, required Map<String, dynamic> body}) async {
    try {
      var res = await http.post(Uri.parse(url), body: body);

      if (res.statusCode == 200) {
        var resBody = json.decode(res.body);

        if (!resBody['success']) {
          throw resBody['message'];
        } else {
          return resBody['data'];
        }
      } else {
        throw "Error: ${res.statusCode} - ${res.body}";
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> get({required String url}) async {
    try {
      var res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        var resBody = json.decode(res.body);
        if (!resBody['success']) {
          throw resBody['message'];
        } else {
          return resBody['data'];
        }
      } else {
        throw "Error: ${res.statusCode} - ${res.body}";
      }
    } catch (e) {
      rethrow;
    }
  }
}
