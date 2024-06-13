import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:opamobile/services/auth_service.dart';
import 'package:opamobile/services/configservice.dart';

class TokenPageService {
  static Future<dynamic> tokenToBack(String token) async {
    try {
      var tokenint = int.parse(token);
      final userToken = AuthService.getUserToken();
      final userId = AuthService.getUserId();
      final response = await http.post(
          Uri.parse('${ConfigService.apiurl}/table/add-customer'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $userToken', 
          },
          body: jsonEncode({
            'tableId': tokenint,
            'customerId': userId
            })
          );
      return response;
    } catch (e) {
      print("$e");
    }
  }
}
