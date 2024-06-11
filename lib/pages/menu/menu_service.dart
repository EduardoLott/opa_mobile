import 'package:http/http.dart' as http;
import 'package:opamobile/services/auth_service.dart';
import 'package:opamobile/services/configservice.dart';

class MenuService{

    static Future<dynamic> getMenu() async {
    try {
      final userToken = AuthService.getUserToken();
      final response = await http.get(
        Uri.parse(
            '${ConfigService.apiurl}l/product/'),
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