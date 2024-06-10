import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:opamobile/services/auth_service.dart';

class TokenPageService {
  static Future<dynamic> tokenToBack(String token) async {
    try {
      var tokenint = int.parse(token);
      final userToken = AuthService.getUserToken();
      final response = await http.post(
          Uri.parse('http://192.168.0.36:3000/table/add-customer'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $userToken', // Passar o token nos headers
          },
          body: jsonEncode({'tableId': tokenint, 'customerId': 1}));
      return response;
    } catch (e) {
      print("$e");
    }
  }
}
