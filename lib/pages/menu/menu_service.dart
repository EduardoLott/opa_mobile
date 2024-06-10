import 'package:http/http.dart' as http;
import 'package:opamobile/services/auth_service.dart';

class MenuService{

    static Future<dynamic> getMenu() async {
    try {
      final userToken = AuthService.getUserToken();
      final response = await http.get(
        Uri.parse(
            'http://192.168.0.36:3000/product/'),
        headers: <String, String>{
          'Content-Type':'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userToken', 
        }
      );
      return response;
    }
    catch(e){
      print("$e");
    }
  }
}