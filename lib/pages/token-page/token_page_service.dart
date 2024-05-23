import 'dart:convert';

import 'package:http/http.dart' as http;
class TokenPageService{

  static Future<dynamic> tokenToBack(String token) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://192.168.0.36:3000/auth/login'),
        headers: <String, String>{
          'Content-Type':
              'application/json; charset=UTF-8',
        },
        body: jsonEncode(token)
      );
      return response;
    }
    catch(e){
      print("$e");
    }
  }
}