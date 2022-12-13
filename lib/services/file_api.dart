import 'dart:convert';

import 'package:ecommerce_php/core/constants/connection.dart';
import 'package:http/http.dart' as http;

class FileAPI {
  static Future<Map<String, dynamic>> upload({required String path}) async {
    var request = http.MultipartRequest("POST", Uri.parse(Connections.fileUpload));

    request.fields['submit'] = "Ok";

    var imgFile = await http.MultipartFile.fromPath('file', path, filename: "${DateTime.now().microsecondsSinceEpoch.toString()}.jpeg");

    request.files.add(imgFile);

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    return json.decode(String.fromCharCodes(responseData));
  }
}
